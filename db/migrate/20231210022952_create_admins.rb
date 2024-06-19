class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :fullname

      t.timestamps
    end
  end
end
