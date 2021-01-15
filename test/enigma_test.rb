require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/enigma'

class TestEnigma < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.character_set
  end

  def test_key_gen  
    assert_equal 5, @enigma.key_gen.length
  end

  def test_date_conversion
    Date.stubs(:today).returns(Date.new(2001, 11, 11))
    assert_equal "111101", @enigma.date_conversion
  end

  def test_cypher
    @enigma.stubs(:cypher).returns({A: 3, B: 27, C: 73, D: 20})
    expected = {A: 108, B: 46, C: 136, D: 45}
    assert_equal expected, @enigma.cypher
  end

  def test_message_encrypted
    @enigma.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 04, 08))
    assert_equal "", @enigma.message_encrypted("hello world")
  end

  def test_encryption
    @enigma.stubs(:key_gen).returns("12345")
    Date.stubs(:today).returns(Date.new(2001, 11, 11))
    expected = {message: "keder ohulw",
                key: "02715",
                date: "040895"}
    expected2 = {message: "keder ohulw",
                  key: "12345",
                  date: "111101"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected2, @enigma.encrypt("hello world")
  end
end