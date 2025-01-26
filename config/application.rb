require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module HowManyRings
  class Application < Rails::Application
    # Encryption configuration
    config.active_record.encryption.key = SecureRandom.hex(16)  # 16-byte encryption key

    # Controller configuration
    config.action_controller.raise_on_missing_callback_actions = false if Rails.version >= "7.1.0"

    # Generator configuration
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    # Framework defaults
    config.load_defaults 7.1

    # Localization settings
    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:fr, :en]

    # Autoload configuration
    config.autoload_lib(ignore: %w(assets tasks))

    # Other potential configurations (commented examples)
    # config.time_zone = "Paris"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end