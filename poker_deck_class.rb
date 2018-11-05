require_relative "poker_card_class.rb"

class Deck

	def initialize(cards = Deck.all_cards)
    	@cards = cards
	end

	attr_accessor :cards

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

	def shuffle
		@cards.shuffle!
	end

	def deal()
		@cards.pop(5)
	end
end