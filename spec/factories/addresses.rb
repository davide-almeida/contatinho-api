# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { 'MyString' }
    number { 'MyString' }
    zip_code { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    country { 'MyString' }
    complement { 'MyString' }
    latitude { 'MyString' }
    longitude { 'MyString' }
    contact { nil }
  end
end
