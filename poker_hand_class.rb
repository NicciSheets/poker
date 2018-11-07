require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand  	

# intializes the Hand class with shuffled cards of the deck
# cards.sort_by! sorts the cards based upon their poker values
# cards.dup gives me the cards to test by creating a copy of the cards in the hand
	def initialize(cards = Deck.all_cards.shuffle)
		@cards = cards
		@cards.sort_by! {|card| Card::POKER_VALUES_STRING[card.value]}	
		@cards_to_test = @cards.dup
	end

	attr_accessor :cards, :cards_to_test


# used to deal 5 cards into the hand; deck = Deck.all_cards.shuffle
	def self.deal(deck)
		Hand.new(deck.take(5))
  	end

  	
  	def evaluate_hand
  		if pair?[0]
  			"pair"
  		end
  	end


# if the value of 2 cards are the same, returns as true for a pair; uses a different way to iterate through the cards (rather than using a counter)
  	def pair?
	    cards.each_with_index do |card, index1|
	      	(index1+1...cards.length).each do |index2| 
	      		# p (index1+1...cards.length)
	        	if card.value == cards[index2].value
	          		cards_to_test.delete(card)
	          		cards_to_test.delete(cards[index2])
	          	return [true, [card, cards[index2]]]
	        	end
	     	end
	    end
	    [false]
	end
end

