#class Movie
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
mov_hsh=CSV.read('movies.txt', { :col_sep => '|' }).
			map{|hsh| hsh}.map do |row|
  Movie.new row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]
p mov_hsh
