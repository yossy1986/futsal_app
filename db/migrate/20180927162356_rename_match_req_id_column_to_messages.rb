class RenameMatchReqIdColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :chat_links, :match_req_id, :room_id
    rename_column :messages, :match_req_id, :room_id
    rename_column :match_reqs, :facility, :facility_id
  end
end
