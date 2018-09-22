class ChangeDatatypeAttack < ActiveRecord::Migration[5.2]
  def change
    change_column :team_levels, :attack, :integer
    change_column :team_levels, :physical, :integer
    change_column :team_levels, :stamina, :integer
    change_column :team_levels, :defense, :integer
    change_column :team_levels, :tactics, :integer
    change_column :team_levels, :technique, :integer
    
    change_column :team_infos, :rank, :integer
    change_column :team_infos, :cat, :integer
    
    change_column :match_reqs, :req_cat, :integer

  end
end
