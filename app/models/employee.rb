class Employee < ApplicationRecord
  belongs_to :team
  has_many :cards
end
