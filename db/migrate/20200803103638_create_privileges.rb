class CreatePrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :privileges do |t|
      t.string  :name
      t.text    :description
      t.string  :right

      t.timestamps
    end
  end
end
