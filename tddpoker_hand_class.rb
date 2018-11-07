require "minitest/autorun"
require_relative "poker_hand_class.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			x = Hand.new()
			assert_equal(Hand, x.class)
		end


		def test_hand_is_getting_dealt_cards
			deck = Deck.all_cards.shuffle
			x = Hand.deal(deck)
			assert_equal(Hand, x.class)
			assert_equal(x.cards, x.cards_to_test)
		end


		def test_cards_dup_creates_duplicates
			cards = [Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
			assert_equal(cards, cards.dup)
		end


		# def test_cards_in_hand
		# 	cards = [Card.new(:eight, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
  #    		deck = Deck.new(cards.dup)
  #     		hand = Hand.deal(deck)
  #     		assert_equal(5, cards.length)
  #     		assert_equal(1, hand.length)
  #     		# assert_equal(hand.cards, cards)
  #       end


end