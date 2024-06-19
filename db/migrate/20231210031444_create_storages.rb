class CreateStorages < ActiveRecord::Migration[7.1]
  def change
    create_table :storages do |t|
      t.string :storage_area
      t.integer :status

      t.timestamps
    end
  end
end
