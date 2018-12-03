class AddDurationToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :duration, :float
    add_column :cards, :estimate, :float
  end
end
