require 'date'
require './lib/caesar_cipher'

class Enigma
  include CaesarCipher
  
  def message_encrypted(message)
    until message.length % 4 == 0
      message += " "
    end

    split_message = (message.scan(/..../))

    separated = split_message.map do |split_mess|
      split_mess.chars
    end

    separate_indexs = separated.map do |separate|
      separate.map do |char|
      character_set.index(char)
      end
    end
    char_index = character_set.map do |char|
      character_set.index(char)
    end

    crypted = separate_indexs.select do |index|
      index[0] += cypher[:A]
      index[1] += cypher[:B]
      index[2] += cypher[:C]
      index[3] += cypher[:D]
    end.flatten!

    almost_finished = crypted.map do |index|
      if index > 26
        index -= 27 until char_index.include?(index)
        character_set[index]
      else
        character_set[index]
      end
    end

    unless almost_finished.length != message.length
      almost_finished.pop
    end
    almost_finished.join("")
  end

  def encrypt(message, key = key_gen, date = date_conversion)
    encryption = Hash.new
    encryption[:message] = message_encrypted(message)
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end