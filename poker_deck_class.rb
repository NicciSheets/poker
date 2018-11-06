require_relative "poker_card_class.rb"

class Deck

# initializes Deck class with a deck of all the cards
	def initialize(cards = Deck.all_cards)
    	@cards = cards
	end

	attr_accessor :cards


# puts the cards from class Card into the deck
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


# shuffles the elements in self in place
	def shuffle
		@cards.shuffle!
	end


# deals 5 cards from the deck
	def deal()
		@cards.pop(5)
	end
end