class AddPointToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :point, :integer
  end
end
