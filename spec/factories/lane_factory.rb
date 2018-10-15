require 'factory_bot'

FactoryBot.define do
  factory :lane do
    sequence :title do |n|
      "lane #{n}"
    end
  end
end