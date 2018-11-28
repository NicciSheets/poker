require_relative "poker_card_class.rb"
require_relative "poker_deck_class.rb"

class Hand  	

# def ranker
# 		return_rank = {
# 			[4, 1] => :four_of_a_kind,
# 			[3, 2] => :full_house,
# 			[3, 1, 1] => :three_of_a_kind,
# 			[2, 2, 1] => :two_pair,
# 			[2, 1, 1, 1] => :pair,
# 			[1, 1, 1, 1, 1] => :high_card
# 		}
# 		return_rank.values_at(self.cards_frequency)[0]
# end

# def ranker2
# 	return_rank = {
# 		:straight_flush => straight_flush?,
# 		:straight => straight?,
# 		:flush => flush?
# 	}
# 	return_rank.values_at(self)
# end

# def rrranks
# 	[:straight_flush, :four_of_a_kind, :full_house, :flush, :straight, :three_of_a_kind, :two_pair, :pair, :high_card]
# end

# def rrranksss
# 	rrranks.index(ranker)
# 	rrranks.index(ranker2)
# end

# HAND_VALUES ={
#     :straight_flush => 9,
#     :four_of_a_kind => 8,
#     :full_house => 7,
#     :flush => 6,
#     :straight => 5,
#     :three_of_a_kind => 4,
#     :two_pair => 3,
#     :pair => 2,
#     :high_card => 1
#  	}

# # def ranks
# # 	HAND_VALUES.values_at(self.rrranksss)
# # end

# def selfish
# 	self
# end
OPS = [
    # ['Straight Flush',  :straight_flush? ],
    ['Four of a Kind',  :four_of_a_kind? ],
    ['Full House',      :full_house? ],
    ['Flush',           :flush? ],
    ['Three of a Kind', :three_of_a_kind?],
    ['Two Pair',        :two_pair? ],
    ['Pair',            :pair? ],
    ['High Card',       :high_card? ],
    ['Straight',        :straight? ]

  ]

  def hand_rating
    OPS.map { |op|
      (method(op[1]).call()) ? op[0] : false
    }.find { |v| v }
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

	attr_accessor :cards_values, :cards_sorted, :cards_suits


# refactored out this commonality for the pair-type methods
	def cards_frequency
		hash = Hash.new(0)
		cards_values.each {|item| hash[item] += 1}
		hash.values
		# hash.values.sort.reverse
	end


# used to deal 5 cards into the hand; deck = Deck.all_cards.shuffle
	def self.deal(deck)
		Hand.new(deck.take(5))
  	end

# uses the already defined pair and three of a kind? methods to determine if is a full house; returns first the pair value, then the three of a kind value
  	def full_house?
		if @frequency.length == 2 && @frequency.include?(2)
			return true
		end
	end


# returns true if there are 2 values the same in the hash and then it gives the value of that pair in the last index of array
	def pair?
		if @frequency.length == 4 && @frequency.include?(2)
			return true
		end
	end 


# returns true if there are 3 values the same in the hash and then it gives the value of the 3 matching cards in the last index of array 
	def three_of_a_kind?
		@frequency.uniq.include?(3)
	end

	
# returns true if there are 4 values the same in the hash and then it gives teh value of the 4 matching cards in the last index of the array 
	def four_of_a_kind?
		@frequency.uniq.include?(4)
	end
	

# this will give you the two values that are 2 and one value that is 1 from the hash, meaning there are 2 pairs and one odd card left, which is deleted out 
# paired.keys will give you each pair values, with paired.keys[0] as the smallest value pair and paired.keys[1] as the largest value pair
	def two_pair?
		# p @frequency
		if @frequency.length == 3 && @frequency.include?(2)
			return true
		end
	end		
		

# if the suits of all 5 cards are the same, calling uniq on them will make the length of the array == 1, otherwise it'll be greater than one if it's not a flush
	def flush?
		cards_suits.uniq.length == 1
	end


# #for each 2 consecutive card values, compares the previous value with the current value; if (previous+1==current) then it is a straight (bc the values are one after another consecutiviely )
	def straight?
		# p cards_values.each_cons(4) {|blah| "blah"}
		cards_values.each_cons(4)  {|previous, current| (previous.to_i + 1) == current.to_i}

		return true
   	end


# # if it's true for straight? && flush?? then it is a straight flush
#    	def straight_flush?
#    		straight? && flush?
#    	end


# this is used if there are no winning hand options, the high card is determined only from the larger cards (10 and up)
   	def high_card?
   		(cards_sorted.map {|card| Card::POKER_VALUES_STRING[card.value]}).last >= 9
   	end

end

