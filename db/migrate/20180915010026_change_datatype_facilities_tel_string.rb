class ChangeDatatypeFacilitiesTelString < ActiveRecord::Migration[5.2]
  def change
    change_column :facilities, :tel, :string
  end
end
