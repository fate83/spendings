class AddTeamIdToReceipts < ActiveRecord::Migration[8.0]
  def change
    add_reference :receipts, :team, null: false, foreign_key: true, default: 1
  end
end
