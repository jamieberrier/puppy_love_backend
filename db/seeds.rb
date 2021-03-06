# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Breed.destroy_all
Post.destroy_all

# get access token from petfinder api
token_info = Breed.request_token

# get dog breeds from petfinder api
response = RestClient.get 'https://api.petfinder.com/v2/types/dog/breeds', { content_type: 'application/x-www-form-urlencoded', authorization: "#{token_info[:token_type]} #{token_info[:token]}" }
json = JSON.parse response

if json.present?
  json['breeds'].map do |breed|
    Breed.create(name: breed['name'])
  end
else
  puts 'error seeding breeds'
end

boxer = Breed.find_by(name: 'Boxer')
dane = Breed.find_by(name: 'Great Dane')
frenchie = Breed.find_by(name: 'French Bulldog')
norfolk_terrier = Breed.find_by(name: 'Norfolk Terrier')

Post.create(breed_id: norfolk_terrier.id, num_of_likes: 79, picture: 'https://www.dogbreedinfo.com/images31/NorfolkTerrierPurebredDogIvy2YearsOld2.jpg')
Post.create(breed_id: frenchie.id, num_of_likes: 100, picture: 'https://happyfrenchbulldog.com/wp-content/uploads/2019/08/French-bulldog-puppy-guide.jpg')
Post.create(breed_id: boxer.id, num_of_likes: 105, picture: 'https://www.thesprucepets.com/thmb/DOytfIaKRXrfa-otJlCwDn7EptM=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Boxer-GettyImages-463043655-91a77226f5884b41915d50811e4e4e2b.jpg')
Post.create(breed_id: dane.id, num_of_likes: 89, picture: 'https://thumbs.dreamstime.com/b/great-dane-6655379.jpg')