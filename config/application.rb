require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

BUY_RANGE = [[1, 1], [2, 2], [3 ,3], [4, 4], [5, 5], [6, 6]]
module EOnlineShopping
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.active_job.queue_adapter = :sidekiq
    config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets')
    if Rails.env.development?
      env_file = File.join(Rails.root, 'config/.env')
      Dotenv.load(env_file) if File.exist?(env_file)
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
