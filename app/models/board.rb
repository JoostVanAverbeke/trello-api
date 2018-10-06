class Board < ApplicationRecord
  has_many :lanes
  belongs_to :team
end
