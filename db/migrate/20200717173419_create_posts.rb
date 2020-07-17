class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :picture
      i.integer :num_of_likes

      t.timestamps
    end
  end
end
