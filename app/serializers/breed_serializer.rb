class BreedSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :posts
end
