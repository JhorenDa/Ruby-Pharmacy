class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :company_ceo
      t.string :contact

      t.timestamps
    end
  end
end
