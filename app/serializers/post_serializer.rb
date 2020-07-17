class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :num_of_likes, :picture, :breed
  # belongs_to :breed
end
