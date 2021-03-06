require './test/test_helper'
require './lib/encrypt_message'
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

  def test_encryption
    @enigma.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
    expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, @enigma.encrypt("hello world")
  end

  def test_decryption
    @enigma.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
    expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected, @enigma.decrypt("keder ohulw")
  end
end