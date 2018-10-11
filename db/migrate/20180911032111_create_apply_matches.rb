class CreateApplyMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :apply_matches do |t|
      
      t.integer :team_info_id
      t.integer :match_req_id
      t.integer :status
      t.text :comment

      t.timestamps
    end
  end
end
