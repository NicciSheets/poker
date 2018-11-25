require "minitest/autorun"
require_relative "poker_hand_class_2.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			cards = Deck.all_cards.shuffle
			x = Hand.new(cards)
			assert_equal(Hand, x.class)
		end


		def test_hand_is_getting_dealt_cards_randomized_for_game_use
			deck = Deck.all_cards.shuffle
			x = Hand.deal(deck)
            deck2 = Deck.all_cards.shuffle
            x2 = Hand.deal(deck2)
			assert_equal(Hand, x.class)
            assert_equal(Hand, x2.class)
			refute_equal(x, x2)
            assert_equal(5, x.cards_sorted.length)
            assert_equal(5, x2.cards_sorted.length)
		end


		def test_cards_are_sorted_regarding_poker_values
			cards = [Card.new(:eight, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)]
			deck = Deck.new(cards)
			hand = Hand.deal(deck)
			cards_sorted = [Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs), Card.new(:eight, :clubs)]
			deck_sorted = Deck.new(cards_sorted)
			hand_sorted = Hand.deal(deck_sorted)
			assert_equal(hand.cards_sorted, hand_sorted.cards_sorted)
            # p hand.cards_sorted
            # p hand.cards_sorted[0].to_s
            assert_equal("3C", hand.cards_sorted[0].to_s)
            assert_equal("4C", hand.cards_sorted[1].to_s)
            assert_equal("5C", hand.cards_sorted[2].to_s)
            assert_equal("6C", hand.cards_sorted[3].to_s)
            assert_equal("8C", hand.cards_sorted[4].to_s)
		end

		
        def test_pair?
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            # p hand.pair?
            assert_equal(true, hand.pair?[0])
            # the test below gives us the answer of "Pair" if true
            assert_equal("Pair", hand.pair?[1])
            # the test below gives us the value of the paired cards
            assert_equal("7", hand.pair?[2])
            # the test below gives us the value of the highest card in the hand, whether it is the pair or not
            assert_equal("8", hand.cards_values[-1]) 
            hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(false, hand2.pair?[0])
            # the test below gives us the value of the highest card in the hand to be used for determining winner
            assert_equal("9", hand2.cards_values[-1]) 
        end

        def test_three_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p hand.three_of_a_kind?
            assert_equal(true, hand.three_of_a_kind?[0])
            assert_equal("Three of a Kind", hand.three_of_a_kind?[1])
            assert_equal("2", hand.three_of_a_kind?[2])
            assert_equal("8", hand.cards_values[-1])
            hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(false, hand2.three_of_a_kind?[0])
            assert_equal("9", hand2.cards_values[-1])
        end

        def test_four_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p hand.four_of_a_kind?
            assert_equal(true, hand.four_of_a_kind?[0])
            assert_equal("Four of a Kind", hand.four_of_a_kind?[1])
            assert_equal("2", hand.four_of_a_kind?[2])
            assert_equal("8", hand.cards_values[-1])
            hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(false, hand2.four_of_a_kind?[0])
            assert_equal("9", hand2.cards_values[-1])
        end
           

        def test_two_pair?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            # p hand.two_pair?
            assert_equal(true, hand.two_pair?[0])
            assert_equal("Two Pair", hand.two_pair?[1])
            assert_equal("2", hand.two_pair?[2][0])
            assert_equal("8", hand.two_pair?[2][1])
            assert_equal("J", hand.cards_values[-1])
            hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(false, hand2.two_pair?[0])
            assert_equal("9", hand2.cards_values[-1])
        end
      
              
        def test_full_house?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            # p hand.full_house?
            assert_equal(true, hand.full_house?[0])
            assert_equal("Full House", hand.full_house?[1])
            # the first set is the pair, the second set is the three of a kind
            assert_equal("Pair 8", hand.full_house?[2][0])
            assert_equal("Three of a Kind 2", hand.full_house?[2][1])
            hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            # p hand2.full_house?
            # assert_equal(false, hand2.full_house?[0])
        end

  #       def test_full_house?
  #       	hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
  #       	assert_equal(true, hand.full_house?[0])
  #       	assert_equal(2, hand.cards_to_test.length)
  #       	assert_equal("full house", hand.evaluate_hand)
  #       	assert_equal(3, hand.full_house?[1].length)
  #       	# p hand.full_house?
  #       	# the first array from full_house? returns true, the second array returns the three of a kind, the third array returns the pair
  #       	assert_equal("2H", hand.full_house?[1][0].to_s)
  #       	assert_equal("2C", hand.full_house?[1][1].to_s)
  #       	assert_equal("2S", hand.full_house?[1][2].to_s)
  #       	assert_equal("8D", hand.full_house?[2][0].to_s)
  #       	assert_equal("8S", hand.full_house?[2][1].to_s)
  #       	hand2 = Hand.new([Card.new(:eight, :clubs), Card.new(:three, :diamonds), Card.new(:jack, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #       	assert_equal(false, hand2.full_house?[0])
  #       end

  #       def test_straight?
  #       	hand = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #       	assert_equal("straight", hand.evaluate_hand)
  #       	# p hand.straight?
  #       	assert_equal("2D", hand.straight?[0].to_s)
  #       	assert_equal("3C", hand.straight?[1].to_s)
  #       	assert_equal("4C", hand.straight?[2].to_s)
  #       	assert_equal("5C", hand.straight?[3].to_s)
  #       	assert_equal("6C", hand.straight?[4].to_s)
  #       	hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #       	assert_equal(false, hand2.straight?)
  #       end

  #       def test_flush?
  #       	hand = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #       	assert_equal("flush", hand.evaluate_hand)
  #       	# p hand.flush?
  #       	assert_equal("2C", hand.flush?[0].to_s)
  #       	assert_equal("4C", hand.flush?[1].to_s)
  #       	assert_equal("5C", hand.flush?[2].to_s)
  #       	assert_equal("6C", hand.flush?[3].to_s)
  #       	assert_equal("9C", hand.flush?[4].to_s)  
  #       	hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #       	assert_equal(false, hand2.flush?)
  #       end    

  #       def test_straight_flush?
  #       	hand = Hand.new([Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #       	assert_equal("straight flush", hand.evaluate_hand)
  #       	# p hand.straight_flush?
  #       	assert_equal("2C", hand.straight_flush?[0].to_s)
  #       	assert_equal("3C", hand.straight_flush?[1].to_s)
  #       	assert_equal("4C", hand.straight_flush?[2].to_s)
  #       	assert_equal("5C", hand.straight_flush?[3].to_s)
  #       	assert_equal("6C", hand.straight_flush?[4].to_s)
  #          	hand2 = Hand.new([Card.new(:two, :diamonds), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  #    		assert_equal(false, hand2.straight_flush?)
  #    	end

     	

end