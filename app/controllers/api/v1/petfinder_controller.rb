class Api::V1::PetfinderController < ApplicationController
  # Gets access token from petfinder api
  def token
    token_info = Breed.request_token

    render json: token_info, status: :ok
  end
end
