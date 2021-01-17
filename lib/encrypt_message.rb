require './lib/caesar_cipher'

class EncryptMessage
  include CaesarCipher
  attr_reader :message

  def initialize(message)
    @message = message
    @encrypted = ""
  end

  def compatible_message
    compatible = @message
    until compatible.length % 4 == 0
      compatible += " "
    end
    compatible
  end

  def split_message_into_fours
    compatible_message.scan(/..../)
  end

  def separated_characters
    split_message_into_fours.map do |split_mess|
      split_mess.chars
    end
  end

  def separated_indexs
    separated_characters.map do |separate|
      separate.map do |char|
        character_set.index(char)
      end
    end
  end

  def character_set_indexs
    character_set.map do |char|
      character_set.index(char)
    end
  end
end