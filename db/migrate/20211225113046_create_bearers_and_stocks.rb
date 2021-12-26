class CreateBearersAndStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :bearers do |t|
      t.string :name, null: false, index: { unique: true }
      t.datetime :deleted_at
      t.timestamps
    end

    create_table :stocks do |t|
      t.string :name, null: false, index: { unique: true }
      t.belongs_to :bearer
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
