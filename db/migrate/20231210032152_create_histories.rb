class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories do |t|
      t.string :medicine_name
      t.string :company_name
      t.string :delivery_truck_platenumber
      t.date :import_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
