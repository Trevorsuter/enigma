require 'date'
require './lib/character_set'
require './lib/encrypt_message'

class Enigma
  include CharacterSet

  def encrypt(message, key = EncryptMessage.key_gen, date = EncryptMessage.date_conversion)
    encripted = EncryptMessage.new(message, key, date)
    # require 'pry'; binding.pry
    encryption = Hash.new
    encryption[:message] = encripted.encrypted_message
    encryption[:key] = encripted.key
    encryption[:date] = encripted.date
    encryption
  end
end