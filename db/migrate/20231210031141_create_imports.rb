class CreateImports < ActiveRecord::Migration[7.1]
  def change
    create_table :imports do |t|
      t.string :medicine_name
      t.string :company_name
      t.string :delivery_truck_platenumber
      t.string :storage_area
      t.string :employee_name
      t.date :import_date
      t.date :expiration_date
      t.integer :total_products

      t.timestamps
    end
  end
end
