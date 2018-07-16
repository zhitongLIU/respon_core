# frozen_string_literal: true

module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class RemainRequests < Operation
      accept_params :repo_list, :reviewers, :pr_count, :client, :options

      def setup
        self.reviewers ||= []
        self.reviewers = self.reviewers.map(&:downcase)
        self.pr_count ||= 100
      end

      def execute
        @now = Time.now

        results = { no_reviewers: [] }
        repo_list.each do |repo|
          puts "processing repo #{repo}"
          client.pull_requests(repo, per_page: pr_count).each do |pull_request|
            requested_reviewers = pull_request[:requested_reviewers]
            res = fill_info(repo, pull_request)
            requested_reviewers.map do |pr_reviewer|
              if reviewers.empty? || reviewers.include?(pr_reviewer[:login].downcase)
                results[pr_reviewer[:login]] ||= []
                results[pr_reviewer[:login]] += [res]
              end
            end

            results[:no_reviewers] += [res] if requested_reviewers.empty? && reviewers.empty?
          end
        end

        results
      end

      def fill_info(repo, pull_request)
        {
          title: pull_request[:title],
          url: pull_request[:url],
          repo: repo,
          number: pull_request[:number],
          last_update: "#{(@now - pull_request[:updated_at]).to_i / 86_400} days ago"
        }
      end
    end
  end
end
