# frozen_string_literal: true

module ResponCore
  # github module
  class Github
    attr_accessor :connection

    def initialize
      # Octokit.configure do |c|
      #   c.auto_paginate = true
      # end

      self.connection ||= Octokit::Client.new(
        access_token: ENV['GITHUB_ACCESS_TOKEN']
      )
    end
  end
end
