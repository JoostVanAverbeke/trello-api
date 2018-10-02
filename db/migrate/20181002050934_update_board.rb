class UpdateBoard < ActiveRecord::Migration[5.2]
  def change
    change_table :boards do |t|
      t.integer :team_id

    end
  end
end
