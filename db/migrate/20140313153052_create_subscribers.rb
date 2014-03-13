class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :verified

      t.timestamps
    end
  end
end
