class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.date :birth_date
      t.string :email
      t.string :phone
      t.string :password
      t.references :role

      t.timestamps
    end
  end
end
