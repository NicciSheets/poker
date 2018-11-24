# PRACTICE LEARNING OBJECT ORIENT PROGRAMMING AND CLASSES VIA THE ARTICLE https://medium.freecodecamp.org/object-oriented-programming-concepts-21bb035f7260
# *******************************************
# 1. OOP CONCEPT OF ENCAPSULATION
# Encapsulation limits the likelihood of an error in the code to ripple through massive lines of code and continue to throw errors, one on top of another.  It basically just confines large code into smaller, more manageable and less invasive chunks so that there's less chance of a massive failure in your code, but will isntead just be a smaller, more manageable and easier to fix issue held within the confines of a small object
    # a. **Understanding PUBLIC and PRIVATE METHODS of Objects**
        # I made the method equals(other_card) a private method and wrote a public method called really_do_this(other_card), which allows the Card object to manipulate the private method when called upon - this limits the ability of an explicit receiver (Card object) to manipulate the private method; the private method serves as internal storage for the Card class, as a result 

class Card
  # the following 3 hashes are constants, which can be called upon in other classes by using Card::[enter constant name here]
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


# %%%% Following def is to be used with Concept 3, INHERITANCE %%%%
  # def inheritance
  #   "This parent is wack!"
  # end

# Exercise 3, Part I
# x = Card.new("2", "S")
# p x.inheritance

# uncomment lines 67-70 if using super() in the child class to add another variable to the single variable parent class
# def initialize(suit)
#   @suit = suit
# end
# x = Card.new("S")

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
#%# Exercise 1.a
# x = Card.new("2", "S") 
# other_card = Card.new("3", "C")

# p x.equals(other_card)
  # if I would try to run ^^ on its own, then it returns No Method Error because it's a private method and we cannot call it on a public Card object
   
# p x.really_do_this(other_card)
  # x.really_do_this(other_card) allows the Card object to manipulate the private method equals(other_card) when called upon
# ****************************************************
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

# ****************
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
# *****************

# shuffles the elements in self in place
  def shuffle
    @cards.shuffle!
  end

# removes (n) elements from the deck and returns them in an array, leaving @cards with the remaining elements 
  def take(n)
    @cards.shift(n)
  end
# ********************************************
# ********************************************
#%# Exercise 1.b
# p Deck.all_cards 
  # calling upon the protected method without using inheritance - this is done by using self.values and self.suits for the Card class and then using its Card class as the explicit receiver
  
# p Deck.values
# p Deck.suit
  # returns No Method Error for both ^^ because it does not have access to the Card class method of self.values/self.suit - it needs the method self.all_cards to serve as the explicit receiver
# *******************************************
end


# ********************************************
#%# 2. OOP CONCEPT OF ABSTRACTION
# Exercise 2
  # x = Deck.new()
  # p x.shuffle
    # This is demonstrated when I call the public method x.shuffle and it utilizes the information from the Card class and runs it through the public Deck method of shuffle without any other information from the user necessary
    # Basically, this ONLY shows a high-level mechanism when using the Deck shuffle method and allows for one method call that can be accessed later by other objects (== building a larger method from smaller "background" methods that will perform a specific action necessary to other objects)
# *********************************************


# ********************************************
#%# 3. OOP CONCEPT OF INHERITANCE
  # Inheritance allows child classes to "inherit" the private methods of its parent class, while also permitting the child class to write new methods of its own unrelated to the parent class methods
  # *******Must comment out the above Deck class for the child override to work correctly********

# class Deck < Card

# Exercise 3
  #comment out lines 178=181 unless I'm wanting to understand the super(), which allows the child class to add variables when initializing, otherwise you cannot modify the child class method (if you don't use super()) 
  # def initialize(value, suit)
  #   @value = value
  #   super(suit)
  # end

  # uncomment 185-187 to override the parent class method
  # def inheritance
  #    "This child is wack!"
  # end

 # x2 = Deck.new("S", "2")
 # p x2.inheritance
    # When you use inheritance (Deck < Card), you don't have to rewrite the inheritance method from the Card class to be able to call it in the Deck class - inheritance allows for the same output to return from the parent class method when the child class calls it. 
    # HOWEVER, if you want to change the output of the child class method, you can override the parent class method by writing a new output for the same method within the child class - to see this, uncomment the inheritance method above (lines 183-185)
    # To show how the child class inherits the same output from the parent class inheritance method, keep those lines commented out
# end



