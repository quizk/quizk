Rails.configuration.i18n.default_locale = :en
Rails.configuration.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
