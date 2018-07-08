# frozen_string_literal: true

module ResponCore
  module Formators
    module Cli
      module PullRequests
        # operation to give reviewers of pull requests
        module ReviewsEfficiency
          def self.format(results)
            rows = [%w[Name count total_time_for_approve average_time_per_approve repo pull_request time_for_approved]]
            rows << :separator
            results.each do |reviewer, records|
              res = []
              res << reviewer.to_s
              reviewed_count = records.count
              res << reviewed_count
              total_time_for_approve = records.inject(0) { |sum, record| sum += record[:time_for_approved] }.round(2)
              res << "#{total_time_for_approve} hours"
              res << "#{(total_time_for_approve / reviewed_count).round(2)} hours"
              records.each do |record|
                res += ['', '', '', ''] if res.empty?
                res << "#{record[:repo]}:#{record[:number]}"
                res << record[:title].truncate(50).to_s
                res << record[:time_for_approved]
                rows << res
                res = []
              end
              rows << :separator
            end

            rows.pop # remove last seperation
            Terminal::Table.new rows: rows
          end
        end
      end
    end
  end
end
