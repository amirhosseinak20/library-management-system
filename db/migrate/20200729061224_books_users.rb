class BooksUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :books_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps
    end
  end
end
