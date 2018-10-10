class AddprefIdToFacilities < ActiveRecord::Migration[5.2]
  def change
    add_column :facilities, :pref_id, :integer
  end
end
