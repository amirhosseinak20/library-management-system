class CreateRolePrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :role_privileges do |t|
      t.references :role_id, null: false, foreign_key: true
      t.references :privilege_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
