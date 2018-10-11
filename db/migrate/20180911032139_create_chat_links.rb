class CreateChatLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_links do |t|
      
      t.integer :room_id
      t.integer :team_info_id

      t.timestamps
    end
  end
end
