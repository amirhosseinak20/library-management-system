class DropLanguagesAndDropGenresAndAddJsonFieldToBook < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :language_id
    drop_table :books_languages
    drop_table :languages
    remove_column :books, :genre_id
    drop_table :books_genres
    drop_table :genres
  end
end
