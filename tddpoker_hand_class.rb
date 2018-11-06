require "minitest/autorun"
require_relative "poker_hand_class.rb"

class TddPokerHandClass < Minitest::Test

		def test_hand_is_class
			x = Hand.new()
			assert_equal(Hand, x.class)
		end
end