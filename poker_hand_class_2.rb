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
    # ['High Card',       :high_card? ]
  ]

 	def hand_rating
    	OPS.map { |op| (method(op[1]).call()) ? op[0] : false }.find { |v| v }
  	end

 	def score
        OPS.map { |op| method(op[1]).call()}.find([0]) { |score| score }
    end

    def score_rating
    	score[1][0]
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
		# hash.values.sort.reverse
	end


# used to deal 5 cards into the hand; deck = Deck.all_cards.shuffle
	def self.deal(deck)
		Hand.new(deck.take(5))
  	end

# uses the already defined pair and three of a kind? methods to determine if is a full house; returns first the pair value, then the three of a kind value
  	def full_house?
		if @frequency.values.length == 2 && @frequency.values.include?(2)
			return [true, [7, cards_frequency]]
		end
		false
	end


# returns true if there are 2 values the same in the hash and then it gives the value of that pair in the last index of array
	def pair?
		if (@frequency.values.length == 4 && @frequency.values.include?(2))
			return [true, [2, cards_frequency]]
		end
		false
	end 


# returns true if there are 3 values the same in the hash and then it gives the value of the 3 matching cards in the last index of array 
	def three_of_a_kind?
		if @frequency.values.uniq.include?(3)
			return [true, [4, cards_frequency]]
		end
		false
	end

	
# returns true if there are 4 values the same in the hash and then it gives teh value of the 4 matching cards in the last index of the array 
	def four_of_a_kind?
		if @frequency.values.uniq.include?(4)
			return [true, [8, cards_frequency]]
		end
		false
	end
	

# this will give you the two values that are 2 and one value that is 1 from the hash, meaning there are 2 pairs and one odd card left, which is deleted out 
# paired.keys will give you each pair values, with paired.keys[0] as the smallest value pair and paired.keys[1] as the largest value pair
	def two_pair?
		if (@frequency.values.length == 3 && @frequency.values.include?(2))
			return [true, [3, cards_frequency]]
		end
		false
	end		
		

# if the suits of all 5 cards are the same, calling uniq on them will make the length of the array == 1, otherwise it'll be greater than one if it's not a flush
	def flush?
		if cards_suits.uniq.length == 1
			return [true, [6, cards_frequency]]
		end
		false
	end


# #for each 2 consecutive card values, compares the previous value with the current value; if (previous+1==current) then it is a straight (bc the values are one after another consecutiviely )
	def straight?
    	my_cards = cards_sorted.map {|card| Card::POKER_VALUES_STRING[card.value]}
    	if my_cards.uniq.length == 5 
    		cards_sorted.each_with_index do |card, index|
    			next if index + 1 == cards_sorted.length
    			return [true, [5, cards_frequency]] if Card::POKER_VALUES_STRING[cards_sorted[index + 1].value] == Card::POKER_VALUES_STRING[card.value] + 1
    		end
    		false
    	end
 	end
  


# # if it's true for straight? && flush?? then it is a straight flush
   	def straight_flush?
   		cards_sorted.each_with_index do |card, index|
      		next if index + 1 == cards_sorted.length
  			return false unless (Card::POKER_VALUES_STRING[cards_sorted[index + 1].value] == Card::POKER_VALUES_STRING[card.value] + 1) && (cards_suits.uniq.length == 1)
  		end
  		[true, [9, cards_frequency]]
  	end
     
     
end

