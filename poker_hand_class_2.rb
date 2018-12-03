require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand  	

OPS =
    [['Straight Flush', :straight_flush?],
	['Four of a Kind',  :four_of_a_kind?],
    ['Full House',      :full_house?],
    ['Flush',           :flush?],
    ['Straight',        :straight?],
    ['Three of a Kind', :three_of_a_kind?],
    ['Two Pair',        :two_pair?],
    ['Pair',            :pair?],
    ['High Card',       :high_card?]]

# this goes through a dealt or given hand and determines what poker hand it is based on the methods written below
 	def hand_rating
    	OPS.map { |op| (method(op[1]).call()) ? op[0] : false }.find { |v| v }
  	end

# this gives you everythign that is returned from the poker hand, whether it is the hand or not, the score rating of that hand, the highest card(s) for tieing purposes
 	def score
        OPS.map { |op| method(op[1]).call()}.find([0]) { |score| score }
    end

# this gives you the ranking for each poker hand
    def score_rating
    	score[1][0]
    end

# this changes the face cards to their poker hand value to be compared
	def poker_hand_tie2
		poker_hand_tie.map {|card| Card::WINNER_STRING[card]}
	end

# this is for if the poker hands tie 
    def poker_hand_tie
    	score[1][1]
    end
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

	attr_accessor :cards_values, :cards_sorted, :cards_suits, :cards


# refactored out this commonality for the pair-type methods
	def cards_frequency
		hash = Hash.new(0)
		cards_values.each {|item| hash[item] += 1}
		hash
	end


# returns the highest single card left from pair and two pair in case hand ties compoletely
	def pair_matcher_tie
		@frequency.select {|k, v| v == 1}
	end


# returns the highest pair value for the two pair in the spot needed for the score tie, and gives a second value for comparing the second, lower value pair
	def two_pair_tie
		@frequency.select {|k, v| v == 2}.keys.reverse
	end


# used to deal 5 cards into the hand; deck = Deck.all_cards.shuffle
	def self.deal(deck = Deck.all_cards.shuffle)
		Hand.new(deck.take(5))
  	end

# uses the already defined pair and three of a kind? methods to determine if is a full house; score[1][1] returns the 3 of a kind value, score [1][2] returns the pair value
# use only the 3 of a kind to determine tie breaker between two full houses 
  	def full_house?
		(@frequency.values.length == 2 && @frequency.values.include?(2)) ? [true, [7, [@frequency.key(3)]]] : false
	end

# !!!!!!!!!!!!!!!!!! This one must be tested through each index for tie
# returns true if there are 2 values the same in the hash and then it gives the value of that pair in the last index of array
	def pair?
		(@frequency.length == 4 && @frequency.values.include?(2)) ? [true, [2, [@frequency.key(2), pair_matcher_tie.keys.reverse].flatten]] : false
	end 


# returns true if there are 3 values the same in the hash and then it gives the value of the 3 matching cards in the last index of array 
	def three_of_a_kind?
		@frequency.values.uniq.include?(3) ? [true, [4, [@frequency.key(3)]]] : false
	end

	
# returns true if there are 4 values the same in the hash and then it gives teh value of the 4 matching cards in the last index of the array 
	def four_of_a_kind?
		@frequency.values.uniq.include?(4) ? [true, [8, [@frequency.key(4)]]] : false
	end
	
# !!!!!!!!!!! this one needs to be compared through each index for highest card if tied
# this will give you the two values that are 2 and one value that is 1 from the hash, meaning there are 2 pairs and one odd card left, which is deleted out 
	def two_pair?
		(@frequency.values.length == 3 && @frequency.values.include?(2)) ? [true, [3, [two_pair_tie[0], two_pair_tie[-1], @frequency.key(1)]]] : false
	end		
		

# !!!!!!!!!!!!!!! This one needs to check down index of all cards for tie purposes
# if the suits of all 5 cards are the same, calling uniq on them will make the length of the array == 1, otherwise it'll be greater than one if it's not a flush
	def flush?
		cards_suits.uniq.length == 1 ? [true, [6, [@frequency.keys.reverse].flatten]] : false
	end


# #for each 2 consecutive card values, compares the previous value with the current value; if (previous+1==current) then it is a straight (bc the values are one after another consecutiviely )
	def straight?
    	cards_values.each_cons(2).all? {|c1,c2| c2.to_i - c1.to_i == 1 } ? [true, [5, [@frequency.keys[-1]]]] : false
 	end
  


# # if it's true for straight? && flush?? then it is a straight flush
   	def straight_flush?
   		cards_sorted.each_with_index do |card, index|
      		next if index + 1 == cards_sorted.length
  			return false unless (Card::POKER_VALUES_STRING[cards_sorted[index + 1].value] == Card::POKER_VALUES_STRING[card.value] + 1) && (cards_suits.uniq.length == 1)
  		end
  		[true, [9, [@frequency.keys[-1]]]]
  	end

# !!!!!!!!!!!!!!!!!!!!! This one needs checked through each index for highest card if tied
# this just gives you the true if none of the other methods come back as true, then returns the highest value card of the hand 
    def high_card?
   		result = cards_sorted ? [true, [1, [@frequency.keys.reverse].flatten]] : false
   	end


end
