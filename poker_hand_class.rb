require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand

	def initialize(cards = Deck.new.shuffle)
		@cards = cards
		# p @cards.sort_by! {|card| Card::POKER_VALUES_STRING[card.value]}	
	end

	attr_accessor :cards


	def self.deal(deck = Deck.new.shuffle)
		poker_hand = []
   		poker_hand << Hand.new(deck.pop(5))
   		p poker_hand
  	end
end