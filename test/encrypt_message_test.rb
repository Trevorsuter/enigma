require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/encrypt_message'

class TestEncryptMessage < MiniTest::Test

  def setup
    @em = EncryptMessage.new("hello world")
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
end