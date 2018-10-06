class Team < ApplicationRecord
  has_many :employees
  has_many :boards
end
