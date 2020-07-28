class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.date :publication_date
      t.references :author
      t.references :language
      t.references :genre
      t.references :publisher

      t.timestamps
    end
  end
end
