class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :books do |t|
      t.integer :rate
      t.references :book_id
      t.references :user_id

      t.timestamps
    end
  end
end
