class CreateMedicines < ActiveRecord::Migration[7.1]
  def change
    create_table :medicines do |t|
      t.string :medicine_name
      t.string :medicine_type
      t.text :description

      t.timestamps
    end
  end
end
