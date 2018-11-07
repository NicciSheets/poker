require "minitest/autorun"
require_relative "poker_hand_class.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			x = Hand.new()
			assert_equal(Hand, x.class)
		end

		def test_hand_is_getting_dealt_card
			x = Hand.deal
			assert_equal(1, x.length)
		end

		def test_cards_dup_creates_duplicates
			cards = [Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
			assert_equal(cards, cards.dup)
		end

		
		def test_cards_in_hand
			cards = [Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
     		deck = Deck.new(cards.dup)
      		hand = Hand.deal(deck)
        	assert_equal(1, hand.length)
        	assert_equal(5, cards.length)
        	
        	p hand
        end
end