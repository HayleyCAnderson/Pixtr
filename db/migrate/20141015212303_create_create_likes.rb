class CreateCreateLikes < ActiveRecord::Migration
  def change
    create_table :create_likes do |t|
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end
