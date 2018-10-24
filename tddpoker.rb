require "minitest/autorun"
require_relative "poker.rb"

class TddPoker < Minitest::Test

def test_card_is_a_class
	 x = Card.new
        assert_equal(Card, x.class)
    end





end