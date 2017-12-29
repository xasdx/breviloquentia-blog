ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

ActiveRecord::Migration.maintain_test_schema!

module SpecHelper
  def json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include SpecHelper, type: :request
end
