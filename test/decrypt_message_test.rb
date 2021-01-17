require './test/test_helper'
require './lib/decrypt_message'

class TestDecryptMessage < MiniTest::Test

  def setup
    @dm = DecryptMessage.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists_with_attributes
    assert_instance_of DecryptMessage, @dm
    assert_equal "keder ohulw", @dm.message
    assert_equal "02715", @dm.key
    assert_equal "040895", @dm.date
  end
end
