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
            # assert_equal("Four of a Kind", hand.four_of_a_kind?)
            # assert_equal("2", hand.four_of_a_kind?[2])
            # assert_equal("8", hand.cards_values[-1])
        end
           


        def test_full_house?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            # p "hand.full_house? is #{hand.full_house?}"
            # p hand
            # p hand.full_house?
            assert_equal(true, hand.full_house?)
            # assert_equal("Full House", hand.full_house?[1])
            # the first set is the pair, the second set is the three of a kind
            # assert_equal("Pair 8", hand.full_house?[2][0])
            # assert_equal("Three of a Kind 2", hand.full_house?[2][1])
            # assert_equal("8", hand.cards_values[-1])
        end

   

        def test_three_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p "hand.three_of_a_kind? is #{hand.three_of_a_kind?}"
            assert_equal(true, hand.three_of_a_kind?)
            # assert_equal("Three of a Kind", hand.three_of_a_kind?)
            # assert_equal("2", hand.three_of_a_kind?[2])
            # assert_equal("8", hand.cards_values[-1])
        end
                  

        def test_two_pair?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            # p "hand.two_pair? is #{hand.two_pair?}"
            assert_equal(true, hand.two_pair?)
            # assert_equal("Two Pair", hand.two_pair?)
            # assert_equal("2", hand.two_pair?[2][0])
            # assert_equal("8", hand.two_pair?[2][1])
            # assert_equal("J", hand.cards_values[-1])
        end
      
              
        def test_pair?
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            # p "hand.pair? is #{hand.pair?}"
            assert_equal(true, hand.pair?)
            # assert_equal("Pair", hand.pair?)
            # assert_equal("7", hand.pair?[2])
            # assert_equal("8", hand.cards_values[-1]) 
        end

    
        def test_straight?
            hand = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(true, hand.straight?)
            # assert_equal("Straight", hand.straight?)
            # p "hand.straight? is #{hand.straight?}"
            # assert_equal("6", hand.cards_values[-1])
        end

        def test_flush?
            hand = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            # p "hand.flush? is #{hand.flush?}"
            assert_equal(true, hand.flush?)
            # assert_equal("Flush", hand.flush?)
            # assert_equal("C", hand.cards_suits[-1])
            # assert_equal("9", hand.cards_values[-1])
            # assert_equal(1, hand.cards_suits.uniq.length)
            # ^^^that tests shows that there's only the one suit in the whole hand
        end    

        # def test_straight_flush?
        #     hand = Hand.new([Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
        #     assert_equal(true, hand.straight_flush?)
        #     # assert_equal("Straight Flush", hand.straight_flush?)
        #     # p "hand.straight_flush? is #{hand.straight_flush?}"
        #     # assert_equal("6", hand.cards_values[-1])
        #     # assert_equal("C", hand.cards_suits[-1])
        #     # assert_equal(1, hand.cards_suits.uniq.length)
        # end

        def test_high_card?
            hand = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            # p "hand.high_card? is #{hand.high_card?}"
            # p hand.high_card?
            assert_equal(true, hand.high_card?)
            # assert_equal("High Card", hand.high_card?)
            # assert_equal("JC", hand.high_card?[2])
        end

        def test_hand_values
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            assert_equal("Pair", hand.hand_rating)
            # p hand
            # p hand.hand_rating
            hand2 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            # p hand2.hand_rating
            assert_equal("Full House", hand2.hand_rating)
            hand3 = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal("Three of a Kind", hand3.hand_rating)
            # p hand3.hand_rating
            hand4 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal("Four of a Kind", hand4.hand_rating)
            # p hand4.hand_rating
            hand5 = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            # p hand5.hand_rating
            assert_equal("Two Pair", hand5.hand_rating)
            hand6 = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            assert_equal("High Card", hand6.hand_rating)
            hand7 = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            # p hand7.hand_rating
            assert_equal("Straight", hand7.hand_rating)
            hand8 = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            # p hand8.hand_rating
            assert_equal("Flush", hand8.hand_rating)

       end


        

end