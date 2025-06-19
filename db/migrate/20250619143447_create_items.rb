class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.belongs_to :receipt, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
