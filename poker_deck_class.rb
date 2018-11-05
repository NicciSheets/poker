require_relative "poker_card_class.rb"

class Deck

	def initialize(cards)
		cards = Deck.all_cards
    	@cards = cards
	end

	def self.all_cards
		cards = []
		a = Card.values
		b = Card.suits
		a.each do |value|
			b.each do |suit|
				cards << Card.new(value, suit)
			end
		end
		cards
	end
end