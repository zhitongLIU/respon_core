REPOS = []

class Cli < Thor
  package_name 'responcli'
  map "-pr" => :remain_pull_requests
  map "-eff" => :reviews_efficiency

  desc 'list repo pull request', 'list user pull request'
  method_options :json => :boolean
  method_options :user => :string
  method_options :repos => :array
  method_options :reviewers => :array
  method_options :pr_count => :numeric
  def remain_pull_requests
    repo_list = options.repos || REPOS
    if repo_list.empty? && options.user
      client = ResponCore::Github.connection
      repo_list = client.list_repos(options.user).map(&:full_name)
    end
    results = ResponCore::PullRequests::RemainRequests.new(repo_list, options.reviewers, options.pr_count).execute

    system('clear')
    puts ''

    if options.json?
      pp results
    else
      puts ResponCore::Formators::Cli::PullRequests::RemainRequests.format(results)
    end
  end

  desc 'list repo closed pull request reviews', 'list user pull request reviewers states'
  method_options :json => :boolean
  method_options :user => :string
  method_options :repos => :array
  method_options :reviewers => :array
  method_options :pr_count => :numeric
  def reviews_efficiency
    repo_list = options.repos || REPOS
    if repo_list.empty? && options.user
      client = ResponCore::Github.connection
      repo_list = client.list_repos(options.user).map(&:full_name)
    end
    results = ResponCore::PullRequests::ReviewsEfficiency.new(repo_list, options.reviewers, options.pr_count).execute

    system('clear')
    puts ''

    if options.json?
      pp results
    else
      puts ResponCore::Formators::Cli::PullRequests::ReviewsEfficiency.format(results)
    end
  end
end
