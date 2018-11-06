require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand

	def initialize()
		@cards = cards
	end

	attr_accessor :cards
end