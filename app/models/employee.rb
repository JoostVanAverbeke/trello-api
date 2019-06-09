class Employee < ApplicationRecord
  belongs_to :team
  has_many :cards
  has_one :dashboard

  delegate :name, to: :team, prefix: :team
end
