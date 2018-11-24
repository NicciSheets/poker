require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand  	

# intializes the Hand class with shuffled cards of the deck
# cards.sort_by! sorts the cards based upon their poker values
# cards_values gives us only the value of the cards once they are sorted according to their poker value
	def initialize(cards)
		@cards = cards
		@cards_sorted = @cards.sort_by! {|card| Card::POKER_VALUES_STRING[card.value]}	
		@cards_values = @cards_sorted.map {|card| Card::VALUE_STRING[card.value]}
	end
# Card::POKER_VALUES_STRING is a compound expression of a constant reference (POKER_VALUES_STRING) is the constant and it returns the value of the constant

	attr_accessor :cards_values, :cards_sorted


# used to deal 5 cards into the hand; deck = Deck.all_cards.shuffle
	def self.deal(deck)
		Hand.new(deck.take(5))
  	end

	def pair?
		# p @cards_values	
		hash = Hash.new(0)
 		@cards_values.each { |item| hash[item] += 1 }
 		if hash.values.include?(2) 
  			return [true, "Pair", hash.key(2)]
  		end
  		[false]
  		#hash.key(2) gives you the value of the pair, in case you have a tie and need to compare which is higher
	end

	def three_of_a_kind?
		hash = Hash.new(0)
		@cards_values.each { |item| hash[item] += 1 }
		if hash.values.include?(3)
			return [true, "Three of a Kind", hash.key(3)]
		end
		[false]
	end

	def four_of_a_kind?
		hash = Hash.new(0)
		@cards_values.each { |item| hash[item] +=1 }
		if hash.values.include?(4)
			return [true, "Four of a Kind", hash.key(4)]
		end
		[false]
	end

# the second paried.keys[2][1] is the higher of the two pairs, use it for comparing when there is a tie of two pairs between hands
	def two_pair?
		hash = Hash.new(0)
		@cards_values.each { |item| hash[item] += 1 }
		if (hash.values - [2]).size == 1
			paired = hash.delete_if { |key, value| value == 1}
			return [true, "Two Pair", paired.keys]
		end
		[false]
	end


# # first it checks criteria for three of a kind and if returns true for that, then checks to see if the 2 cards left in cards_to_test are the same value, if yes, it's a full house
# 	def full_house?
# 		if three_of_a_kind?[0]
# 			if cards_to_test[0].value == cards_to_test[1].value
# 				return [true, three_of_a_kind?[1], [cards_to_test[0], cards_to_test[1]]]
# 			end
# 		end
# 		[false]
# 	end


# # checks to see if each consecutive card is one higher than the previous
# 	def straight?
#     	cards.each_with_index do |card, index|
#       		next if index + 1 == cards.length
#       		return false unless Card::POKER_VALUES_STRING[cards[index + 1].value] == Card::POKER_VALUES_STRING[card.value] + 1
#    		end
#  	end


# # checks to see if each card has the same suit
#  	def flush?
#  		cards.each_with_index do |card, index|
#  			next if index + 1 == cards.length
#  			return false unless card.suit == cards[index + 1].suit
#  		end
#  	end

 
# # if is true for straight? and flush? then it is a straight flush
#  	def straight_flush?
#  		straight? && flush?
#  	end


end

