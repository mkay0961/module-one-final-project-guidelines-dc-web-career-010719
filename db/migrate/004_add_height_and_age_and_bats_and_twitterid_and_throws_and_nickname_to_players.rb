class AddHeightAndAgeAndBatsAndTwitteridAndThrowsAndNicknameToPlayers < ActiveRecord::Migration[4.2]
  def change
    add_column :players, :height, :integer
    add_column :players, :age, :integer
    add_column :players, :bats, :string
    add_column :players, :twitterid, :string
    add_column :players, :throws, :string
    add_column :players, :nickname, :string
  end
end
