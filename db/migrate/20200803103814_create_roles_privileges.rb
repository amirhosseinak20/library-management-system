class CreateRolesPrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :roles_privileges do |t|
      t.references :roles, foreign_key: true
      t.references :privileges, foreign_key: true

      t.timestamps
    end
  end
end
