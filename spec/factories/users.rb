# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'newuser@email.com.br' }
    password { 'asdasd' }
    password_confirmation { 'asdasd' }
  end
end
