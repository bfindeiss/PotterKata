$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'book_list'

class PotterKataTest < Test::Unit::TestCase

  def setup
    @potter = BookList.new
  end

  def testBasics
  assert_equal(0, @potter.price([]))
  assert_equal(8, @potter.price([0]))
  assert_equal(8, @potter.price([1]))
  assert_equal(8, @potter.price([2]))
  assert_equal(8, @potter.price([3]))
  assert_equal(8, @potter.price([4]))
  assert_equal(8 * 2, @potter.price([0, 0]))
  assert_equal(8 * 3, @potter.price([1, 1, 1]))
end

def testSimpleDiscounts
  assert_equal(8 * 2 * 0.95, @potter.price([0, 1]))
  assert_equal(8 * 3 * 0.9, @potter.price([0, 2, 4]))
  assert_equal(8 * 4 * 0.8, @potter.price([0, 1, 2, 4]))
  assert_equal(8 * 5 * 0.75, @potter.price([0, 1, 2, 3, 4]))
end

def testSeveralDiscounts
  assert_equal(8 + (8 * 2 * 0.95), @potter.price([0, 0, 1]))
  assert_equal(2 * (8 * 2 * 0.95), @potter.price([0, 0, 1, 1]))
  assert_equal((8 * 4 * 0.8) + (8 * 2 * 0.95), @potter.price([0, 0, 1, 2, 2, 3]))
  assert_equal(8 + (8 * 5 * 0.75), @potter.price([0, 1, 1, 2, 3, 4]))
end

def testEdgeCases
  assert_equal(2 * (8 * 4 * 0.8), @potter.price([0, 0, 1, 1, 2, 2, 3, 4]))
  assert_equal(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8),
    @potter.price([0, 0, 0, 0, 0,
           1, 1, 1, 1, 1,
           2, 2, 2, 2,
           3, 3, 3, 3, 3,
           4, 4, 4, 4]))
end
end
