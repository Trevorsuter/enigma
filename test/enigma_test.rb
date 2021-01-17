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

  def test_message_encrypted
    @enigma.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
    assert_equal "keder ohulw", @enigma.message_encrypted("hello world")
  end

  def test_encryption
    @enigma.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
    expected = {message: "keder ohulw",
                key: "02715",
                date: "040895"}
    expected2 = {message: "keder ohulw",
                  key: "02715",
                  date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected2, @enigma.encrypt("hello world")
  end
end