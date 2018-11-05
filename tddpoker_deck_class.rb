require "minitest/autorun"
require_relative "poker_deck_class.rb"

class TddPokerDeckClass < Minitest::Test

	def test_deck_is_a_class
	 	x = Deck.new("cards")
        assert_equal(Deck, x.class)
    end

    def test_deck_has_52_cards
    	assert_equal(52, Deck.all_cards.count)    	
    end
end