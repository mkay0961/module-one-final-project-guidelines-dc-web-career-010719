class CreatePlayers < ActiveRecord::Migration[4.2]
  def change
    create_table :players do |t|
      t.string :full_name
      t.string :postion
      t.integer :jersey_number
    end
  end
end
