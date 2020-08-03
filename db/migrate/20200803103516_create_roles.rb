class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    change_table :users do |t|
      t.belongs_to :role
      
    end
  end
end
