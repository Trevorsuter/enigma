require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/encryption'

class TestEncryption < MiniTest::Test

  def setup
    @encryption = Encryption.new("hello world")
  end

  def test_it_exists_with_attributes
    assert_instance_of Encryption, @encryption
    assert_equal "hello world", @encryption.message
  end
end