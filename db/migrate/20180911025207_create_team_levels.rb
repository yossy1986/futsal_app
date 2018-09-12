class CreateTeamLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :team_levels do |t|
      
      t.integer :team_level
      t.integer :level_name
      t.integer :level

      t.timestamps
    end
  end
end
