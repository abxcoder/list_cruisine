class ChangeImageToTextFromRestorans < ActiveRecord::Migration[7.0]
  def change
    change_table :restorans do |table|
    table.change :image, :text
    end
  end
end
