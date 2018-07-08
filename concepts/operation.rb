module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class Operation
      attr_accessor :repo_list, :reviewers, :pr_count

      def initialize(repo_list, reviewers, pr_count=100)
        self.repo_list = repo_list
        self.reviewers = reviewers || []
        self.reviewers = self.reviewers.map(&:downcase)
        self.pr_count = pr_count
      end

      def execute
        raise 'Need to be implement'
      end
    end
  end
end

