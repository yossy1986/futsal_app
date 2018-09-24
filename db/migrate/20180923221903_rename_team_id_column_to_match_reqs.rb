class RenameTeamIdColumnToMatchReqs < ActiveRecord::Migration[5.2]
  def change
    rename_column :match_reqs, :team_id, :team_info_id
  end
end
