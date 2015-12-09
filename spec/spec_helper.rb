require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.around(:each) do |example|
    Timeout.timeout(5_000, &example)
  end
end
