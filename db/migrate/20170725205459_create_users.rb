class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :unit_number
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :role

      t.timestamps
    end
  end
end
