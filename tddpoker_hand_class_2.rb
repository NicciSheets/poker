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
            # p hand.cards_sorted
            # p hand.cards_sorted[0].to_s
            assert_equal("3C", hand.cards_sorted[0].to_s)
            assert_equal("4C", hand.cards_sorted[1].to_s)
            assert_equal("5C", hand.cards_sorted[2].to_s)
            assert_equal("6C", hand.cards_sorted[3].to_s)
            assert_equal("8C", hand.cards_sorted[4].to_s)
            assert_equal("3C", hand_sorted.cards_sorted[0].to_s)
            assert_equal("4C", hand_sorted.cards_sorted[1].to_s)
            assert_equal("5C", hand_sorted.cards_sorted[2].to_s)
            assert_equal("6C", hand_sorted.cards_sorted[3].to_s)
            assert_equal("8C", hand_sorted.cards_sorted[4].to_s)
        end


        def test_four_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p "hand.four_of_a_kind? is #{hand.four_of_a_kind?}"
            assert_equal(true, hand.four_of_a_kind?[0])
            # assert_equal("Four of a Kind", hand.four_of_a_kind?)
            # assert_equal("2", hand.four_of_a_kind?[2])
            # assert_equal("8", hand.cards_values[-1])
        end
           


        def test_full_house?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            # p "hand.full_house? is #{hand.full_house?}"
            # p hand
            # p hand.full_house?
            assert_equal(true, hand.full_house?[0])
            # p hand.full_house?
            # p hand.full_house?[0]
            # p hand.full_house?[1]
            # assert_equal("Full House", hand.full_house?[1])
            # the first set is the pair, the second set is the three of a kind
            # assert_equal("Pair 8", hand.full_house?[2][0])
            # assert_equal("Three of a Kind 2", hand.full_house?[2][1])
            # assert_equal("8", hand.cards_values[-1])
        end

   

        def test_three_of_a_kind?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            # p "hand.three_of_a_kind? is #{hand.three_of_a_kind?}"
            assert_equal(true, hand.three_of_a_kind?[0])
            # assert_equal("Three of a Kind", hand.three_of_a_kind?)
            # assert_equal("2", hand.three_of_a_kind?[2])
            # assert_equal("8", hand.cards_values[-1])
        end
                  

        def test_two_pair?
            hand = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            # p "hand.two_pair? is #{hand.two_pair?}"
            assert_equal(true, hand.two_pair?[0])
            # assert_equal("Two Pair", hand.two_pair?)
            # assert_equal("2", hand.two_pair?[2][0])
            # assert_equal("8", hand.two_pair?[2][1])
            # assert_equal("J", hand.cards_values[-1])
        end
      
              
        def test_pair?
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            # p "hand.pair? is #{hand.pair?}"
            assert_equal(true, hand.pair?[0])
            # assert_equal("Pair", hand.pair?)
            # assert_equal("7", hand.pair?[2])
            # assert_equal("8", hand.cards_values[-1]) 
        end

    
        def test_straight?
            hand = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            # p "hand is #{hand}"
            # p "hand.straight? is hand.straight?"
            assert_equal(true, hand.straight?[0])
            # assert_equal("Straight", hand.straight?)
            # p "hand.straight? is #{hand.straight?}"
            # assert_equal("6", hand.cards_values[-1])
        end

        def test_flush?
            hand = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            # p "hand.flush? is #{hand.flush?}"
            assert_equal(true, hand.flush?[0])
            # assert_equal("Flush", hand.flush?)
            # assert_equal("C", hand.cards_suits[-1])
            # assert_equal("9", hand.cards_values[-1])
            # assert_equal(1, hand.cards_suits.uniq.length)
            # ^^^that tests shows that there's only the one suit in the whole hand
        end    

        def test_straight_flush?
            hand = Hand.new([Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(true, hand.straight_flush?[0])
            # assert_equal("Straight Flush", hand.straight_flush?)
            # p "hand.straight_flush? is #{hand.straight_flush?}"
            # assert_equal("6", hand.cards_values[-1])
            # assert_equal("C", hand.cards_suits[-1])
            # assert_equal(1, hand.cards_suits.uniq.length)
        end

        def test_high_card?
            hand = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            # p "hand.high_card? is #{hand.high_card?}"
            # p hand.high_card?
            assert_equal(true, hand.high_card?[0])
            # assert_equal("High Card", hand.high_card?)
            # assert_equal("JC", hand.high_card?[2])
        end

        def test_hand_rating
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            assert_equal("Pair", hand.hand_rating)
            hand2 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            assert_equal("Full House", hand2.hand_rating)
            hand3 = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal("Three of a Kind", hand3.hand_rating)
            hand4 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal("Four of a Kind", hand4.hand_rating)
            hand5 = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            assert_equal("Two Pair", hand5.hand_rating)
            hand7 = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal("Straight", hand7.hand_rating)
            hand8 = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal("Flush", hand8.hand_rating)
            hand9 = Hand.new([Card.new(:two, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal("Straight Flush", hand9.hand_rating)
            hand10 = Hand.new([Card.new(:two, :clubs), Card.new(:three, :hearts), Card.new(:six, :hearts), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal("Pair", hand10.hand_rating)
            # p hand10.score
            hand11 = Hand.new([Card.new(:four, :hearts), Card.new(:six, :diamonds), Card.new(:six, :hearts), Card.new(:four, :clubs), Card.new(:six, :clubs)])
            assert_equal("Full House", hand11.hand_rating)
            p hand11.score
            hand12 = Hand.new([Card.new(:five, :hearts), Card.new(:three, :clubs), Card.new(:five, :diamonds), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal("Three of a Kind", hand12.hand_rating)
            # p hand12.score
            hand33 = Hand.new([Card.new(:jack, :clubs), Card.new(:jack, :hearts), Card.new(:jack, :diamonds), Card.new(:jack, :spades), Card.new(:six, :clubs)])
            assert_equal("Four of a Kind", hand33.hand_rating)
            # p hand33.score
            hand13 = Hand.new([Card.new(:queen, :spades), Card.new(:two, :clubs), Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:queen, :clubs)])
            assert_equal("Two Pair", hand13.hand_rating)
            p hand13.score
            hand14 = Hand.new([Card.new(:eight, :diamonds), Card.new(:seven, :hearts), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal("Straight", hand14.hand_rating)
            # p hand14.score
            hand15 = Hand.new([Card.new(:ace, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:seven, :clubs), Card.new(:six, :clubs)])
            assert_equal("Flush", hand15.hand_rating)
            p hand15.score
            hand16 = Hand.new([Card.new(:five, :clubs), Card.new(:six, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :clubs), Card.new(:nine, :clubs)])
            assert_equal("Straight Flush", hand16.hand_rating)
            # p hand16.score
            hand17 = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            assert_equal("High Card", hand17.hand_rating)
            # p hand17.score
       end

       def test_hand_scoring
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])
            assert_equal(2, hand.score_rating)
            hand2 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            assert_equal(7, hand2.score_rating)
            hand3 = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal(4, hand3.score_rating) 
            hand4 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal(8, hand4.score_rating)
            hand5 = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            assert_equal(3, hand5.score_rating)
            hand7 = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(5, hand7.score_rating)
            hand8 = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(6, hand8.score_rating)
            hand9 = Hand.new([Card.new(:seven, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(9, hand9.score_rating)
            hand17 = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            assert_equal(1, hand17.score_rating)
        end

        def test_two_pair_tie_return
            hand13 = Hand.new([Card.new(:three, :spades), Card.new(:two, :clubs), Card.new(:ace, :clubs), Card.new(:ace, :diamonds), Card.new(:three, :clubs)])
            assert_equal(["A", "3"], hand13.two_pair_tie)
        end

        def test_pair_matcher_tie_return
            hand13 = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:ace, :clubs), Card.new(:ace, :diamonds), Card.new(:three, :clubs)])
            assert_equal(["7", "3", "2"], hand13.pair_matcher_tie) 
        end

        

        def test_poker_hand_for_tie
            # pair
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])                                     
            assert_equal(["7", "8", "5", "2"], hand.poker_hand_tie)
            # full house
            hand2 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            assert_equal(["2"], hand2.poker_hand_tie)
            # three of a kind
            hand3 = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal(["2"], hand3.poker_hand_tie)
            # four of a kind
            hand4 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal(["2"], hand4.poker_hand_tie) 
            # two pair
            hand5 = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            assert_equal(["8", "2", "J"], hand5.poker_hand_tie)
            # straight
            hand7 = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(["6"], hand7.poker_hand_tie)
            # flush
            hand8 = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(["9", "6", "5", "4", "2"], hand8.poker_hand_tie) 
            # straight flush
            hand9 = Hand.new([Card.new(:seven, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal(["7"], hand9.poker_hand_tie)
            # high card
            hand17 = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            assert_equal(["J", "6", "5", "3", "2"], hand17.poker_hand_tie)
        end

        def test_return_the_poker_hand_tie_with_poker_values_for_ranking
            # pair
            hand = Hand.new([Card.new(:seven, :spades), Card.new(:two, :clubs), Card.new(:seven, :clubs), Card.new(:eight, :spades), Card.new(:five, :clubs)])                                     
            assert_equal([7, 8, 5, 2], hand.poker_hand_tie2) 
            # full house
            hand2 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:eight, :diamonds)])
            assert_equal([2], hand2.poker_hand_tie2)
             # three of a kind
            hand3 = Hand.new([Card.new(:two, :spades), Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal([2], hand3.poker_hand_tie2)
            # four of a kind
            hand4 = Hand.new([Card.new(:two, :spades), Card.new(:two, :hearts), Card.new(:two, :clubs), Card.new(:eight, :spades), Card.new(:two, :diamonds)])
            assert_equal([2], hand4.poker_hand_tie2) 
             # two pair
            hand5 = Hand.new([Card.new(:two, :spades), Card.new(:eight, :clubs), Card.new(:jack, :clubs), Card.new(:eight, :spades), Card.new(:two, :clubs)])
            assert_equal([8, 2, 11], hand5.poker_hand_tie2)
            # straight
            hand7 = Hand.new([Card.new(:two, :diamonds), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal([6], hand7.poker_hand_tie2)
            # flush
            hand8 = Hand.new([Card.new(:two, :clubs), Card.new(:nine, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal([9, 6, 5, 4, 2], hand8.poker_hand_tie2) 
            # straight flush
            hand9 = Hand.new([Card.new(:seven, :clubs), Card.new(:three, :clubs), Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
            assert_equal([7], hand9.poker_hand_tie2)
            # high card
            hand17 = Hand.new([Card.new(:three, :clubs), Card.new(:two, :clubs), Card.new(:five, :spades), Card.new(:jack, :clubs), Card.new(:six, :diamonds)])
            assert_equal([11, 6, 5, 3, 2], hand17.poker_hand_tie2)
        end           

end