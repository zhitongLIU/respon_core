# frozen_string_literal: true

module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class ReviewsEfficiency < Operation
      accept_params :repo_list, :reviewers, :pr_count, :client, :options

      def setup
        self.reviewers ||= []
        self.reviewers = self.reviewers.map(&:downcase)
        self.pr_count ||= 100
      end

      def execute
        results = {}

        repo_list.each do |repo|
          puts "processing repo #{repo}"

          client.pull_requests(repo, state: 'closed', per_page: pr_count).each do |pull_request|
            requested_reviews = client.pull_request_reviews(repo, pull_request.number)

            requested_reviews.map do |review|
              login = review[:user][:login]
              submitted_at = review[:submitted_at]
              next unless submitted_at && (reviewers.empty? || reviewers.include?(login))
              results[login] ||= []
              results[login] << fill_info(repo, pull_request, review)
            end
          end
        end

        results
      end

      def fill_info(repo, pull_request, review)
        {
          title: pull_request[:title],
          url: pull_request[:html_url],
          repo: repo,
          number: pull_request[:number],
          time_for_approved: ((review[:submitted_at] - pull_request.created_at) / 3600.0).round(2)
        }
      end
    end
  end
end
