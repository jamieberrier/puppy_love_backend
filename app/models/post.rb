class Post < ApplicationRecord
  belongs_to :breed

  validates :picture, presence: true
end
