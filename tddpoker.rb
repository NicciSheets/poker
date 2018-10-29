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
    	assert_equal("2S", x.set)
    end



end