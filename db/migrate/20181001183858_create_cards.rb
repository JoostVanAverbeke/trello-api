class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.integer :lane_id

      t.timestamps
    end
  end
end
