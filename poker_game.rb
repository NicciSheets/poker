require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"
require_relative "poker_hand_class_2.rb"

	
 	
# comment lines 8-23 back in and comment out the same def above this for testing purposes
	# def game_output
	# 	@black 
	# 	@white 
	# end

	# def winner()
	# 	game_output = game_output
	# 	compared = game_play(game_output)
	# 	if compared == 1
	# 		"Black Wins"
	# 	elsif compared == (-1)
	# 		"White Wins"
	# 	else
	# 		"Tie"
	# 	end
	# end

 
	# comment this out for testing, when hard coding the @black and @white hands
   	def game_output
		@black = Hand.deal()
		@white = Hand.deal()
		p "@black #{@black.cards} is #{@black.hand_rating} and #{@black.score} and @white is #{@white.hand_rating} and #{@white.score}"
	end   	



	def game_play(game_output)
		if @black.hand_rating == @white.hand_rating
			return @black.poker_hand_tie2 <=> @white.poker_hand_tie2
		else
			@black.score_rating <=> @white.score_rating
		end
	end
	

	def winner(game_output)
		game_output = game_output
		compared = game_play(game_output)
		if compared == 1
			"Black Wins - #{@black.hand_rating}"
		elsif compared == (-1)
			"White Wins - #{@white.hand_rating}"
		else
			"Tie"
		end
	end

	# p game_output

# 1 "Black Wins"......(-1) "White Wins"......0 Tie

# before refactoring the comparison for game_play
# def game_play(game_output)
	# 	if @black.hand_rating == @white.hand_rating
	# 		if @black.poker_hand_tie2[0] == @white.poker_hand_tie2[0]
	# 			if @black.poker_hand_tie2[1] == @white.poker_hand_tie2[1]
	# 				return @black.poker_hand_tie2[2] <=> @white.poker_hand_tie2[2]
	# 			else
	# 				return @black.poker_hand_tie2[1] <=> @white.poker_hand_tie2[1]
	# 			end
	# 		else
	# 			return @black.poker_hand_tie2[0] <=> @white.poker_hand_tie2[0]
	# 		end
	# 	else
	# 		@black.score_rating <=> @white.score_rating
	# 	end
	# end