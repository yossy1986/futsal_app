class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      
      t.string :image
      t.string :name
      t.integer :pref_id
      t.string :address
      t.string :tel
      t.string :site
      t.text :open_hour
      t.text :fee
      t.string :parking

      t.timestamps
    end
  end
end
