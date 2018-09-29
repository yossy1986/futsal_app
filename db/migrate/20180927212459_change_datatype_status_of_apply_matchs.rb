class ChangeDatatypeStatusOfApplyMatchs < ActiveRecord::Migration[5.2]
  def change
    change_column :apply_matches, :status, :integer
  end
end
