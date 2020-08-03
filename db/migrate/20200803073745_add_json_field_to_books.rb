class AddJsonFieldToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :attrs, :json
  end
end
