require './test/test_helper'
require './lib/decrypt_message'

class TestDecryptMessage < MiniTest::Test

  def setup
    @dm = DecryptMessage.new("keder ohulw", "02715", "040895")
  end

  def test_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @dm.character_set
  end

  def test_it_exists_with_attributes
    assert_instance_of DecryptMessage, @dm
    assert_equal "keder ohulw", @dm.message
    assert_equal "02715", @dm.key
    assert_equal "040895", @dm.date
  end

  def test_it_can_generate_its_own_key_and_date
    @dm2 = DecryptMessage.new("keder ohulw")
    assert_equal 5, @dm.key.length
    assert_equal DecryptMessage.date_conversion, @dm2.date
  end

  def test_cypher
    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, @dm.cypher
  end
end
