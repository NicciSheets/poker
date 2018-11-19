# PRACTICE LEARNING OBJECT ORIENT PROGRAMMING AND CLASSES VIA THE ARTICLE https://medium.freecodecamp.org/object-oriented-programming-concepts-21bb035f7260
# 1. OOP CONCEPT OF ENCAPSULATION

#     a. **Understanding PUBLIC and PRIVATE METHODS of Objects**

# I made the method equals(other_card) a private method and wrote a public method called really_do_this(other_card), which allows the Card object to manipulate the private method when called upon - this limits the ability of an explicit receiver (Card object) to manipulate the private method; the private method serves as internal storage for the Card class, as a result 


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


attr_reader :value, :suit

# initializes class Card with a value and a suit
  def initialize(value, suit)
    @value, @suit = value, suit
  end



# ***************************************************
  def really_do_this(other_card)
    	equals(other_card)
  end
# ***************************************************
# ***************************************************
private
# checks equality of self card with other card
  def equals(other_card)
    (self.suit == other_card.suit) && (self.value == other_card.value)
  end

  protected
# returns the card suits of class Card
  def self.suits
    SUIT_STRING.keys
  end

protected
# returns the card values of class Card
  def self.values
    VALUE_STRING.keys
  end
# ***************************************************
# ***************************************************
x = Card.new("2", "S") 
other_card = Card.new("3", "C")

# p x.equals(other_card)
  # if I would try to run ^^ on its own, then it returns No Method Error because it's a private method and we cannot call it on a public Card object
   
# p x.really_do_this(other_card)
  # x.really_do_this(other_card) allows the Card object to manipulate the private method equals(other_card) when called upon
end


# ************************************************************
# 1. ENCAPSULATION, CONT.

    # b. Understanding PROTECTED METHODS
class Deck

# initializes Deck class with a deck of all the cards
  def initialize(cards = Deck.all_cards)
      @cards = cards
  end

  attr_accessor :cards


# puts the cards from class Card into the deck - also, calling upon Card.values and Card.suits in the Deck class is an example of a PROTECTED method
  def self.all_cards
    cards = []
    a = Card.values
    b = Card.suits
    a.each do |value|
      b.each do |suit|
        cards << Card.new(value, suit)
      end
    end
    cards
  end


# shuffles the elements in self in place
  def shuffle
    @cards.shuffle!
  end

# removes (n) elements from the deck and returns them in an array, leaving @cards with the remaining elements 
  def take(n)
    @cards.shift(n)
  end


# ********************************************
# p Deck.all_cards 
  # calling upon the protected method without using inheritance - this is done by using self.values and self.suits for the Card class and then using its Card class as the explicit receiver
  
# p Deck.values
# p Deck.suit
  # returns No Method Error for both ^^ because it does not have access to the Card class method of self.values/self.suit - it needs the method self.all_cards to serve as the explicit receiver
# *******************************************
end


# ********************************************
# 2. OOP CONCEPT OF ABSTRACTION
    # x = Deck.new()
    # p x.shuffle
    # This is demonstrated when I call the public method x.shuffle and it utilizes the information from the Card class and runs it through the public Deck method of shuffle without any other information from the user necessary
    # Basically, this ONLY shows a high-level mechanism when using the Deck shuffle method and allows for one method call that can be accessed later by other objects (== building a larger method from smaller "background" methods that will perform a specific action necessary to other objects)