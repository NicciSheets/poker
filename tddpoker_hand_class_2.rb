require "minitest/autorun"
require_relative "poker_hand_class_2.rb"

class TddPokerHandClass2 < Minitest::Test

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


        def test_four_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p "hand.four_of_a_kind? is #{hand.four_of_a_kind?}"
            assert_equal(true, hand.four_of_a_kind?)
            # assert_equal(:four_of_a_kind, hand.four_of_a_kind?[1])
            # assert_equal("2", hand.four_of_a_kind?[2])
            # assert_equal("8", hand.cards_values[-1])
        end
           


        # def test_full_house?
        #     hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
        #     # p "hand.full_house? is #{hand.full_house?}"
        #     assert_equal(true, hand.full_house?[0])
        #     assert_equal(:full_house, hand.full_house?[1])
        #     # the first set is the pair, the second set is the three of a kind
        #     assert_equal("pair 8", hand.full_house?[2][0])
        #     assert_equal("three_of_a_kind 2", hand.full_house?[2][1])
        #     assert_equal("8", hand.cards_values[-1])
        # end

   

        def test_three_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p "hand.three_of_a_kind? is #{hand.three_of_a_kind?}"
            assert_equal(true, hand.three_of_a_kind?)
            # assert_equal(:three_of_a_kind, hand.three_of_a_kind?[1])
            # assert_equal("2", hand.three_of_a_kind?[2])
            # assert_equal("8", hand.cards_values[-1])
        end
                  

        # def test_two_pair?
        #     hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
        #     # p "hand.two_pair? is #{hand.two_pair?}"
        #     assert_equal(true, hand.two_pair?[0])
        #     assert_equal(:two_pair, hand.two_pair?[1])
        #     assert_equal("2", hand.two_pair?[2][0])
        #     assert_equal("8", hand.two_pair?[2][1])
        #     assert_equal("J", hand.cards_values[-1])
        # end
      
              
        def test_pair?
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            # p "hand.pair? is #{hand.pair?}"
            assert_equal(true, hand.pair?)
            # assert_equal(:pair, hand.pair?[1])
            # assert_equal("7", hand.pair?[2])
            # assert_equal("8", hand.cards_values[-1]) 
        end

    
      #   def test_straight?
      #   	hand = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
      #       assert_equal(true, hand.straight?[0])
      #   	assert_equal(:straight, hand.straight?[1])
      #   	# p "hand.straight? is #{hand.straight?}"
      #       assert_equal("6", hand.cards_values[-1])
      #   end

      #   def test_flush?
      #   	hand = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
      #   	# p "hand.flush? is #{hand.flush?}"
      #       assert_equal(true, hand.flush?[0])
      #       assert_equal(:flush, hand.flush?[1])
      #       assert_equal("C", hand.cards_suits[-1])
      #       assert_equal("9", hand.cards_values[-1])
      #       assert_equal(1, hand.cards_suits.uniq.length)
      #       # ^^^that tests shows that there's only the one suit in the whole hand
      #   end    

      #   def test_straight_flush?
      #   	hand = Hand.new([Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
      #       assert_equal(true, hand.straight_flush?[0])
      #   	assert_equal(:straight_flush, hand.straight_flush?[1])
      #   	# p "hand.straight_flush? is #{hand.straight_flush?}"
      #       assert_equal("6", hand.cards_values[-1])
      #       assert_equal("C", hand.cards_suits[-1])
      #       assert_equal(1, hand.cards_suits.uniq.length)
     	# end

      #   def test_high_card?
      #       hand = Hand.new([Card.new(:two, :spades), Card.new(:three, :hearts), Card.new(:five, :clubs), Card.new(:eight, :spades), Card.new(:ace, :diamonds)])
      #       # p "hand.high_card? is #{hand.high_card?}"
      #       assert_equal(true, hand.high_card?[0])
      #       assert_equal(:high_card, hand.high_card?[1])
      #       assert_equal("AD", hand.high_card?[2])
      #   end

        def test_ranker
            # the hand below holds a pair
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            assert_equal(:pair, hand.ranker)
            # p hand.ranker_values 
            assert_equal(2, hand.ranker_values)
            hand2 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # hand2.ranker2
             # assert_equal()
        end


   end