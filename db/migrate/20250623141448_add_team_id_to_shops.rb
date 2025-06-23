class AddTeamIdToShops < ActiveRecord::Migration[8.0]
  def change
    add_reference :shops, :team, null: false, foreign_key: true, default: 1
  end
end
