class CreateKategoris < ActiveRecord::Migration[7.0]
  def change
    create_table :kategoris do |t|
      t.string :name
      t.string :jenis
      t.string :origin

      t.timestamps
    end
  end
end
