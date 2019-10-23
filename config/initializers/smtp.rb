# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  domain: 'bbq-nuringa.site',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  user_name: 'apikey',
  password: Rails.application.credentials[:sendgrid_api_key]
}
