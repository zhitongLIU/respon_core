[[#]] Respon::Core

Respon is a tool let you analyse how team members are cooperating in a git repo
by looking into PRs reviews metrics

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'respon-core'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install respon-core

## Usage

###Github token Auth

Create .env file, and put a github access token with repos&user read rights
```
GITHUB_ACCESS_TOKEN=xxxxxxx
```

### CLI

```
➜  respon_core git:(master)  ./exe/respon_core
responcli commands:
  respon_core -eff            # list user pull request reviewers states, options: --json, --user xxx, --repos xxx/yyy zzz/aaa, --github, --display_url
  respon_core -pr             # list user pull request, options: --json, --user xxx, --repos xxx/yyy zzz/aaa, --github, --display_url
  respon_core -shuffle        # shuffle request reviewer, options: --json, --user xxx, --repos xxx/yyy zzz/aaa, --github, --display_url
  respon_core help [COMMAND]  # Describe available commands or one specific command

```

Common Otions:

 `--json` display as json

 `--user` specify a user

 `--repos` specify repos

 `--github` repos are github repo? (default yes)

 `--display_url` display PR url


#### -eff
Show team members last 100(default) closed pr average time for reviews after a PR is created, time_for_approved is in hours

```
./exe/respon_core -eff --repos oner/repo_name
```

####Example

```
 ./exe/respon_core -eff --repos rails/rails --display_url
processing repo rails/rails

+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| Name                   | count | total_time_for_approve | average_time_per_approve | repo              | pull_request                                       | time_for_approved | url                                       |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| eileencodes            | 8     | 733.1 hours            | 91.64 hours              | rails/rails:40387 | Avoid query from exists? on contradictory relation | 0.1               | https://github.com/rails/rails/pull/40387 |
|                        |       |                        |                          | rails/rails:40296 | Add resource to Naming Routes override example     | 13.42             | https://github.com/rails/rails/pull/40296 |
|                        |       |                        |                          | rails/rails:40296 | Add resource to Naming Routes override example     | 305.26            | https://github.com/rails/rails/pull/40296 |
|                        |       |                        |                          | rails/rails:40274 | Extract {ActiveStorage,ActionText,ActionMailbox... | 62.27             | https://github.com/rails/rails/pull/40274 |
|                        |       |                        |                          | rails/rails:40241 | Make `role` required when using `shard` in `con... | 15.2              | https://github.com/rails/rails/pull/40241 |
|                        |       |                        |                          | rails/rails:40241 | Make `role` required when using `shard` in `con... | 15.3              | https://github.com/rails/rails/pull/40241 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 314.4             | https://github.com/rails/rails/pull/40213 |
|                        |       |                        |                          | rails/rails:40175 | Avoid setting `ActiveRecord::Base.configuration... | 7.15              | https://github.com/rails/rails/pull/40175 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| georgeclaghorn         | 4     | 61.68 hours            | 15.42 hours              | rails/rails:40387 | Avoid query from exists? on contradictory relation | 4.5               | https://github.com/rails/rails/pull/40387 |
|                        |       |                        |                          | rails/rails:40323 | Optimize ActiveRecord::Relation#include? on an ... | 4.34              | https://github.com/rails/rails/pull/40323 |
|                        |       |                        |                          | rails/rails:40294 | ActiveStorage is now environment-aware             | 45.64             | https://github.com/rails/rails/pull/40294 |
|                        |       |                        |                          | rails/rails:40226 | Set default variant format from blob content type  | 7.2               | https://github.com/rails/rails/pull/40226 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| jeremy                 | 4     | 276.22 hours           | 69.06 hours              | rails/rails:40323 | Optimize ActiveRecord::Relation#include? on an ... | 3.3               | https://github.com/rails/rails/pull/40323 |
|                        |       |                        |                          | rails/rails:40313 | [ci-skip] Wording in guides: Prefer environment... | 0.1               | https://github.com/rails/rails/pull/40313 |
|                        |       |                        |                          | rails/rails:40313 | [ci-skip] Wording in guides: Prefer environment... | 121.52            | https://github.com/rails/rails/pull/40313 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 151.3             | https://github.com/rails/rails/pull/40213 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| jonathanhefner         | 2     | 3.5 hours              | 1.75 hours               | rails/rails:40312 | Fix small typos in the guides [skip ci]            | 2.45              | https://github.com/rails/rails/pull/40312 |
|                        |       |                        |                          | rails/rails:40226 | Set default variant format from blob content type  | 1.05              | https://github.com/rails/rails/pull/40226 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| p8                     | 8     | 544.18 hours           | 68.02 hours              | rails/rails:40312 | Fix small typos in the guides [skip ci]            | 19.55             | https://github.com/rails/rails/pull/40312 |
|                        |       |                        |                          | rails/rails:40312 | Fix small typos in the guides [skip ci]            | 253.78            | https://github.com/rails/rails/pull/40312 |
|                        |       |                        |                          | rails/rails:40294 | ActiveStorage is now environment-aware             | 13.68             | https://github.com/rails/rails/pull/40294 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 126.92            | https://github.com/rails/rails/pull/40213 |
|                        |       |                        |                          | rails/rails:40173 | Shorten inspect on ActionDispatch::Request         | 13.34             | https://github.com/rails/rails/pull/40173 |
|                        |       |                        |                          | rails/rails:40173 | Shorten inspect on ActionDispatch::Request         | 46.41             | https://github.com/rails/rails/pull/40173 |
|                        |       |                        |                          | rails/rails:40173 | Shorten inspect on ActionDispatch::Request         | 46.47             | https://github.com/rails/rails/pull/40173 |
|                        |       |                        |                          | rails/rails:40172 | Shorten inspect on AbstractController::Base        | 24.03             | https://github.com/rails/rails/pull/40172 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| eugeneius              | 12    | 460.54 hours           | 38.38 hours              | rails/rails:40309 | Adapt docs to recent config.log_level changes [... | 0.59              | https://github.com/rails/rails/pull/40309 |
|                        |       |                        |                          | rails/rails:40309 | Adapt docs to recent config.log_level changes [... | 3.27              | https://github.com/rails/rails/pull/40309 |
|                        |       |                        |                          | rails/rails:40292 | `Hash#extract!`: Clarify its docs and assert re... | 1.84              | https://github.com/rails/rails/pull/40292 |
|                        |       |                        |                          | rails/rails:40260 | Using write with unless_exist + expires_in shou... | 0.81              | https://github.com/rails/rails/pull/40260 |
|                        |       |                        |                          | rails/rails:40244 | Use method_defined? if possible in define_non_c... | 81.88             | https://github.com/rails/rails/pull/40244 |
|                        |       |                        |                          | rails/rails:40244 | Use method_defined? if possible in define_non_c... | 105.62            | https://github.com/rails/rails/pull/40244 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 104.79            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 115.83            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40198 | Anchor BacktraceCleaner gem filter regexp          | 1.35              | https://github.com/rails/rails/pull/40198 |
|                        |       |                        |                          | rails/rails:40194 | Properly support `reverse_order` on relations w... | 1.52              | https://github.com/rails/rails/pull/40194 |
|                        |       |                        |                          | rails/rails:40192 | Add support for `NOT VALID` check constraints i... | 21.07             | https://github.com/rails/rails/pull/40192 |
|                        |       |                        |                          | rails/rails:40192 | Add support for `NOT VALID` check constraints i... | 21.97             | https://github.com/rails/rails/pull/40192 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| robinboening           | 1     | 2.94 hours             | 2.94 hours               | rails/rails:40309 | Adapt docs to recent config.log_level changes [... | 2.94              | https://github.com/rails/rails/pull/40309 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| kylerdmoore            | 1     | 136.37 hours           | 136.37 hours             | rails/rails:40296 | Add resource to Naming Routes override example     | 136.37            | https://github.com/rails/rails/pull/40296 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| pietromoro             | 1     | 49.8 hours             | 49.8 hours               | rails/rails:40294 | ActiveStorage is now environment-aware             | 49.8              | https://github.com/rails/rails/pull/40294 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| bogdanvlviv            | 1     | 2.3 hours              | 2.3 hours                | rails/rails:40292 | `Hash#extract!`: Clarify its docs and assert re... | 2.3               | https://github.com/rails/rails/pull/40292 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| rafaelfranca           | 4     | 367.91 hours           | 91.98 hours              | rails/rails:40291 | Revert "Refactor uncastable through reflection ... | 0.7               | https://github.com/rails/rails/pull/40291 |
|                        |       |                        |                          | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 121.34            | https://github.com/rails/rails/pull/40240 |
|                        |       |                        |                          | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 122.81            | https://github.com/rails/rails/pull/40240 |
|                        |       |                        |                          | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 123.06            | https://github.com/rails/rails/pull/40240 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| tgxworld               | 9     | 161.63 hours           | 17.96 hours              | rails/rails:40285 | Improve query used in `test_with_advisory_lock_... | 122.32            | https://github.com/rails/rails/pull/40285 |
|                        |       |                        |                          | rails/rails:40241 | Make `role` required when using `shard` in `con... | 4.48              | https://github.com/rails/rails/pull/40241 |
|                        |       |                        |                          | rails/rails:40241 | Make `role` required when using `shard` in `con... | 4.51              | https://github.com/rails/rails/pull/40241 |
|                        |       |                        |                          | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 7.12              | https://github.com/rails/rails/pull/40240 |
|                        |       |                        |                          | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 7.38              | https://github.com/rails/rails/pull/40240 |
|                        |       |                        |                          | rails/rails:40175 | Avoid setting `ActiveRecord::Base.configuration... | 0.86              | https://github.com/rails/rails/pull/40175 |
|                        |       |                        |                          | rails/rails:40175 | Avoid setting `ActiveRecord::Base.configuration... | 1.0               | https://github.com/rails/rails/pull/40175 |
|                        |       |                        |                          | rails/rails:40175 | Avoid setting `ActiveRecord::Base.configuration... | 7.29              | https://github.com/rails/rails/pull/40175 |
|                        |       |                        |                          | rails/rails:40173 | Shorten inspect on ActionDispatch::Request         | 6.67              | https://github.com/rails/rails/pull/40173 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| kamipo                 | 6     | 28.63 hours            | 4.77 hours               | rails/rails:40261 | Model#find with hash should not raise NoMethodE... | 8.73              | https://github.com/rails/rails/pull/40261 |
|                        |       |                        |                          | rails/rails:40261 | Model#find with hash should not raise NoMethodE... | 8.74              | https://github.com/rails/rails/pull/40261 |
|                        |       |                        |                          | rails/rails:40261 | Model#find with hash should not raise NoMethodE... | 8.92              | https://github.com/rails/rails/pull/40261 |
|                        |       |                        |                          | rails/rails:40212 | Translate Mysql2 errors in Mysql2Adapter#quote_... | 0.1               | https://github.com/rails/rails/pull/40212 |
|                        |       |                        |                          | rails/rails:40185 | Update RuboCop to v0.90                            | 0.13              | https://github.com/rails/rails/pull/40185 |
|                        |       |                        |                          | rails/rails:40185 | Update RuboCop to v0.90                            | 2.01              | https://github.com/rails/rails/pull/40185 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| jasl                   | 1     | 10.28 hours            | 10.28 hours              | rails/rails:40261 | Model#find with hash should not raise NoMethodE... | 10.28             | https://github.com/rails/rails/pull/40261 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| casperisfine           | 5     | 324.79 hours           | 64.96 hours              | rails/rails:40244 | Use method_defined? if possible in define_non_c... | 91.0              | https://github.com/rails/rails/pull/40244 |
|                        |       |                        |                          | rails/rails:40244 | Use method_defined? if possible in define_non_c... | 115.63            | https://github.com/rails/rails/pull/40244 |
|                        |       |                        |                          | rails/rails:40244 | Use method_defined? if possible in define_non_c... | 115.64            | https://github.com/rails/rails/pull/40244 |
|                        |       |                        |                          | rails/rails:40212 | Translate Mysql2 errors in Mysql2Adapter#quote_... | 1.22              | https://github.com/rails/rails/pull/40212 |
|                        |       |                        |                          | rails/rails:40212 | Translate Mysql2 errors in Mysql2Adapter#quote_... | 1.3               | https://github.com/rails/rails/pull/40212 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| adrianna-chang-shopify | 2     | 244.88 hours           | 122.44 hours             | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 122.44            | https://github.com/rails/rails/pull/40240 |
|                        |       |                        |                          | rails/rails:40240 | Provide `ActiveSupport::Subscriber.attach_to` w... | 122.44            | https://github.com/rails/rails/pull/40240 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| SampsonCrowley         | 7     | 786.75 hours           | 112.39 hours             | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 110.9             | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 110.98            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 111.06            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 112.27            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 112.28            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 112.29            | https://github.com/rails/rails/pull/40235 |
|                        |       |                        |                          | rails/rails:40235 | move ActiveRecord::Persistence#becomes logic in... | 116.97            | https://github.com/rails/rails/pull/40235 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| KapilSachdev           | 3     | 62.73 hours            | 20.91 hours              | rails/rails:40219 | Ensure `connects_to` can only be called on base... | 20.84             | https://github.com/rails/rails/pull/40219 |
|                        |       |                        |                          | rails/rails:40219 | Ensure `connects_to` can only be called on base... | 20.93             | https://github.com/rails/rails/pull/40219 |
|                        |       |                        |                          | rails/rails:40219 | Ensure `connects_to` can only be called on base... | 20.96             | https://github.com/rails/rails/pull/40219 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| dbussink               | 5     | 959.44 hours           | 191.89 hours             | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 145.16            | https://github.com/rails/rails/pull/40213 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 166.37            | https://github.com/rails/rails/pull/40213 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 166.38            | https://github.com/rails/rails/pull/40213 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 166.39            | https://github.com/rails/rails/pull/40213 |
|                        |       |                        |                          | rails/rails:40213 | Add an ActiveSupport option to allow setting a ... | 315.14            | https://github.com/rails/rails/pull/40213 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| kddeisz                | 1     | 26.23 hours            | 26.23 hours              | rails/rails:40194 | Properly support `reverse_order` on relations w... | 26.23             | https://github.com/rails/rails/pull/40194 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| agrobbin               | 2     | 43.35 hours            | 21.68 hours              | rails/rails:40192 | Add support for `NOT VALID` check constraints i... | 21.66             | https://github.com/rails/rails/pull/40192 |
|                        |       |                        |                          | rails/rails:40192 | Add support for `NOT VALID` check constraints i... | 21.69             | https://github.com/rails/rails/pull/40192 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| esparta                | 3     | 50.19 hours            | 16.73 hours              | rails/rails:40173 | Shorten inspect on ActionDispatch::Request         | 23.51             | https://github.com/rails/rails/pull/40173 |
|                        |       |                        |                          | rails/rails:40172 | Shorten inspect on AbstractController::Base        | 1.87              | https://github.com/rails/rails/pull/40172 |
|                        |       |                        |                          | rails/rails:40172 | Shorten inspect on AbstractController::Base        | 24.81             | https://github.com/rails/rails/pull/40172 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| jhawthorn              | 1     | 1.95 hours             | 1.95 hours               | rails/rails:40171 | Reduce allocations in expanded_version and expa... | 1.95              | https://github.com/rails/rails/pull/40171 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| vinistock              | 2     | 117.5 hours            | 58.75 hours              | rails/rails:40171 | Reduce allocations in expanded_version and expa... | 2.09              | https://github.com/rails/rails/pull/40171 |
|                        |       |                        |                          | rails/rails:40171 | Reduce allocations in expanded_version and expa... | 115.41            | https://github.com/rails/rails/pull/40171 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+
| kaspth                 | 1     | 42.53 hours            | 42.53 hours              | rails/rails:40171 | Reduce allocations in expanded_version and expa... | 42.53             | https://github.com/rails/rails/pull/40171 |
+------------------------+-------+------------------------+--------------------------+-------------------+----------------------------------------------------+-------------------+-------------------------------------------+

```
seems in rails/rails if your PR is assigned to `eugeneius` or `tgxworld` your pr will be reviewed very soon


#### -pr
Show open PR that waiting for reviews
Example
```
 ./exe/respon_core -pr --repos rails/rails --display_url
processing repo rails/rails

+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| Name         | count | repo              | pull_request                                       | due_date    | url                                       |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| no_reviewers | 93    | rails/rails:40395 | Fix `read_attribute_before_type_cast` to consid... | 0 days ago  | https://github.com/rails/rails/pull/40395 |
|              |       | rails/rails:40392 | Don't bother checking if strings respond to str... | 0 days ago  | https://github.com/rails/rails/pull/40392 |
|              |       | rails/rails:40391 | Fix performance issue on back reference with sa... | 0 days ago  | https://github.com/rails/rails/pull/40391 |
|              |       | rails/rails:40390 | Reset has_one association scope in autosave cal... | 0 days ago  | https://github.com/rails/rails/pull/40390 |
|              |       | rails/rails:40388 | Allow `route` generator action to insert after ... | 1 days ago  | https://github.com/rails/rails/pull/40388 |
|              |       | rails/rails:40385 | Do not create excessive through records in HMT ... | 1 days ago  | https://github.com/rails/rails/pull/40385 |
|              |       | rails/rails:40384 | Restore connection pools after transactional tests | 1 days ago  | https://github.com/rails/rails/pull/40384 |
|              |       | rails/rails:40381 | Make OpenStruct#as_json behavior less surprising   | 2 days ago  | https://github.com/rails/rails/pull/40381 |
|              |       | rails/rails:40371 | Document transform.active_storage event [ci skip]  | 2 days ago  | https://github.com/rails/rails/pull/40371 |
|              |       | rails/rails:40370 | Implement granular role and shard swapping         | 1 days ago  | https://github.com/rails/rails/pull/40370 |
|              |       | rails/rails:40369 | Raise helpful error when request object does no... | 3 days ago  | https://github.com/rails/rails/pull/40369 |
|              |       | rails/rails:40368 | Eagerly establish test transactions for shards     | 4 days ago  | https://github.com/rails/rails/pull/40368 |
|              |       | rails/rails:40365 | Follow npm/JS standard for package name            | 3 days ago  | https://github.com/rails/rails/pull/40365 |
|              |       | rails/rails:40363 | Add symbol to string association cache for refl... | 5 days ago  | https://github.com/rails/rails/pull/40363 |
|              |       | rails/rails:40361 | Comparison of record in shard                      | 3 days ago  | https://github.com/rails/rails/pull/40361 |
|              |       | rails/rails:40360 | Replace 'ws' occurrences in favour of 'wss'        | 5 days ago  | https://github.com/rails/rails/pull/40360 |
|              |       | rails/rails:40354 | Update: Action Mailbox documentation with examp... | 8 days ago  | https://github.com/rails/rails/pull/40354 |
|              |       | rails/rails:40351 | Return BigDecimal **OR** Float from "average" o... | 6 days ago  | https://github.com/rails/rails/pull/40351 |
|              |       | rails/rails:40348 | Don't evaluate ERB in the ujs test server          | 9 days ago  | https://github.com/rails/rails/pull/40348 |
|              |       | rails/rails:40338 | Support grouped collection for collection_select   | 10 days ago | https://github.com/rails/rails/pull/40338 |
|              |       | rails/rails:40337 | POC for adding concurrency to ActiveJob            | 6 days ago  | https://github.com/rails/rails/pull/40337 |
|              |       | rails/rails:40328 | Allow config.hosts proc to receive request object  | 8 days ago  | https://github.com/rails/rails/pull/40328 |
|              |       | rails/rails:40327 | Fix Getting_Started guide which provides non-fu... | 12 days ago | https://github.com/rails/rails/pull/40327 |
|              |       | rails/rails:40326 | Fix an error in the getting started guide relat... | 12 days ago | https://github.com/rails/rails/pull/40326 |
|              |       | rails/rails:40324 | Implement 'no_store' HTTP cache directive          | 4 days ago  | https://github.com/rails/rails/pull/40324 |
|              |       | rails/rails:40320 | [skip ci]  Fix examples for has_{one,many} :thr... | 13 days ago | https://github.com/rails/rails/pull/40320 |
|              |       | rails/rails:40319 | Changed naming in HABTM middle_reflection          | 13 days ago | https://github.com/rails/rails/pull/40319 |
|              |       | rails/rails:40315 | Dash comments should match read query regexp       | 13 days ago | https://github.com/rails/rails/pull/40315 |
|              |       | rails/rails:40308 | Document how ActionText layouts are extensible     | 15 days ago | https://github.com/rails/rails/pull/40308 |
|              |       | rails/rails:40306 | Ensure DB Directory Is Created                     | 16 days ago | https://github.com/rails/rails/pull/40306 |
|              |       | rails/rails:40289 | Add `action_text_attachment` helper to `Fixture... | 3 days ago  | https://github.com/rails/rails/pull/40289 |
|              |       | rails/rails:40264 | Use non-memoized route helper modules at namesp... | 20 days ago | https://github.com/rails/rails/pull/40264 |
|              |       | rails/rails:40263 | Regression in controller inheritance from isola... | 24 days ago | https://github.com/rails/rails/pull/40263 |
|              |       | rails/rails:40256 | Save some allocations in ActionView digest         | 26 days ago | https://github.com/rails/rails/pull/40256 |
|              |       | rails/rails:40254 | Change default branch for new Rails projects an... | 0 days ago  | https://github.com/rails/rails/pull/40254 |
|              |       | rails/rails:40251 | Use current_database + current_schema for advis... | 21 days ago | https://github.com/rails/rails/pull/40251 |
|              |       | rails/rails:40249 | Expose an `invert_where` method that will inver... | 27 days ago | https://github.com/rails/rails/pull/40249 |
|              |       | rails/rails:40246 | Expose rack.request_method through request.raw_... | 24 days ago | https://github.com/rails/rails/pull/40246 |
|              |       | rails/rails:40229 | Prevent thundering herd of Action Cable clients    | 27 days ago | https://github.com/rails/rails/pull/40229 |
|              |       | rails/rails:40224 | Add support for exclusion constraints (PostgreS... | 33 days ago | https://github.com/rails/rails/pull/40224 |
|              |       | rails/rails:40222 | Disentangle Action Text from ApplicationController | 17 days ago | https://github.com/rails/rails/pull/40222 |
|              |       | rails/rails:40217 | Fix broken TLD parsing for cookie store            | 34 days ago | https://github.com/rails/rails/pull/40217 |
|              |       | rails/rails:40216 | Set up a Docker environment for Rails development  | 34 days ago | https://github.com/rails/rails/pull/40216 |
|              |       | rails/rails:40215 | Uniform paths joining in the code generated by ... | 16 days ago | https://github.com/rails/rails/pull/40215 |
|              |       | rails/rails:40205 | Pre-calculate size for cache entries               | 28 days ago | https://github.com/rails/rails/pull/40205 |
|              |       | rails/rails:40204 | Avoid creating controller _helper modules until... | 36 days ago | https://github.com/rails/rails/pull/40204 |
|              |       | rails/rails:40203 | Show outstanding migrations on the error page      | 14 days ago | https://github.com/rails/rails/pull/40203 |
|              |       | rails/rails:40199 | Return 400 for invalid POST params                 | 23 days ago | https://github.com/rails/rails/pull/40199 |
|              |       | rails/rails:40197 | Fix application templates on existing projects     | 35 days ago | https://github.com/rails/rails/pull/40197 |
|              |       | rails/rails:40183 | Disallow raw SQL in `group` and `calculate` met... | 40 days ago | https://github.com/rails/rails/pull/40183 |
|              |       | rails/rails:40182 | Improve symbol key access in `HashWithIndiffere... | 37 days ago | https://github.com/rails/rails/pull/40182 |
|              |       | rails/rails:40168 | Do not use submit_tag auto-disabling when disab... | 42 days ago | https://github.com/rails/rails/pull/40168 |
|              |       | rails/rails:40165 | Fixes locals that use `@` as a key                 | 42 days ago | https://github.com/rails/rails/pull/40165 |
|              |       | rails/rails:40146 | Rename TagHelper#class_names to #dom_token_list    | 16 days ago | https://github.com/rails/rails/pull/40146 |
|              |       | rails/rails:40137 | Make Time.at loseless with ActiveSupport::TimeW... | 11 days ago | https://github.com/rails/rails/pull/40137 |
|              |       | rails/rails:40133 | Make EventedFileUpdateChecker garbage collectable  | 19 days ago | https://github.com/rails/rails/pull/40133 |
|              |       | rails/rails:40131 | Allow false as check_box unchecked value           | 38 days ago | https://github.com/rails/rails/pull/40131 |
|              |       | rails/rails:40127 | Declare ActionView::Helpers::FormBuilder#id and... | 44 days ago | https://github.com/rails/rails/pull/40127 |
|              |       | rails/rails:40122 | Always generate HTML screenshot                    | 23 days ago | https://github.com/rails/rails/pull/40122 |
|              |       | rails/rails:40107 | Improve actioncable postgres docs                  | 30 days ago | https://github.com/rails/rails/pull/40107 |
|              |       | rails/rails:40100 | Stop EventedFileUpdateChecker's listener only      | 19 days ago | https://github.com/rails/rails/pull/40100 |
|              |       | rails/rails:40096 | Demonstrate how to use Relation#merge in Join T... | 38 days ago | https://github.com/rails/rails/pull/40096 |
|              |       | rails/rails:40083 | Add supports_advisory_locks detection for Stric... | 36 days ago | https://github.com/rails/rails/pull/40083 |
|              |       | rails/rails:40073 | Adds role types accessor for delegated types       | 56 days ago | https://github.com/rails/rails/pull/40073 |
|              |       | rails/rails:40069 | Added test cases for Action Mailbox generator      | 37 days ago | https://github.com/rails/rails/pull/40069 |
|              |       | rails/rails:40058 | Add db_runtime to Active Job instrumentation       | 59 days ago | https://github.com/rails/rails/pull/40058 |
|              |       | rails/rails:40055 | Allow subscribing with a single argument callable  | 56 days ago | https://github.com/rails/rails/pull/40055 |
|              |       | rails/rails:40052 | Clarify that `next` can be used to exit transac... | 62 days ago | https://github.com/rails/rails/pull/40052 |
|              |       | rails/rails:40051 | Add HTTP_REFERER when following redirects on in... | 62 days ago | https://github.com/rails/rails/pull/40051 |
|              |       | rails/rails:40045 | Adds a fix to whitelist hostnames with case-ins... | 35 days ago | https://github.com/rails/rails/pull/40045 |
|              |       | rails/rails:40042 | Fix: Ensure association target is only set if t... | 6 days ago  | https://github.com/rails/rails/pull/40042 |
|              |       | rails/rails:40040 | [ci skip] Revise adding articles section in Get... | 14 days ago | https://github.com/rails/rails/pull/40040 |
|              |       | rails/rails:40039 | [ci skip] Revise index + show actions in Gettin... | 14 days ago | https://github.com/rails/rails/pull/40039 |
|              |       | rails/rails:40037 | Allow Adapter#select_all to be performed asynch... | 2 days ago  | https://github.com/rails/rails/pull/40037 |
|              |       | rails/rails:40032 | Fix deadlocks related to ActiveRecord::Migratio... | 64 days ago | https://github.com/rails/rails/pull/40032 |
|              |       | rails/rails:40022 | Build watcher for CheckPending middleware when ... | 64 days ago | https://github.com/rails/rails/pull/40022 |
|              |       | rails/rails:40015 | Add Disabled Option to rich_text_area_tag          | 66 days ago | https://github.com/rails/rails/pull/40015 |
|              |       | rails/rails:40008 | Add image_processing section to upgrading guide... | 66 days ago | https://github.com/rails/rails/pull/40008 |
|              |       | rails/rails:40007 | Allow constructors for has_one :through            | 69 days ago | https://github.com/rails/rails/pull/40007 |
|              |       | rails/rails:39979 | Improve perf of `ActionView::Helpers::TextHelpe... | 2 days ago  | https://github.com/rails/rails/pull/39979 |
|              |       | rails/rails:39968 | Implement returning for postgresql                 | 12 days ago | https://github.com/rails/rails/pull/39968 |
|              |       | rails/rails:39966 | Fixes to_query when value is nil                   | 56 days ago | https://github.com/rails/rails/pull/39966 |
|              |       | rails/rails:39963 | Add ActiveModel::Name#singular_ivar / #plural_ivar | 11 days ago | https://github.com/rails/rails/pull/39963 |
|              |       | rails/rails:39953 | Add a new `server` Railtie block:                  | 73 days ago | https://github.com/rails/rails/pull/39953 |
|              |       | rails/rails:39947 | Fixed "fake" nested transactions swallowing man... | 50 days ago | https://github.com/rails/rails/pull/39947 |
|              |       | rails/rails:39946 | Make ActionDispatch::Http::URL.tld_length threa... | 74 days ago | https://github.com/rails/rails/pull/39946 |
|              |       | rails/rails:39935 | Introduce Journey::Ast to avoid extra ast walks    | 57 days ago | https://github.com/rails/rails/pull/39935 |
|              |       | rails/rails:39930 | disable compression for MemoryStore's by default   | 81 days ago | https://github.com/rails/rails/pull/39930 |
|              |       | rails/rails:39929 | Retain original attribute type when decorating     | 79 days ago | https://github.com/rails/rails/pull/39929 |
|              |       | rails/rails:39928 | Minor fixes in testing docs [ci-skip]              | 81 days ago | https://github.com/rails/rails/pull/39928 |
|              |       | rails/rails:39915 | Add rails routes separated format option           | 84 days ago | https://github.com/rails/rails/pull/39915 |
|              |       | rails/rails:39906 | Ensures Calculate methods work with order and l... | 85 days ago | https://github.com/rails/rails/pull/39906 |
|              |       | rails/rails:39885 | fix: duplicated load /bin/spring                   | 87 days ago | https://github.com/rails/rails/pull/39885 |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| rafaelfranca | 5     | rails/rails:40386 | Remove keys from local_cache in RedisCacheStore... | 1 days ago  | https://github.com/rails/rails/pull/40386 |
|              |       | rails/rails:40193 | feat(rubocop): Add new cops                        | 38 days ago | https://github.com/rails/rails/pull/40193 |
|              |       | rails/rails:40121 | Serialize aria- namespaced list attributes         | 8 days ago  | https://github.com/rails/rails/pull/40121 |
|              |       | rails/rails:40095 | Add ComparisonValidator to validate comparison ... | 19 days ago | https://github.com/rails/rails/pull/40095 |
|              |       | rails/rails:39980 | Append development routes after reload hook        | 66 days ago | https://github.com/rails/rails/pull/39980 |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| gmcgibbon    | 1     | rails/rails:40379 | Prevent adding the same record twice on build w... | 2 days ago  | https://github.com/rails/rails/pull/40379 |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| matthewd     | 1     | rails/rails:40095 | Add ComparisonValidator to validate comparison ... | 19 days ago | https://github.com/rails/rails/pull/40095 |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| kamipo       | 1     | rails/rails:40053 | Use deep_symbolize_keys instead of symbolize_names | 57 days ago | https://github.com/rails/rails/pull/40053 |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+
| Edouard-chin | 1     | rails/rails:39980 | Append development routes after reload hook        | 66 days ago | https://github.com/rails/rails/pull/39980 |
+--------------+-------+-------------------+----------------------------------------------------+-------------+-------------------------------------------+

```

# MORE TO COME


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/respon-core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Respon::Core project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/respon-core/blob/master/CODE_OF_CONDUCT.md).
