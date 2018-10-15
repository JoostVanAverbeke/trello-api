require 'factory_bot'

FactoryBot.define do
  factory :card do
    sequence :title do |n|
      "to do #{n}"
    end
    sequence :subtitle do |n|
      "subtitle to do #{n}"
    end
    sequence :content do |n|
      "content todo #{n}"
    end
  end
end
