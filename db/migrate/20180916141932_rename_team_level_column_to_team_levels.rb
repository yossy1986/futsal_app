class RenameTeamLevelColumnToTeamLevels < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_levels, :team_level, :team_id
  end
end
