require "open-uri"
require "json"

movies = JSON.parse(URI.parse("https://tmdb.lewagon.com/movie/top_rated").read)
number = 0

puts "Destroying DB"

Movie.destroy_all

puts "Deeding starts"

15.times do
  number += 1
  movie = Movie.create(
    title: movies["results"][number]["original_title"],
    overview: movies["results"][number]["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movies["results"][number]["poster_path"]}",
    rating: movies["results"][number]["vote_average"].round(1),
  )
end

puts "Seeding done"
