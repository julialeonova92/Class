
a="Matrix"
b="Titanic"
c="Other movies"

if 
	a=="Matrix"
	b=="Titanic"

	def movies(a, b)
		puts "Good movie is - " + a
		puts "Bad movie is - " + b
	end	
movies("Matrix", "Titanic")

else
	c=="Other movies"
	def movies(c)
		puts "This is - " + c
	end 
movies("New world")
end
