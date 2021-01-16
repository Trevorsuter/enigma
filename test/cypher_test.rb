require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/cypher'

class TestCipher < Minitest::Test

  def setup
    @cipher = Cipher.new
    @cipher.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_date_is_cleaned
    assert_equal "040895", @cipher.date
  end

  def test_key_gen  
    assert_equal 5, @cipher.key_gen.length
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @cipher.character_set
  end

  def test_cypher_hash
    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, @cipher.cipher_hash
  end
end