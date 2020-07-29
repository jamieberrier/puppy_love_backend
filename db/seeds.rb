# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Breed.destroy_all
Post.destroy_all

response = RestClient.get 'https://api.thedogapi.com/v1/breeds?api_key=13f08d5e-0c80-47c9-811f-afbe558e0e8f'
json = JSON.parse response

if !json.nil?
  json.map do |breed|
    Breed.create(name: breed['name'].to_s)
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
Post.create(breed_id: dane.id, num_of_likes: 89, picture: 'https://www.petful.com/wp-content/uploads/2012/01/great-dane-1.jpg')