class CreatePrivilages < ActiveRecord::Migration[6.0]
  def change
    create_table :privileges do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
