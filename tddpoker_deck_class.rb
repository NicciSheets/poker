require "minitest/autorun"
require_relative "poker_deck_class.rb"

class TddPokerDeckClass < Minitest::Test

	def test_deck_is_a_class
	 	x = Deck.new()
        assert_equal(Deck, x.class)
    end

    def test_deck_has_52_cards
    	assert_equal(52, Deck.all_cards.length)   	
    end

    def test_cards_in_deck
    	x = Deck.all_cards
    	assert_equal(Card, x[0].class)
       	assert_equal(:two, x[0].value)
       	assert_equal(:clubs, x[0].suit)
       	assert_equal("2C", x[0].to_s)
       	assert_equal(:two, x[1].value)
       	assert_equal(:diamonds, x[1].suit)
        assert_equal("2D", x[1].to_s)
        assert_equal(:ace, x[51].value)
       	assert_equal(:spades, x[51].suit)
        assert_equal("AS", x[51].to_s)
    end

    def test_deck_shuffle
    	x = Deck.new()
    	y = x.shuffle.to_s
    	refute_equal(x, y)
    end

    def test_deals_5_cards
    	x = Deck.new()
    	assert_equal(5, x.deal.length)
    end
   
end