class ChangeImageToTextFromMenus < ActiveRecord::Migration[7.0]
  def change
    change_table :menus do |table|
    table.change :image, :text
    end
  end
end
