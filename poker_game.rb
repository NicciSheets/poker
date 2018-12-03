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
        unless @black.hand_rating == @white.hand_rating
       		return @black.score_rating <=> @white.score_rating
       	else 
       		return @black.poker_hand_tie[0] <=> @white.poker_hand_tie[0]
       		# p "#{@black.poker_hand_tie[0]} and #{@white.poker_hand_tie[0]} and #{@black.poker_hand_tie[0] <=> @white.poker_hand_tie[0]}"
       	end
        # p "@black.score_rating is #{@black.score_rating} and @white is #{@white.score_rating}"
    end
 
 	# def game_winner(game_output)
 	# 	if @black.hand_rating == @white.hand_rating
 	# 		@black.poker_hand_tie <=> @white.poker_hand_tie	
 	# 	end
 	# end



# 1 "Black Wins"......(-1) "White Wins"......0 Tie
	# p game_output
	p game_play(game_output)
	# p game_winner(game_output)