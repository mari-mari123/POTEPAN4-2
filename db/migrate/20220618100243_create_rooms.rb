class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string "introduction", null: false
      t.integer "price", null: false
      t.string "address", null: false
      
      t.timestamps
    end
  end
end
