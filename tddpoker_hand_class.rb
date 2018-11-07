require "minitest/autorun"
require_relative "poker_hand_class.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			x = Hand.new()
			assert_equal(Hand, x.class)
		end

		def test_hand_is_getting_dealt_card
			x = Hand.deal
			assert_equal(1, x.length)
			
		end

end