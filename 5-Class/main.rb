require 'csv'
require './Movie'
require './MovieList'

mov_list=MovieList.new
puts "All of comedy, sorted by release date: \n "
puts mov_list.by_genre("Comedy")
puts "\n"

puts "The five longest movies: \n "
puts mov_list.by_longe
puts "\n"

puts "The list of the directors in alphabetical order (no repeats!): \n "
puts mov_list.alphabet_dir
puts "\n"

puts "The number of movies produced not in the follow country is: " + mov_list.non_country("USA")
puts "\n"

puts "The number of movies grouped by director: \n "
puts mov_list.group_dir
puts "\n"

puts "The number of movies produced each month: \n "
puts mov_list.each_month
puts "\n"
