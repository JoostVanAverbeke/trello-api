require 'factory_bot'

FactoryBot.define do
  factory :employee do
    sequence :last_name do |n|
      "Doe#{n}"
    end
    sequence :first_name do |n|
      "John#{n}"
    end
  end
end