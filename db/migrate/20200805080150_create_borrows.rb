class CreateBorrows < ActiveRecord::Migration[6.0]
  def change
    create_table :borrows do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.date :borrow_date
      t.date :return_date

      t.timestamps
    end
  end
end
