Rails.application.config.action_mailer.delivery_method = :mailgun
Rails.application.config.action_mailer.mailgun_settings = {
  api_key: Rails.application.credentials.mailgun_api_key,
  domain: 'mg.seedbase.xyz',
}