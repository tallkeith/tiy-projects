require "pry"

def anagram?(word1, word2)
	word1.chars.sort == word2.chars.sort
end

def has_joiner?(word1, word2)
	word2.chars.first == word1.chars.last
end

def is_funny_word?(word1, word2)
	is_anagram?(word1, word2) && has_joiner?(word1, word2)
end

def build_dictionary(file_path)
	dictionary = []
	file.open(file_path, "r") do |f|
		f.each_line do |line|
			dictionary.push(line.chomp) if line.chomp.length > 3
		end
	end
	dictionary
end

def funny_words
	dict = build_dictionary("english-dict.txt")[0,100]
	dict.each do |word1|
		dict.each do |word2|
			next if word1 == word2
			puts "#{word1}#{word2[1..-1]}" if is_funny_word?(word1, word2)
		end
	end
end

