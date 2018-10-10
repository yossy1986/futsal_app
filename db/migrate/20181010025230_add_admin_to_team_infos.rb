class AddAdminToTeamInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :team_infos, :admin, :boolean, default: false
  end
end
