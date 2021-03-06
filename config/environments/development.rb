Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.react.variant = :development
  config.react.addons = true

  # Do not eager load code on boot.
  config.eager_load = false
  #config.middleware.delete Rack::Lock

  #config.allow_concurrency = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  #config.reload_classes_only_on_change = false

  # Don't care if the mailer can't send.
 config.action_mailer.raise_delivery_errors = false
 config.action_mailer.default_url_options = { host: 'localhost:3000' }   

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  config.action_mailer.delivery_method = :letter_opener_web   

  #Mailer Configurations (mandrill)
  config.action_mailer.smtp_settings = { 
  :address              => "smtp.mandrillapp.com",
  :port                 => ENV["MANDRILL_PORT"],
  :enable_starttls_auto => true,
  :user_name            => ENV["MANDRILL_USER_NAME"],
  :password             => ENV["MANDRILL_API_KEY"],
  :authentication       => 'plain',
  :domain               => ENV["MANDRILL_DOMAIN"], 
  }

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.active_support.deprecation = :log   
  config.active_record.migration_error = :page_load  

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  #config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.console do
    require "pry"
    config.console = Pry
  end
end
