class ChangeTableNameFromListToSearchedItems < ActiveRecord::Migration
  def change
    rename_table :lists, :searched_items
  end
end
