class CreateJwtActives < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_actives do |t|
      t.string :jwt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
