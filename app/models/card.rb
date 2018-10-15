class Card < ApplicationRecord
  belongs_to :lane
  belongs_to :employee

  def matchesBoard?(lane)
    lane.board && self.lane && self.lane.board && self.lane.board == lane.board ? true : false
  end
end
