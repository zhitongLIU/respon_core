# frozen_string_literal: true

REPOS = [].freeze

class Cli < Thor
  package_name 'responcli'
  map '-pr' => :remain_pull_requests
  map '-eff' => :reviews_efficiency
  map '-shuffle' => :shuffle_requests_reviewer

  desc '-pr', 'list user pull request, options: --json, --user xxx, --repos xxx/yyy zzz/aaa, --github, --display_url'
  method_options json: :boolean
  method_options user: :string
  method_options repos: :array
  method_options reviewers: :array
  method_options pr_count: :numeric
  method_options github: :boolean
  method_options connectors: :array
  method_options display_url: :boolean
  def remain_pull_requests
    repo_list = options.repos || REPOS
    client = connector(options)
    repo_list = client.list_repos(options.user).map(&:full_name) if repo_list.empty? && options.user
    results = ResponCore::PullRequests::RemainRequests.new(repo_list: repo_list, reviewers: options.reviewers, client: client, pr_count: options.pr_count).execute

    system('clear')
    puts ''

    if options.json?
      pp results
    else
      puts ResponCore::Formatters::Cli::PullRequests::RemainRequests.format(results, display_url: options.display_url)
    end
  end

  desc '-eff', 'list user pull request reviewers states, options: --json, --user xxx, --repos xxx/yyy zzz/aaa, --github, --display_url'
  method_options json: :boolean
  method_options user: :string
  method_options repos: :array
  method_options reviewers: :array
  method_options pr_count: :numeric
  method_options github: :boolean
  method_options connectors: :array
  method_options display_url: :boolean
  def reviews_efficiency
    repo_list = options.repos || REPOS
    client = connector(options)
    repo_list = client.list_repos(options.user).map(&:full_name) if repo_list.empty? && options.user
    results = ResponCore::PullRequests::ReviewsEfficiency.new(repo_list: repo_list, reviewers: options.reviewers, client: client, pr_count: options.pr_count).execute

    system('clear')
    puts ''

    if options.json?
      pp results
    else
      puts ResponCore::Formatters::Cli::PullRequests::ReviewsEfficiency.format(results, display_url: options.display_url)
    end
  end

  desc '-shuffle', 'shuffle request reviewer, options: --json, --user xxx, --repos xxx/yyy zzz/aaa, --github, --display_url'
  method_options json: :boolean
  method_options repos: :array
  method_options pr_count: :numeric
  method_options github: :boolean
  method_options reviewers: :array
  method_options exclude_reviewers: :array
  method_options connectors: :array
  method_options pull_requests: :array
  method_options mode: :string
  method_options display_url: :boolean
  def shuffle_requests_reviewer
    repo_list = options.repos || REPOS
    client = connector(options)
    results = ResponCore::PullRequests::ShuffleRequestReviewer.new(repo_list: repo_list, client: client, pr_count: options.pr_count, pull_requests: options.pull_requests,
                                                                   reviewers: options.reviewers, exclude_reviewers: options.exclude_reviewers, mode: options.mode).execute

    if options.json?
      pp results
    else
      results.each do |record|
        record.each do |repo, result|
          puts "assigne reviewer for #{repo}"
          puts ResponCore::Formatters::Cli::PullRequests::RemainRequests.format(result, display_url: options.display_url)
        end
      end
    end
  end

  no_commands do
    def connector(options)
      return ResponCore::Rms::Github.new.connection if options.github || options.connectors&.include?('github') || true
    end
  end
end
