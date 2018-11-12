class AddShortNameToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :short_name, :string
  end
end
