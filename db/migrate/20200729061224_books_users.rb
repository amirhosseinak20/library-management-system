class BooksUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :books_users do |t|
      t.belongs_to :user
      t.belongs_to :book

      t.timestamps
    end
  end
end
