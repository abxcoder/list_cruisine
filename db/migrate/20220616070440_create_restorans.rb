class CreateRestorans < ActiveRecord::Migration[7.0]
  def change
    create_table :restorans do |t|
      t.string :name
      t.string :alamat
      t.string :city
      t.string :phone
      t.string :image

      t.timestamps
    end
  end
end
