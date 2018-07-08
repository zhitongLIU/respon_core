module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class RemainRequests < Operation
      def execute
        client = Github.connection
        now = Time.now

        results = { no_reviewers: [] }
        repo_list.each do |repo|
          puts "processing repo #{repo}"
          client.pull_requests(repo, per_page: pr_count).each do |pull_request|
            requested_reviewers = pull_request[:requested_reviewers]
            res = {
              title: pull_request[:title],
              url: pull_request[:url],
              repo: repo,
              number: pull_request[:number],
              last_update: "#{(now - pull_request[:updated_at]).to_i / 86_400} days ago"
            }
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
    end
  end
end
