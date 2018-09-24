class RenameTeamIdColumnToTeamLevels < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_levels, :team_id, :team_info_id
    rename_column :apply_matches, :team_id, :team_info_id
  end
end
