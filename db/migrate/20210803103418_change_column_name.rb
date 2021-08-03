class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :portfolios, :buy_price, :price
  end
end
