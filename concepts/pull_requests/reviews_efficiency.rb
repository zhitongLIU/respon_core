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

            reviews = user_reviews_submitted_at_map(requested_reviews)

            reviews.map do |login, summited_at|
              next unless summited_at && (reviewers.empty? || reviewers.include?(login))
              results[login] ||= []
              results[login] << fill_info(repo, pull_request)
            end
          end
        end

        results
      end

      def user_reviews_submitted_at_map(requested_reviews)
        requested_reviews.map do |rr|
          { rr[:user][:login] => rr[:submitted_at] }
        end
      end

      def fill_info(repo, pull_request)
        {
          title: pull_request[:title],
          url: pull_request[:url],
          repo: repo,
          number: pull_request[:number],
          time_for_approved: ((summited_at - pull_request.created_at) / 3600.0).round(2)
        }
      end
    end
  end
end
