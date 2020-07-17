class AddBreedToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :breed, null: false, foreign_key: true
  end
end
