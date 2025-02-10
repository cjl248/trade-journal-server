class ChangeTradesQuantityNull < ActiveRecord::Migration[7.2]
  def change
    reversible do |direction|
      change_table :trades do |t|
        direction.up { change_column_null :trades, :quantity, false }
        direction.down { change_column_null :trades, :quantity, true }
      end
    end
  end
end
