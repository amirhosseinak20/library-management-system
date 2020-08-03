class AddJsonFieldToBooks < ActiveRecord::Migration[6.0]
  def change
    change_table :books do |t|
      t.json :genre
      t.string :language
    end
  end
end
