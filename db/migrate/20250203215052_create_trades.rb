class CreateTrades < ActiveRecord::Migration[7.2]
  def change
    create_table :trades do |t|
      t.string :symbol, null: false
      t.integer :trade_type, null: false, index: true
      t.integer :quantity, default: 0
      t.decimal :price, precision: 10, scale: 2
      t.datetime :trade_date
      t.text :notes, null: true
    end
  end
end
