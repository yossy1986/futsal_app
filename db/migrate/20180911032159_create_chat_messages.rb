class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      
      t.integer :chat_link_id
      t.integer :team_id
      t.text :message

      t.timestamps
    end
  end
end
