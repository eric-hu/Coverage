require 'simplecov'
require 'simplecov-summary'


formatters =   [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::SummaryFormatter
]

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]



SimpleCov.start do
  add_filter "/vendor/"
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
end

# SimpleCov must be initialized before anything else to get accurate coverage reports

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/fixtures/**/*.rb")].each { |f| require f }


RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.treat_symbols_as_metadata_keys_with_true_values = true
end

