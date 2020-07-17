# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Breed.destroy_all
Post.destroy_all

boxer = Breed.create(name: "Boxer")
dane = Breed.create(name: "Great Dane")
frenchie = Breed.create(name: "French Bulldog")

Post.create(breed_id: boxer.id, num_of_likes: 105, picture: "https://www.thesprucepets.com/thmb/DOytfIaKRXrfa-otJlCwDn7EptM=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Boxer-GettyImages-463043655-91a77226f5884b41915d50811e4e4e2b.jpg")