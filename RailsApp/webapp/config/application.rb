require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application
  	config.log_level = :debug
  	config.log_tags = [:subdomain, :uuid]
  	config.logger = ActiveSupport:TaggedLogging.new(Logger.new(STDOUT))
  	config.cache_store = :redis_store, "#{ENV['CACHE_URL']}/0",
  						 { namespace: "#{ENV['POSTGRES_ENV_POSTGRES_USER']}::cache"}

  	config.active_record_raise_in_transactional_callbacks = true
  end
end
