# Hangman

## Data/variables in the system
# * dictionary
# * guesses
# * turn_count
# * answer

## Open questions
# How do we show progrress? letter pool (alphabet - guesses)

## Behaviors/Actions are in the system
# * greeting / rules
# * until the game is over
# 	* show them the current game state/progress
# 	* ask them for a guess
# 	* do bookkeeping
# *tell them what happened

require 'pry'
require 'set'

MAX_TURNS = 7

WORD_LIST = ["bacon", "star", "wars", "moon", "puppies", "iron", "yard", "coffee", "whiskey", "vices", "gambling", "motorcycle", "elbow", "ruby"]



def greeting
	puts "
	Welcome to Hangman!
	Please guess letters."
end

def win?(guesses, answer)
	word = intermediate_word(guesses, answer)
	!word.include?("-")
end

def turns_left(guesses, answer)
	wrong_guesses = guesses - answer.chars.to_set
	MAX_TURNS - wrong_guesses.count
end

def lose?(guesses, answer)
	turns_left(guesses, answer).zero?
end

def game_over?(guesses, answer)
	win?(guesses, answer) || lose?(guesses, answer)
end

def intermediate_word(guesses, answer)
	result = []
	answer.each_char do |letter|
		if guesses.include?(letter)
			result.push(letter)
		else
			result.push("-")
		end
	end
	result.join
end

def show_progress(guesses, answer)
	puts
	puts "You have #{turns_left(guesses, answer)} turns left."	
	puts "You already guessed #{guesses.to_a.join(", ")}."
	puts "The word is: #{intermediate_word(guesses, answer)}."
end

def take_turn(guesses)
	puts "Please guess a letter: "
	guess = gets.chomp.downcase

	until ("a".."z").include?(guess) && !guesses.include?(guess)
		if guesses.include?(guess)
			puts "You already guessed that. Guess again:"
		end
		puts "Just one letter, please"
		guess = gets.chomp.downcase
	end
	guess
end

def hangman
	answer = WORD_LIST.sample
	guesses = Set.new
	greeting
	until game_over?(guesses, answer)
		show_progress(guesses, answer)
		guess = take_turn(guesses)
		guesses.add(guess)
	end
	postmortem(guesses, answer)
end

def postmortem(guesses, answer)
	if win?(guesses, answer)
		puts "Congratulations, you won! The word was #{answer}."
	else
		puts "Sorry, the word was #{answer}."
	end
end

def play_again?
	puts "Want to play a game of hangman? (y/n)"
	choice = gets.chomp.downcase
	until ["y", "n"].include?(choice)
		puts "Please choose 'y' or 'n'."
		choice = gets.chomp.downcase
	end
	choice == "y"
end

def play
	more = play_again?
	while more
		hangman
		more = play_again?
	end
end

play

