require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

# may need to comment out the @cards_to_test = cards.dup (line 12) and remove :cards_to_test (line 17), if putting through Sinatra 

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
   		# p "poker_hand is #{poker_hand} with #{poker_hand.class}"
  	end
end

