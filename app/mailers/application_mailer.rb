# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@contatinho-api.com'
  layout 'mailer'
end
