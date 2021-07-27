class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|

      t.integer :user_id
      t.string :stock_name
      t.integer :price
      t.integer :shares
      t.integer :total_price
      t.string :transaction_type

      t.timestamps
    end
  end
end

