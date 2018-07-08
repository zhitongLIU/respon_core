module ResponCore
  module Formators
    module Cli
      module PullRequests
        # operation to give reviewers of pull requests
        module RemainRequests
          def self.format(results)
            rows = [%w[Name count repo pull_request due_date]]
            rows << :separator
            results.each do |reviewer, records|
              res = []
              res << reviewer.to_s
              res << records.count
              records.each do |record|
                res += ['', ''] if res.empty?
                res << "#{record[:repo]}:#{record[:number]}"
                res << "#{record[:title].truncate(50)}"
                res << record[:last_update]
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
