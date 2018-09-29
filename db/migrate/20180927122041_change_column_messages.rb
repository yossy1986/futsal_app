class ChangeColumnMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :team_info_id, :integer
    add_column :messages, :match_req_id, :integer
  end

end
