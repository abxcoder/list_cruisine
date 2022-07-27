class AddExpiredToJwtActives < ActiveRecord::Migration[7.0]
  def change
    add_column :jwt_actives, :expired, :datetime
  end
end
