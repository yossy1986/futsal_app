class CreateTeamInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :team_infos do |t|
      
      t.string :name
      t.string :logo
      t.string :image
      t.integer :pref_id
      t.integer :facility_id
      t.integer :cat_id
      t.integer :rank_id
      t.integer :age_ave
      t.text :comment
      t.string :email
      t.string :password_digest
      t.integer :attack
      t.integer :defense
      t.integer :technique
      t.integer :tactics
      t.integer :stamina
      t.integer :physical
      
      t.timestamps
    end
  end
end
