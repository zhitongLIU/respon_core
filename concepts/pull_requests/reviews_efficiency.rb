module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class ReviewsEfficiency < Operation
      def execute
        client = Github.connection

        results = {}
        repo_list.each do |repo|
          # puts "processing repo #{repo}"
          client.pull_requests(repo, { state: 'closed', per_page: pr_count }).each do |pull_request|
            requested_reviews = client.pull_request_reviews(repo, pull_request.number)

            reviews = {}
            requested_reviews.each do |rr|
              login = rr[:user][:login]
              reviews[login] = rr[:submitted_at]
            end

            reviews.map do |login, summited_at|
              if summited_at && (reviewers.empty? || reviewers.include?(login))
                res = {
                  title: pull_request[:title],
                  url: pull_request[:url],
                  repo: repo,
                  number: pull_request[:number],
                  time_for_approved: ((summited_at - pull_request.created_at)/3600.0).round(2)
                }
                results[login] ||= []
                results[login] += [res]
              end
            end
          end
        end

        results
      end
    end
  end
end
