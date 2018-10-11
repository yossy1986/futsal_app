class AddAttackToTeamLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :team_levels, :attack, :integer
    add_column :team_levels, :physical, :integer
    add_column :team_levels, :stamina, :integer
    add_column :team_levels, :defense, :integer
    add_column :team_levels, :tactics, :integer
    add_column :team_levels, :technique, :integer
  end
end
