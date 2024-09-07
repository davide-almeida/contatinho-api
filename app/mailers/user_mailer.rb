# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Boas vindas ao Contatinho-API')
  end

  def reset_password_instructions(user, token)
    @user = user
    @token = token

    mail(to: @user.email, subject: 'Contatinho-API - Redefinir sua senha') do |format|
      format.html { render 'user_mailer/reset_password_instructions' }
      format.text { render 'user_mailer/reset_password_instructions' }
    end
  end
end
