class Movie
	attr_reader :title, :year, :country, :date, :genre, :longe, :rating, :director, :actor, :p_date

	def initialize(title, year, country, date, genre, longe, rating, director, actor)
		@title=title
		@year=year
		@country=country
		@date=date
		@genre=genre
		@longe=longe.to_i
		@rating=rating
		@director=director
		@actor=actor
		@p_date=Date._parse(date)
	end
end
