class AddSubscriberListToSearchItems < ActiveRecord::Migration
  def change
    change_table :search_items do |t|
      t.references :subscriber_lists, index: true
    end
  end
end
