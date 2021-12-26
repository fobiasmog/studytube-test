class AddDeletedAtIndexToStocksAndBearers < ActiveRecord::Migration[6.1]
  def change
    add_index :stocks, :deleted_at
    add_index :bearers, :deleted_at
  end
end
