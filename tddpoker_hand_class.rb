require "minitest/autorun"
require_relative "poker_hand_class.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			x = Hand.new()
			assert_equal(Hand, x.class)
		end


		def test_hand_is_getting_dealt_cards_randomized_for_game_use
			deck = Deck.all_cards.shuffle
			x = Hand.deal(deck)
			assert_equal(Hand, x.class)
			assert_equal(x.cards, x.cards_to_test)
		end


		def test_cards_in_are_sorted_regarding_poker_values
			cards = [Card.new(:eight, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
			deck = Deck.new(cards)
			hand = Hand.deal(deck)
			cards_sorted = [Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs), Card.new(:eight, :clubs)]
			deck_sorted = Deck.new(cards_sorted)
			hand_sorted = Hand.deal(deck_sorted)
			assert_equal(hand.cards, hand_sorted.cards)
			assert_equal(hand.cards_to_test, hand_sorted.cards_to_test)
			assert_equal(hand.cards, hand.cards_to_test)
			assert_equal(hand_sorted.cards, hand_sorted.cards_to_test)
		end

		def test_cards_dup_creates_duplicates
			cards = [Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
			assert_equal(cards, cards.dup)
		end


		def test_cards_in_hand_can_be_manipulated_for_testing
			cards = [Card.new(:eight, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
     		deck = Deck.new(cards.dup)
      		hand = Hand.deal(deck)
      		assert_equal(Hand, hand.class)
      		assert_equal(hand.cards, hand.cards_to_test)
        end


        def test_pair?
        	hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
        	assert_equal(true, hand.pair?[0])
        	assert_equal(3, hand.cards_to_test.length)
        	assert_equal("pair", hand.evaluate_hand)
        	hand.pair?
        end


        def test_two_pair?
        	hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
        	assert_equal(true, hand.two_pair?[0])
        	assert_equal(1, hand.cards_to_test.length)
        	assert_equal("two pair", hand.evaluate_hand)
        	assert_equal(2, hand.two_pair?[1].length)
        	x = hand.two_pair?[1][0][0].to_s 
        	y = hand.two_pair?[1][1][0].to_s
        	# this tells me that the first pair has a lower value than the second pair, so the second pair is the highest pair
        	assert_operator x.chr, :<, y.chr
        end
end