class ChangeColumnChatLinks < ActiveRecord::Migration[5.2]
  def change
    rename_column :chat_links, :receive_team_id, :team_info_id
    remove_column :chat_links, :request_team_id
    
    
  end
end
