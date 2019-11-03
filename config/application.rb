require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyFavarite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.template_engine = :slim
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        controller_specs: false,
        routing_specs: false,
        request_specs: false
    end     
  end
end
