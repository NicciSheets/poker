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
  		if four_of_a_kind?[0]
  			"four of a kind"
  		elsif full_house?[0]
  			"full house"
  		elsif three_of_a_kind?[0]
  			"three of a kind"
  		elsif two_pair?[0]
  			"two pair"
  		else pair?[0]
  			"pair"
  		end
  	end


# if the value of 2 cards are the same, returns as true for a pair; uses a different way to iterate through the cards (rather than using a counter)
  	def pair?
	    cards.each_with_index do |card, index1|
	      	(index1+1...cards.length).each do |index2|
	        	if card.value == cards[index2].value
	          		cards_to_test.delete(card)
	          		cards_to_test.delete(cards[index2])
	          	return [true, [card, cards[index2]]]
	        	end
	     	end
	    end
	    [false]
	end


# checks to see if the value of any cards match, and if they do then it shoves them into the pairs array; after the loop runs, if the pair_count == 2, then it returns true for two pair and returns the two card pairs, otherwise it is false
	def two_pair?
  		pair_count = 0
  		pairs = []
	    cards.each_with_index do |card, index1|
	      	(index1+1...cards.length).each do |index2|
	        	if card.value == cards[index2].value
	        		pair_count += 1
	        		pairs << [card, cards[index2]]   		
	          		cards_to_test.delete(card)
	          		cards_to_test.delete(cards[index2])
	        	end
	     	end
	    end
	    pair_count == 2 ? [true, pairs] : [false]
	end

# checks for three cards of same value and puts them into the matching_cards array, returning true for three of a kind
	def three_of_a_kind?
		cards.each_with_index do |card, index1|
			matching_cards = [card]
      		match_count = 1
	      	(index1+1...cards.length).each do |index2|
	        	if card.value == cards[index2].value
	        		match_count += 1
	        		matching_cards << cards[index2]	          		
	        	end
	        end
	    if match_count == 3
	    	matching_cards.each do |card|
	    		cards_to_test.delete(card)
	    	end
	    	return [true, matching_cards]
	    	end
	    end
	    [false]
	end
	    
	def four_of_a_kind?
		cards.each_with_index do |card, index1|
			matching_cards = [card]
      		match_count = 1
	      	(index1+1...cards.length).each do |index2|
	        	if card.value == cards[index2].value
	        		match_count += 1
	        		matching_cards << cards[index2]	          		
	        	end
	        end
	    if match_count == 4
	    	matching_cards.each do |card|
	    		cards_to_test.delete(card)
	    	end
	    	return [true, matching_cards]
	    	end
	    end
	    [false]
	end

	def full_house?
		if three_of_a_kind?[0]
			if cards_to_test[0].value == cards_to_test[1].value
				return [true, three_of_a_kind?[1], [cards_to_test[0], cards_to_test[1]]]
			end
		end
		[false]
	end
end



	
