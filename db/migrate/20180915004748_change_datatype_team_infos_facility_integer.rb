class ChangeDatatypeTeamInfosFacilityInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :team_infos, :facility, :integer
  end
end
