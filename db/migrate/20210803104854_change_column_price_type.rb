class ChangeColumnPriceType < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :price, :float
    change_column :transactions, :total_price, :float
    change_column :portfolios, :price, :float
  end
end
