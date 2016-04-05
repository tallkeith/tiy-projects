require "pry"
require "minitest/autorun"

require "./random_player"
require "./static_dict"
require "./file_dict"
require "./game"

class GameTest < MiniTest::Test
end

class RandomTest < MiniTest::Test
	def test_can_build_random_player
		assert RandomPlayer.new
		assert RandomPlayer.new "Thing"
	end
end

class DictionaryTest < MiniTest::Test
	def test_can_build_dictionary
		assert StaticDict.new
	end

	def test_can_get_a_word
		dict = StaticDict.new
		word = dict.get_word
		assert word.is_a?(String)
		assert word.length > 3
		assert word.length < 15
	end

	def test_can_get_random_word
		dict = StaticDict.new
		word1 = dict.get_word
		word2 = dict.get_word
		assert word1 != word2
	end

end

class FileDictionaryTest < MiniTest::Test
end