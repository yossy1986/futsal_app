class CreateMatchReqs < ActiveRecord::Migration[5.2]
  def change
    create_table :match_reqs do |t|
      
      t.integer :team_info_id
      t.datetime :match_date
      t.datetime :end_time
      t.integer :pref_id
      t.integer :facility_id
      t.integer :req_cat
      t.integer :req_team_num
      t.text :content
      

      t.timestamps
    end
  end
end
