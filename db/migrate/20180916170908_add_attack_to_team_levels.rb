class AddAttackToTeamLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :team_levels, :attack, :string
    add_column :team_levels, :physical, :string
    add_column :team_levels, :stamina, :string
    add_column :team_levels, :defense, :string
    add_column :team_levels, :tactics, :string
    add_column :team_levels, :technique, :string
  end
end
