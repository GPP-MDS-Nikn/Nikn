require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nikn
  class Application < Rails::Application
    config.assets.precompile += ['application-print.css']
    # Add the font awesome path
    config.assets.paths << Rails.root.join("app", "assets")
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Add custom validators path
    # Read more: http://www.rails-dev.com/custom-validators-in-ruby-on-rails-4
    config.autoload_paths += %W["#{config.root}/app/validators/"]

    # Add custom exceptions path
    # Read more: http://guides.rubyonrails.org/autoloading_and_reloading_constants.html
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
