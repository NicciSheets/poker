require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"
require_relative "poker_hand_class_2.rb"

	
 	

   	def game_output
   		# deck = Deck.new.shuffle
		@black = Hand.deal()
		@white = Hand.deal()
		# black = @black
		# white = @white
		p "@black is #{@black.hand_rating} and #{@black.score} and #{@black.cards_sorted}"
		p "@white is #{@white.hand_rating} and #{@white.score} and #{@white.cards_sorted}"
	end   	

	def game_play(game_output)
		if @black.hand_rating == @white.hand_rating
			if @black.poker_hand_tie2[0] == @white.poker_hand_tie2[0]
				p "#{@black.poker_hand_tie2[1] <=> @white.poker_hand_tie2[1]} for [1]"
				return @black.poker_hand_tie2[1] <=> @white.poker_hand_tie2[1]
			else 
				p "#{@black.poker_hand_tie2[0] <=> @white.poker_hand_tie2[0]} for [0]"
				return @black.poker_hand_tie2[0] <=> @white.poker_hand_tie2[0]
			end
		else
			@black.score_rating <=> @white.score_rating
		end
	end




    #     unless @black.hand_rating == @white.hand_rating
    #    		return @black.score_rating <=> @white.score_rating
    #    	else 
    #    		if @black.poker_hand_tie[0] == @white.poker_hand_tie[0]
    #    			p "#{@black.poker_hand_tie[0] == @white.poker_hand_tie[0]}"
    #    			return @black.poker_hand_tie[1] <=> @white.poker_hand_tie[1]
    #    			p "#{@black.poker_hand_tie[1] <=> @white.poker_hand_tie[1]}"
    #    		else
    #    			return @black.poker_hand_tie[0] <=> @white.poker_hand_tie[0]
    #    		end
    #    		# return @black.poker_hand_tie[0] <=> @white.poker_hand_tie[0]
    #    	end
    # end
 


# 1 "Black Wins"......(-1) "White Wins"......0 Tie
	# p game_output
	p game_play(game_output)