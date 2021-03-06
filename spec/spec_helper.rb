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
  config.include FactoryBot::Syntax::Methods
  
  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end
  
  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
