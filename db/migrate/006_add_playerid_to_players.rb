class AddPlayeridToPlayers < ActiveRecord::Migration[4.2]
  def change
    add_column :Players, :playerid, :string
  end
end
