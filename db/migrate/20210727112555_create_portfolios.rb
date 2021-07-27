class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|

      t.integer :user_id
      t.string :stock_name
      t.integer :shares
      t.integer :buy_price
      t.string :symbol

      t.timestamps
    end
  end
end
