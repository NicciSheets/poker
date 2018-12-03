require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"
require_relative "poker_hand_class_2.rb"

	
 	

 #   	def game_output
	# 	@black = Hand.deal()
	# 	@white = Hand.deal()
	# 	p "@black is #{@black.hand_rating} and #{@black.score} and #{@black.cards_sorted}"
	# 	p "@white is #{@white.hand_rating} and #{@white.score} and #{@white.cards_sorted}"
	# end   	

	def game_output
		@black 
		@white 
	end

	def game_play(game_output)
		if @black.hand_rating == @white.hand_rating
			return @black.poker_hand_tie2 <=> @white.poker_hand_tie2
		else
			@black.score_rating <=> @white.score_rating
		end
	end
	

	def winner
		compared = game_play(game_output)
		if compared == 1
			"Black Wins"
		elsif compared == (-1)
			"White Wins"
		else
			"Tie"
		end
	end



# 1 "Black Wins"......(-1) "White Wins"......0 Tie
	# p game_output
	# p game_play(game_output)
# @black = Hand.new([Card.new(:queen, :clubs), Card.new(:ten, :diamonds), Card.new(:five, :clubs), Card.new(:four, :diamonds), Card.new(:three, :clubs)])
# @white = Hand.new([Card.new(:queen, :diamonds), Card.new(:jack, :diamonds), Card.new(:six, :clubs), Card.new(:four, :spades), Card.new(:two, :clubs)])
# 		p winner

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