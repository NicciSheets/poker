# card, hand, deck, game rules

class Card
	SUIT_STRING = {
    :clubs    => "C",
    :diamonds => "D",
    :hearts   => "H",
    :spades   => "S"
  	}
	
    RANK_STRING = {
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
    :ace => 14
  	}

  def self.suits
    SUIT_STRING.keys
  end

  def self.ranks 
  	RANK_STRING.keys
  end
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def ==(other_card)
    (self.suit == other_card.suit) && (self.rank == other_card.rank)
  end

  def higher_than?(other_card)
    if POKER_VALUES_STRING[self.rank] == POKER_VALUES_STRING[other_card.rank]
      return nil
    end
    POKER_VALUES_STRING[self.rank] > POKER_VALUES_STRING[other_card.rank]
  end
end


