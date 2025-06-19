class CreateReceipts < ActiveRecord::Migration[8.0]
  def change
    create_table :receipts do |t|
      t.date :shopped_at
      t.belongs_to :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
