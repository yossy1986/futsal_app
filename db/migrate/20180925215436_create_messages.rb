class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :team_info_id
      t.integer :room_id

      t.timestamps
    end
  end
end
