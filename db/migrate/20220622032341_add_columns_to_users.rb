class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user, :boolean, default:true
    add_column :users, :premium, :boolean, default:false
    add_column :users, :admin, :boolean, default:false
  end
end
