require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"
require_relative "poker_test_hand_class.rb"

class Hand

# intializes the Hand class with shuffled cards of the deck
# cards.sort_by! sorts the cards based upon their poker values
# cards.dup gives me the cards to test by creating a copy of the cards in the hand
	def initialize(cards = Deck.new.shuffle)
		@cards = cards
		@cards.sort_by! {|card| Card::POKER_VALUES_STRING[card.value]}	
		@cards_to_test = @cards.dup
	end

	attr_accessor :cards, :cards_to_test

# used to deal 5 cards into the hand
	def self.deal(deck = Deck.new.shuffle)
		poker_hand = []
   		poker_hand << Hand.new(deck.take(5))
  	end
end