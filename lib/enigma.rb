require 'date'
class Enigma

  def message_encrypted(message)
    File.new('data/encrypted.txt')
    chars = message.chars
    indexs = []
    encrypted_indexs = []
    chars.select do |char|
      indexs << character_set.index(char)
    end
    encrypted_indexs
  end

  def encrypt(message, key = key_gen, date = date_conversion)
    encryption = Hash.new
    encryption[:message] = message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end