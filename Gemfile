# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in respon_ore.gemspec
gem 'dotenv', '~> 2.5'
gem 'dry-validation', '~> 0.12.1'
gem 'octokit', '~> 4.0'
gem 'rugged', '~> 0.27.2'
gem 'terminal-table', '~> 1.8'
gem 'thor', '~> 0.20.0'

group :development do
  gem 'pry'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec'
  gem 'rubocop'
end

gemspec
