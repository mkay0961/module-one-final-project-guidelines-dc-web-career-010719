class AddTeamidToTeams < ActiveRecord::Migration[4.2]
  def change
    add_column :Teams, :teamid, :string
  end
end
