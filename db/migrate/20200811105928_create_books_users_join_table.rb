class CreateBooksUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :books, table_name: "authors_books" do |t|
      t.index :user_id, name: 'author_id'
      t.index :book_id
    end
  end
end
