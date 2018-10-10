class RenamePrefColumnToPrefId < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_infos, :pref, :pref_id
    rename_column :team_infos, :facility, :facility_id
    rename_column :team_infos, :cat, :cat_id
    rename_column :team_infos, :rank, :rank_id
    rename_column :facilities, :pref, :pref_id
  end
end
