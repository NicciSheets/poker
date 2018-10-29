require "minitest/autorun"
require_relative "poker_card_class.rb"

class TddPoker < Minitest::Test

	def test_card_is_a_class
	 	x = Card.new("2", "S")
        assert_equal(Card, x.class)
    end

    def test_card_value_suit_and_name
    	x = Card.new("2", "S")
    	assert_equal("2", x.rank)
    	assert_equal("S", x.suit)
    	x = Card.new(:two, :spades)
    	assert_equal(:two, x.rank)
    	assert_equal(:spades, x.suit)
    end

    def test_card_symbols
    	assert_equal([:clubs, :diamonds, :hearts, :spades], Card.suits)
    end

    def test_ranks
    	assert_equal([:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace], Card.ranks)
    end

end