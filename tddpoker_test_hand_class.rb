require "minitest/autorun"
require_relative "poker_test_hand_class.rb"

class TddPokerTestHandClass < Minitest::Test
		def test_test_hand_is_class
			x = Test_Hand.new()
			assert_equal(Test_Hand, x.class)
		end
end