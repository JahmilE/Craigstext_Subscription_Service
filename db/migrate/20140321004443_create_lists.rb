class CreateLists < ActiveRecord::Migration
  def change
    create_table :search_items do |t|
      t.string :name
      t.integer :subscriber_id
      t.string :search_item_color
      t.string :search_item_position,
      t.text, :search_item_text
      t.string :search_item_done

      t.timestamps
    end
  end
end
