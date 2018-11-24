require "minitest/autorun"
require_relative "poker_hand_class.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			cards = Deck.all_cards.shuffle
			x = Hand.new(cards)
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
        	assert_equal("2S", hand.cards_to_test[0].to_s)
        	assert_equal("5C", hand.cards_to_test[1].to_s)
        	assert_equal("7C", hand.cards_to_test[2].to_s)
        	assert_equal("pair", hand.evaluate_hand)
        	assert_equal(2, hand.pair?[1].length)
        	assert_equal("8S", hand.pair?[1][0].to_s)
        	assert_equal("8C", hand.pair?[1][1].to_s)
        	hand2 = Hand.new([Card.new(:eight, :clubs), Card.new(:three, :diamonds), Card.new(:jack, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.pair?[0])
        end


        def test_two_pair?
        	hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
        	assert_equal(true, hand.two_pair?[0])
        	assert_equal(1, hand.cards_to_test.length)
        	assert_equal("7C", hand.cards_to_test[0].to_s)
        	assert_equal("two pair", hand.evaluate_hand)
        	assert_equal(2, hand.two_pair?[1].length)
        	assert_equal(2, hand.two_pair?[1][0].length)
        	assert_equal(2, hand.two_pair?[1][1].length)
        	assert_equal("2C", hand.two_pair?[1][0][0].to_s)
        	assert_equal("2S", hand.two_pair?[1][0][1].to_s)
        	assert_equal("8S", hand.two_pair?[1][1][0].to_s)
        	assert_equal("8C", hand.two_pair?[1][1][1].to_s)
        	x = hand.two_pair?[1][0][0].to_s 
        	y = hand.two_pair?[1][1][0].to_s
        	# this tells me that the first pair has a lower value than the second pair, so the second pair is the highest pair
        	assert_operator x.chr, :<, y.chr
        	hand2 = Hand.new([Card.new(:eight, :clubs), Card.new(:three, :diamonds), Card.new(:jack, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.two_pair?[0])
        end


        def test_three_of_a_kind?
        	hand = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
        	assert_equal(true, hand.three_of_a_kind?[0])
        	assert_equal(2, hand.cards_to_test.length)
        	assert_equal("3C", hand.cards_to_test[0].to_s)
        	assert_equal("8S", hand.cards_to_test[1].to_s)
        	assert_equal("three of a kind", hand.evaluate_hand)
        	assert_equal(3, hand.three_of_a_kind?[1].length)
        	assert_equal("2D", hand.three_of_a_kind?[1][0].to_s)
        	assert_equal("2C", hand.three_of_a_kind?[1][1].to_s)
        	assert_equal("2S", hand.three_of_a_kind?[1][2].to_s)
        	hand2 = Hand.new([Card.new(:eight, :clubs), Card.new(:three, :diamonds), Card.new(:jack, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.three_of_a_kind?[0])
        end


        def test_four_of_a_kind?
        	hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
        	assert_equal(true, hand.four_of_a_kind?[0])
        	assert_equal(1, hand.cards_to_test.length)
        	assert_equal("8S", hand.cards_to_test[0].to_s)
        	assert_equal("four of a kind", hand.evaluate_hand)
        	assert_equal(4, hand.four_of_a_kind?[1].length)
        	assert_equal("2H", hand.four_of_a_kind?[1][0].to_s)
        	assert_equal("2C", hand.four_of_a_kind?[1][1].to_s)
        	assert_equal("2D", hand.four_of_a_kind?[1][2].to_s)
        	assert_equal("2S", hand.four_of_a_kind?[1][3].to_s)
        	hand2 = Hand.new([Card.new(:eight, :clubs), Card.new(:three, :diamonds), Card.new(:jack, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.four_of_a_kind?[0])
        end

        def test_full_house?
        	hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
        	assert_equal(true, hand.full_house?[0])
        	assert_equal(2, hand.cards_to_test.length)
        	assert_equal("full house", hand.evaluate_hand)
        	assert_equal(3, hand.full_house?[1].length)
        	# p hand.full_house?
        	# the first array from full_house? returns true, the second array returns the three of a kind, the third array returns the pair
        	assert_equal("2H", hand.full_house?[1][0].to_s)
        	assert_equal("2C", hand.full_house?[1][1].to_s)
        	assert_equal("2S", hand.full_house?[1][2].to_s)
        	assert_equal("8D", hand.full_house?[2][0].to_s)
        	assert_equal("8S", hand.full_house?[2][1].to_s)
        	hand2 = Hand.new([Card.new(:eight, :clubs), Card.new(:three, :diamonds), Card.new(:jack, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.full_house?[0])
        end

        def test_straight?
        	hand = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal("straight", hand.evaluate_hand)
        	# p hand.straight?
        	assert_equal("2D", hand.straight?[0].to_s)
        	assert_equal("3C", hand.straight?[1].to_s)
        	assert_equal("4C", hand.straight?[2].to_s)
        	assert_equal("5C", hand.straight?[3].to_s)
        	assert_equal("6C", hand.straight?[4].to_s)
        	hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.straight?)
        end

        def test_flush?
        	hand = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal("flush", hand.evaluate_hand)
        	# p hand.flush?
        	assert_equal("2C", hand.flush?[0].to_s)
        	assert_equal("4C", hand.flush?[1].to_s)
        	assert_equal("5C", hand.flush?[2].to_s)
        	assert_equal("6C", hand.flush?[3].to_s)
        	assert_equal("9C", hand.flush?[4].to_s)  
        	hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal(false, hand2.flush?)
        end    

        def test_straight_flush?
        	hand = Hand.new([Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        	assert_equal("straight flush", hand.evaluate_hand)
        	# p hand.straight_flush?
        	assert_equal("2C", hand.straight_flush?[0].to_s)
        	assert_equal("3C", hand.straight_flush?[1].to_s)
        	assert_equal("4C", hand.straight_flush?[2].to_s)
        	assert_equal("5C", hand.straight_flush?[3].to_s)
        	assert_equal("6C", hand.straight_flush?[4].to_s)
           	hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
     		assert_equal(false, hand2.straight_flush?)
     	end

     	

end