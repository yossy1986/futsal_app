class CreateApplyMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :apply_matches do |t|
      
      t.integer :team_id
      t.integer :match_req_id
      t.string :status

      t.timestamps
    end
  end
end
