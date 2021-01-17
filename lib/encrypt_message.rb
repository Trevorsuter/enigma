require './lib/caesar_cipher'

class EncryptMessage
  include CaesarCipher
  attr_reader :message

  def initialize(message)
    @message = message
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

  def cripted_indexs
    separated_indexs.select do |index|
      index[0] += cypher[:A]
      index[1] += cypher[:B]
      index[2] += cypher[:C]
      index[3] += cypher[:D]
    end.flatten!
  end

  def index_to_characters
    cripted_indexs.map do |index|
      if index > 26
        index -= 27 until character_set_indexs.include?(index)
        character_set[index]
      else
        character_set[index]
      end
    end
  end

  def encrypted_message
    encripted = index_to_characters.join
    unless encripted.length == message.length
      encripted.delete!(encripted[-1])
    end
    encripted
  end
end