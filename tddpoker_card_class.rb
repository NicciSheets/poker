require "minitest/autorun"
require_relative "poker_card_class.rb"

class TddPokerCardClass < Minitest::Test

	def test_card_is_a_class
        value = :two
        suit = :spades
       	x = Card.new(value, suit)
        assert_equal(Card, x.class)
    end

    def test_card_value_suit_and_name
    	x = Card.new("2", "S")
    	assert_equal("2", x.value)
    	assert_equal("S", x.suit)
    	x = Card.new(:two, :spades)
    	assert_equal(:two, x.value)
    	assert_equal(:spades, x.suit)
    end

    def test_card_symbols
    	assert_equal([:clubs, :diamonds, :hearts, :spades], Card.suits)
    end

    def test_card_values
    	assert_equal([:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace], Card.values)
    end

    def test_combines_value_and_suit
    	x = Card.new(:two, :spades)
    	assert_equal("2S", x.to_s)
    	x = Card.new(:king, :spades)
    	assert_equal("KS", x.to_s)
    end 
    
end



    # def test_compares_equality_of_cards
    #   x = Card.new(:two, :spades)
    #   x2 = Card.new(:two, :spades)
    #   assert_equal(true, x==(x2))
    #   x = Card.new(:two, :spades)
    #   x2 = Card.new(:three, :spades)
    #   assert_equal(false, x==(x2))
    # end

    # def test_poker_ranking
    #   x = Card.new(:two, :spades)
    #   x2 = Card.new(:two, :spades)
    #   assert_nil(nil, x.higher_than?(x2))
    #   x = Card.new(:two, :spades)
    #   x2 = Card.new(:three, :spades)
    #   assert_equal(false, x.higher_than?(x2))
    #   x = Card.new(:king, :spades)
    #   x2 = Card.new(:two, :spades)
    #   assert_equal(true, x.higher_than?(x2))
    # end