require "minitest/autorun"
require_relative "poker_game.rb"

class TddPokerGame < Minitest::Test

	def test_returning_correct_comparison
		# high card, [0] queen ties, [1] white's jack wins
		@black = Hand.new([Card.new(:four, :diamonds), Card.new(:ten, :diamonds), Card.new(:five, :clubs), Card.new(:queen, :clubs), Card.new(:three, :clubs)])
		@white = Hand.new([Card.new(:queen, :diamonds), Card.new(:jack, :diamonds), Card.new(:six, :clubs), Card.new(:four, :spades), Card.new(:two, :clubs)])
		p winner
		# p "@black.hand_rating is #{@black.hand_rating} and @white.hand_rating is #{@white.hand_rating}"
		p "@black.score is #{@black.score} and @white.score is #{@white.score}"
		assert_equal([true, [1, ["Q", "10", "5", "4", "3"]]], @black.score)
		assert_equal([true, [1, ["Q", "J", "6", "4", "2"]]], @white.score)
		assert_equal("High Card", @black.hand_rating)
		assert_equal("High Card", @white.hand_rating)
		assert_equal("White Wins", winner)
	end
end