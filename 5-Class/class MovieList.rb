class MovieList
	attr_reader :movies
	def initialize
		@movies=CSV.read("movies.txt", { :col_sep => '|' }).
			map{|hsh| hsh}.map do |row|
		Movie.new row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]
		end
	end
	def by_genre (genre)
		movies.find_all{ |hsh| hsh.genre.include?(genre)}.
			sort_by {|hsh| hsh.date}.
			map{|mov| [mov.title + ": " + mov.genre + ", " + mov.date]}
	end
	def by_longe
		movies.sort_by{|hsh| hsh.longe}.last(5).
			map{|mov| ["#{mov.title}: #{mov.longe}"]}
	end
	def alphabet_dir
		movies.sort_by{|hsh| hsh.director}.map{|dir| dir.director}.uniq
	end
	def non_country (count)
		movies.reject{|hsh| hsh.country==(count)}.size.to_s
	end
	def group_dir
		movies.group_by{|hsh| hsh.director}.
			map{|dir, group| ["Director is #{dir}" + ", namber of his movies: #{group.size.to_s}"]}
	end
	def each_month
		movies.map{|hsh| hsh.p_date}.
			group_by{|k| k[:mon]}.
			map{|mon, group| ["mon: #{mon.to_s}," + " the number of movies: #{group.size.to_s}"]}
	end
end
