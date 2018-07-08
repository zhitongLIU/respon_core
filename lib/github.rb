module ResponCore
  # github module
  module Github
    def self.connection
      # Octokit.configure do |c|
      #   c.auto_paginate = true
      # end

      @@conn ||= Octokit::Client.new(
        access_token: ENV['GITHUB_ACCESS_TOKEN']
      )
    end
  end
end
