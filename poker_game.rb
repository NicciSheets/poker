require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"
require_relative "poker_hand_class_2.rb"

	
 	

   	def game_output
   		# deck = Deck.new.shuffle
		@black = Hand.deal()
		@white = Hand.deal()
		# black = @black
		# white = @white
		p "@black is #{@black} and is #{@black.hand_rating} and #{@black.score} and #{@black.cards_sorted} and #{@black.poker_hand_tie}"
		p "@white is #{@white} and is #{@white.hand_rating} and #{@white.score} and #{@white.cards_sorted} and #{@white.poker_hand_tie}"
	end   	

	def game_play(game_output)
        @black.score_rating <=> @white.score_rating
    end
 
    def ==(other_hand)
    	rank_type = @black.hand_rating
    	other_hand_rank_type = @white.hand_rating

    	if rank_type == other_hand_rank_type
    		if rank_type == "Full House"
    			@black.poker_hand_tie <=> @white.poker_hand_tie
    		end
    		if rank_type == "Pair"
    			
    	end
    end

    def game_winner
    	if 1
    		"Black Wins"
    	elsif -1
    		"White Wins"
    	else
    		"Tie"
    	end
    end
   

    # p game_play(game_output)
	# p game_output
	p 