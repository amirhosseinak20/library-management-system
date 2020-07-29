class CreateBooksLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :books_languages do |t|
      t.references :book, null: false, foreign_key: true, index: true
      t.references :language, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
