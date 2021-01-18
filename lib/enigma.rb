require 'date'
require './lib/character_set'
require './lib/encrypt_message'
require './lib/decrypt_message'

class Enigma
  include CharacterSet

  def encrypt(encryption, key = EncryptMessage.key_gen, date = EncryptMessage.date_conversion)
    encripted = EncryptMessage.new(encryption, key, date)
    encryption = Hash.new
    encryption[:encryption] = encripted.encrypted_message
    encryption[:key] = encripted.key
    encryption[:date] = encripted.date
    encryption
  end

  def decrypt(decryption, key = DecryptMessage.key_gen, date = DecryptMessage.date_conversion)
    decrypt = DecryptMessage.new(decryption, key, date)
    decryption = Hash.new
    encryption = Hash.new
    decryption[:decryption] = decrypt.encrypted_message
    decryption[:key] = decrypt.key
    decryption[:date] = decrypt.date
    decryption
  end
end