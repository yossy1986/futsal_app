class AddMatchReqIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :match_req_id, :integer
  end
end
