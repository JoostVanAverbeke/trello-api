class CreateDashboards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards do |t|
      t.integer :employee_id
      t.string :title
      t.timestamps
    end
  end
end
