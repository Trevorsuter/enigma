require 'date'
require './lib/character_set'
require './lib/encrypt_message'
require './lib/decrypt_message'

class Enigma
  include CharacterSet

  def encrypt(message, key = EncryptMessage.key_gen, date = EncryptMessage.date_conversion)
    encripted = EncryptMessage.new(message, key, date)
    encryption = Hash.new
    encryption[:message] = encripted.encrypted_message
    encryption[:key] = encripted.key
    encryption[:date] = encripted.date
    encryption
  end

  def decrypt(message, key = DecryptMessage.key_gen, date = DecryptMessage.date_conversion)
    decrypt = DecryptMessage.new(message, key, date)
    decryption = Hash.new
    encryption = Hash.new
    decryption[:message] = decrypt.encrypted_message
    decryption[:key] = decrypt.key
    decryption[:date] = decrypt.date
    decryption
  end
end