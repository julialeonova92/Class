#class MovieList
require 'csv'
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
p new_hash.mov_hsh
