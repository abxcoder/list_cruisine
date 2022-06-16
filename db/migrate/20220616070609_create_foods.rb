class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :jenis
      t.string :origin
      t.references :kategori, null: false, foreign_key: true

      t.timestamps
    end
  end
end
