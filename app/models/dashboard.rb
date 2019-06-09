class Dashboard < ApplicationRecord
  belongs_to :employee
  has_many :dashboard_cards
end
