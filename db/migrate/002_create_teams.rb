class CreateTeams < ActiveRecord::Migration[4.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :league
      t.string :venue
    end
  end
end
