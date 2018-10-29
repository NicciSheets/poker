# card, hand, deck, game rules

class Card
	attr_reader :rank, :suit, :set
	def initialize(rank, suit)
		@rank = "#{rank}"
		@suit = "#{suit}"
		@set = "#{rank}#{suit}"
	end

	
end


