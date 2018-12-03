# card, deck, hand

class Card

	SUIT_STRING = {
    :clubs    => "C",
    :diamonds => "D",
    :hearts   => "H",
    :spades   => "S"
  	}
	
    VALUE_STRING = {
    :two   => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
	 }

  	POKER_VALUES_STRING = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  	}

    WINNER_STRING = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "10" => 10,
      "J" => 11, 
      "Q" => 12,
      "K" => 13, 
      "A" => 14
    }


attr_reader :value, :suit

# initializes class Card with a value and a suit
  def initialize(value, suit)
    @value, @suit = value, suit
  end


# returns the card suits of class Card
  def self.suits
    SUIT_STRING.keys
  end



# returns the card values of class Card
  def self.values
  	VALUE_STRING.keys
  end


# checks equality of self card with other card
  # def ==(other_card)
  #   (self.suit == other_card.suit) && (self.value == other_card.value)
  # end


# compares the poker ranking of two cards
  # def higher_than?(other_card)
  #   # p "POKER_VALUES_STRING[self.value] is #{POKER_VALUES_STRING[self.value]}"
  #   if POKER_VALUES_STRING[self.value] == POKER_VALUES_STRING[other_card.value]
  #     return nil
  #   end
  #   POKER_VALUES_STRING[self.value] > POKER_VALUES_STRING[other_card.value]
  # end
 

# combines the two strings (value and suit) for Cards
  def to_s
    VALUE_STRING[value] + SUIT_STRING[suit]
  end

end


