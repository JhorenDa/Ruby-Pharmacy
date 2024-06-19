class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.integer :contact_number

      t.timestamps
    end
  end
end
