class AddExpiredToJwtBlacklists < ActiveRecord::Migration[7.0]
  def change
    add_column :jwt_blacklists, :expired, :datetime
  end
end
