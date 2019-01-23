class AddStateAndDivisionAndLinkAndPhonenumberToTeams < ActiveRecord::Migration[4.2]
  def change
    add_column :Teams, :state, :string
    add_column :Teams, :division, :string
    add_column :Teams, :link, :string
    add_column :Teams, :phonenumber, :string
  end
end
