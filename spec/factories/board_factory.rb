require 'factory_bot'

FactoryBot.define do
  factory :board do
    sequence :title do |n|
      "Board #{n}"
    end
  end
end