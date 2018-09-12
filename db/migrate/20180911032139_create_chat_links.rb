class CreateChatLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_links do |t|
      
      t.integer :match_req_id
      t.integer :receive_team_id
      t.integer :request_team_id
      t.text :comment

      t.timestamps
    end
  end
end
