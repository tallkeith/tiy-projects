
# define a random number

def guess
	num = rand(100)
	guess = -1
	puts "Guess what number I am thinking of?"

	while guess != num 
	guess = gets.chomp.to_i
		if guess < num
			puts "Higher!"
			guess
		elsif guess > num
			puts "Lower!"
			guess
		else
			puts "You got it! #{num} was my number!"
		end
	end
end

guess


# # hard mode DESTUTTER!!!

# def destutter(numbers)
# 	a = []
# 	previous = nil
# 	numbers.each do |i|
# 		if i != previous
# 			a.push(i)
# 		end
# 		previous = i
# 	end

# 	puts a
# end

# destutter([1, 2, 3, 3, 4, 4, 3, 2, 1, 1])