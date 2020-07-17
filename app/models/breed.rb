class Breed < ApplicationRecord
  has_many :posts, dependent: :destroy
end
