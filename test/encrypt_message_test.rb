require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/encrypt_message'

class TestEncryptMessage < MiniTest::Test

  def setup
    @em = EncryptMessage.new("hello world")
    @em.stubs(:key_gen).returns("02715")
    Date.stubs(:today).returns(Date.new(1995, 4, 8))
  end

  def test_it_exists
    assert_instance_of EncryptMessage, @em
    assert_equal "hello world", @em.message
  end

  def test_message_is_compatible
    @em.compatible_message
    assert_equal "hello world ", @em.compatible_message
    assert_equal 12, @em.compatible_message.length
  end

  def test_it_can_split_message_into_fours
    expected = ["hell", "o wo", "rld "]
    assert_equal expected, @em.split_message_into_fours
  end

  def test_separated_characters
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", " "]]
    assert_equal expected, @em.separated_characters
  end

  def test_separated_character_ordinates
    expected = [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3, 26]]
    assert_equal expected, @em.separated_indexs
  end

  def test_character_set_indexs
    assert_equal 27, @em.character_set_indexs.length
    assert_equal 0, @em.character_set_indexs.first
    assert_equal 26, @em.character_set_indexs.last
  end

  def test_cripted_indexs
    expected = [10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76, 46]
    assert_equal expected, @em.cripted_indexs
  end

  def test_index_to_characters
    expected = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w", "t"]
    assert_equal expected, @em.index_to_characters
  end

  def test_encrypted_message
    expected = "keder ohulw"
    assert_equal expected, @em.encrypted_message
  end
end