ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('dummy/config/environment.rb', __dir__)

require 'rspec/rails'
require 'support/webmock'

RSpec.configure do |config|
  config.use_active_record = false
  config.filter_rails_from_backtrace!
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # If there are focused tests, only run them.
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
