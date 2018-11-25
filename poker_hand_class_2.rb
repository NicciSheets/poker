require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand  	

# @cards_sorted gives us each of the 5 cards and their object id (<Card...@value=...@suit=...>)
# @cards_values gives us each card value once the @cards_sorted are sorted according to their poker value
# @cards_suits gives us each of the card's suits from the 5 card hand
# @frequency is used to call upon the methood cards_frequncy, which counts how many times each card value is repeated, if any = the hash.key is the card value and the hash.value is how many times the value was repeated
	def initialize(cards)
		@cards = cards
		@cards_sorted = @cards.sort_by! {|card| Card::POKER_VALUES_STRING[card.value]}	
		@cards_values = @cards_sorted.map {|card| Card::VALUE_STRING[card.value]}
		@cards_suits = @cards.map {|card| Card::SUIT_STRING[card.suit]}
		@frequency = cards_frequency
	end
# Card::POKER_VALUES_STRING is a compound expression of a constant reference (POKER_VALUES_STRING) is the constant and it returns the value of the constant

	attr_accessor :cards_values, :cards_sorted, :cards_suits


# refactored out this commonality for the pair-type methods
	def cards_frequency
		hash = Hash.new(0)
		@cards_values.each {|item| hash[item] += 1}
		hash
	end


# used to deal 5 cards into the hand; deck = Deck.all_cards.shuffle
	def self.deal(deck)
		Hand.new(deck.take(5))
  	end

# uses the already defined pair and three of a kind? methods to determine if is a full house; returns first the pair value, then the three of a kind value
  	def full_house?
		pair? && three_of_a_kind?
		return [true, "Full House", ["#{pair?[1]} #{pair?[2]}", "#{three_of_a_kind?[1]} #{three_of_a_kind?[2]}"]]
	end


# returns true if there are 2 values the same in the hash and then it gives the value of that pair in the last index of array
	def pair?
		@frequency.values.include?(2)
  		return [true, "Pair", @frequency.key(2)]
	end


# returns true if there are 3 values the same in the hash and then it gives the value of the 3 matching cards in the last index of array 
	def three_of_a_kind?
		@frequency.values.include?(3)
		return [true, "Three of a Kind", @frequency.key(3)]
	end

	
# returns true if there are 4 values the same in the hash and then it gives teh value of the 4 matching cards in the last index of the array 
	def four_of_a_kind?
		@frequency.values.include?(4)
		return [true, "Four of a Kind", @frequency.key(4)]
	end
	

# this will give you the two values that are 2 and one value that is 1 from the hash, meaning there are 2 pairs and one odd card left, which is deleted out 
# paired.keys will give you each pair values, with paired.keys[0] as the smallest value pair and paired.keys[1] as the largest value pair
	def two_pair?
		@frequency.delete_if {|key, value| value == 1}
		return [true, "Two Pair", @frequency.keys]	
	end		
		

# if the suits of all 5 cards are the same, calling uniq on them will make the length of the array == 1, otherwise it'll be greater than one if it's not a flush
	def flush?
		@cards_suits.uniq.length == 1
		return [true, "Flush"]
	end


#for each 2 consecutive card values, compares the previous value with the current value; if (previous+1==current) then it is a straight (bc the values are one after another consecutiviely )
	def straight?
		@cards_values.each_cons(2)  {|previous, current| (previous.to_i + 1) == current.to_i}
		return [true, "Straight"]
   	end



   	def straight_flush?
   		straight? && flush?
   		return [true, "Straight Flush"]
   	end

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

