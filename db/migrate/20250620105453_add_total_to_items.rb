class AddTotalToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :total, :decimal, precision: 8, scale: 2, as: 'price * amount', stored: true
  end
end
