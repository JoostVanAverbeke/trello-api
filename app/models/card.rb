class Card < ApplicationRecord
  belongs_to :lane
  belongs_to :employee
end
