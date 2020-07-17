class Api::V1::BreedsController < ApplicationController
  def index
    breeds = Breed.all
    render json: BreedSerializer.new(breeds)
  end
end
