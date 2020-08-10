class Refactor < ActiveRecord::Migration[6.0]
  def change
    change_table :books do |t|
      t.text :description
      t.text :summary
    end
  end
end
