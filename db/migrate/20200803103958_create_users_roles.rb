class CreateUsersRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :users_roles do |t|
      t.references :users, foreign_key: true, index: true
      t.references :roles, foreign_key: true, index: true

      t.timestamps
    end
    change_table :users do |t|
      t.references :role
    end
  end
end
