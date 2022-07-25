class CreateJwtBlacklists < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_blacklists do |t|
      t.string :jwt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
