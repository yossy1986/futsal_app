class CreateMatchReqs < ActiveRecord::Migration[5.2]
  def change
    create_table :match_reqs do |t|
      
      t.integer :team_id
      t.datetime :match_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :pref
      t.string :facility
      t.string :req_cat
      t.integer :req_rank
      t.integer :req_team_num
      t.text :content
      

      t.timestamps
    end
  end
end
