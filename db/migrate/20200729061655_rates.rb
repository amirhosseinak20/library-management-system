class Rates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :book, null: false, foreign_key: true, index: true
      t.integer :point, null: false

      t.timestamps
    end
  end
end
