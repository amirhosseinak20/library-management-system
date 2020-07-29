class Rates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|

      t.timestamps
    end

    add_reference :rates, :rateable, polymorphic: true, index: true
  end
end
