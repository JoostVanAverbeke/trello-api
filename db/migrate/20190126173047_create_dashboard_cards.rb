class CreateDashboardCards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboard_cards do |t|
      t.string :title
      t.integer :dashboard_id
      t.string :component

      t.timestamps
    end
  end
end
