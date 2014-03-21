class CreateSubscriberLists < ActiveRecord::Migration
  def change
    create_table :subscriber_lists do |t|
      t.integer :subscriber_id
      t.string :list_url

      t.timestamps
    end
  end
end
