# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"
require 'faker'

Movie.destroy_all
Director.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
response_serialized = URI.open(url).read
responses = JSON.parse(response_serialized)
# puts responses

movies = responses["results"]
# p movies

movies.each do |movie|
  title = movie["title"]
  poster_url = movie["poster_path"]
  genre = movie["genre_ids"]
  year = movie["release_date"]
  director = Director.create!(name: Faker::Name.name)
  Movie.create!(title: title, poster_url: poster_url, genre: genre, year: year, director: director) #= director_id: director.id
end
