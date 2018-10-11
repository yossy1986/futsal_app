class CreateTeamInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :team_infos do |t|
      
      t.string :name
      t.string :logo
      t.string :image
      t.integer :pref
      t.integer :facility
      t.integer :cat
      t.integer :rank
      t.integer :age_ave
      t.text :comment
      t.string :email
      t.string :password
      
      t.timestamps
    end
  end
end
