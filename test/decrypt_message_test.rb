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

  def test_message_is_compatible
    assert_equal "keder ohulw ", @dm.compatible_message
    assert_equal 12, @dm.compatible_message.length
  end

  def test_it_can_split_message_into_fours
    expected = ["kede", "r oh", "ulw "]
    assert_equal expected, @dm.split_message_into_fours
  end

  def test_separated_characters
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w", " "]]
    assert_equal expected, @dm.separated_characters
  end

  def test_separated_indexs
    expected = [[10, 4, 3, 4], [17, 26, 14, 7], [20, 11, 22, 26]]
    assert_equal expected, @dm.separated_indexs
  end

  def test_character_set_indexs
    assert_equal 27, @dm.character_set_indexs.length
    assert_equal 0, @dm.character_set_indexs.first
    assert_equal 26, @dm.character_set_indexs.last
  end
end
