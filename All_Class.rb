#Class
require 'csv'
class Movie
	attr_reader :title, :year, :country, :date, :genre, :longe, :rating, :director, :actor

	def initialize(title, year, country, date, genre, longe, rating, director, actor)
		@title=title
		@year=year
		@country=country
		@date=date
		@genre=genre
		@longe=longe
		@rating=rating
		@director=director
		@actor=actor
	end
end
class MovieList
	attr_reader :mov_hsh
	def mov_hsh
		CSV.read('movies.txt', { :col_sep => '|' }).
			map{|hsh| hsh}.map do |row|
		Movie.new row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]
		end
	end
end
new_hash=MovieList.new

puts "The five longest movies: \n \n"
puts new_hash.mov_hsh.sort_by{ |hsh| hsh.longe.to_i}.last(5).
	map{|mov| [mov.title + ": " + mov.longe]}
puts "\n"

puts "All of comedy, sorted by release date: \n \n"
puts new_hash.mov_hsh.find_all{ |hsh| hsh.genre.include?("Comedy")}.
	sort_by {|hsh| hsh.date}.
	map{|mov| [mov.title + ": " + mov.genre + ", " + mov.date]}
puts "\n"

puts "The list of the directors in alphabetical order (no repeats!) \n \n"
puts new_hash.mov_hsh.sort_by{|hsh| hsh.director}.map{|dir| dir.director}.uniq
puts "\n"

non_usa=new_hash.mov_hsh.reject{|hsh| hsh.country==("USA")}.size
puts "The number of movies produced not in the USA is: " + non_usa.to_s
puts "\n"

puts "The number of movies grouped by director \n \n"
puts new_hash.mov_hsh.group_by{|hsh| hsh.director}.
	map{|dir, group| ["Director is #{dir}" + ", namber of his movies: #{group.size.to_s}"]}
puts "\n"

puts "The number of movies produced each month \n \n"
puts new_hash.mov_hsh.map{|hsh| Date._parse(hsh.date)}.
	group_by{|k| k[:mon]}.
	map{|mon, group| ["mon: #{mon.to_s}," + " number of movies: #{group.size.to_s}"]}
