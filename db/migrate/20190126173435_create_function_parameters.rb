class CreateFunctionParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :function_parameters do |t|
      t.integer :dashboard_card_id
      t.string :parameter
      t.string :parameter_type # type is a reserved column name in Rails
      t.string :parameter_value

      t.timestamps
    end
  end
end
