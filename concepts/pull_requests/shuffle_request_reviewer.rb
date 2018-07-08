# frozen_string_literal: true

module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class ShuffleRequestReviewer < Operation
      MODE = %w[remain_prs].freeze
      accept_params :exclude_reviewers, :repo_list, :pr_count, :client, :options, :pull_requests, :reviewers, :mode

      def setup
        self.exclude_reviewers ||= []
        self.pr_count ||= 100
      end

      def setup_reviewers(organ_name)
        client.auto_paginate = true
        reviewers ||= client.organization_members(organ_name).map(&:login) if organ_name && !organ_name.empty?
        reviewers -= exclude_reviewers # TODO: remove not exist user
        client.auto_paginate = false
        reviewers
      end

      def valid_params
        errors << "mode should be one of #{MODE}" if mode && !MODE.include?(mode)
      end

      def execute
        repo_list.map do |repo|
          organ_name = repo.split('/').first
          begin
            client.organization(organ_name)
          rescue Octokit::NotFound
            return
          end

          reviewers = setup_reviewers(organ_name)

          case mode
          when 'remain_prs'
            reassign_by_remains_prs(repo, reviewers)
          else
            reassign_by_remains_prs(repo, reviewers)
          end
        end
      end

      private

      def reassign_by_remains_prs(repo, reviewers)
        users_remain_prs = RemainRequests.new(repo_list: [repo], client: client, pr_count: pr_count, reviewers: reviewers).execute
        users_remain_prs.delete :no_reviewers
        # repo_pull_request_numbers = pull_requests || client.pull_requests(repo, per_page: pr_count).map(&:number).shift(pr_count)
        repo_pull_request_numbers = pull_requests || users_remain_prs.values.flatten.uniq

        # users_remain_prs.inject(0) { |sum, record| sum += record[1].count } / (users_remain_prs.keys.count - 1)
        min_reviews_to_assign = min_reviews_nb(repo_pull_request_numbers.count, reviewers.count)

        users_prs_to_reassign = shuffle_users_prs_to_reassign(users_remain_prs, min_reviews_to_assign)

        # TODO: unassign with users_prs_to_reassign
        # TODO: assign with users_prs_to_reassign
        prs_to_assign = users_prs_to_reassign.values.flatten.uniq

        reviewers_count = reviewers.count
        # TODO: review this
        users_to_reassign = (reviewers - users_remain_prs.keys).sample(reviewers_count)
        # TODO
        diff = prs_to_assign.count - users_to_reassign.count
        diff&.times { |_pr| users_to_reassign << reviewers[rand(reviewers_count)] }

        result = assign_prs(prs_to_assign, users_to_reassign)
        # puts 'min pr'
        # puts min_reviews_to_assign
        # puts prs_to_assign
        # puts users_to_reassign

        { repo.to_s => result }
      end

      def min_reviews_nb(total_todo, reviewers_count)
        avg = total_todo / reviewers_count
        avg > 0 ? avg : 1
      end

      def shuffle_users_prs_to_reassign(users_remain_prs, min_reviews_to_assign)
        users_prs_to_reassign = {}
        users_remain_prs.each do |user, remain_prs|
          diff = remain_prs.count - min_reviews_to_assign
          next unless diff > 0
          # prs_to_reassign = remain_prs.pop(diff)
          prs_to_reassign = remain_prs.sample(diff)
          users_remain_prs[user] -= prs_to_reassign

          users_prs_to_reassign[user] = prs_to_reassign
        end

        users_prs_to_reassign
      end

      def assign_prs(prs_to_assign, users_to_reassign)
        result = {}
        index = 0
        users_to_reassign.each do |user|
          break unless prs_to_assign[index]
          # result[user] = prs_to_assign.shift
          result[user] ||= []
          result[user] << prs_to_assign[index]
          index += 1
        end

        result
      end
    end
  end
end
