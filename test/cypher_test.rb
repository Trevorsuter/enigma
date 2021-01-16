require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/cypher'

class TestCypher < Minitest::Test

  def setup
    @cypher = Cypher.new
    @cypher.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
  end

  def test_it_exists
    assert_instance_of Cypher, @cypher
  end

  def test_date_is_cleaned
    assert_equal "040895", @cypher.date
  end

  def test_key_gen  
    assert_equal 5, @cypher.key_gen.length
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cypher.character_set
  end

  def test_cypher_hash
    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, @cypher.cypher_hash
  end
end