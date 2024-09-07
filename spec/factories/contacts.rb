# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'MyString' }
    cpf_code { 'MyString' }
    user { nil }
  end
end
