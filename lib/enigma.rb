require 'date'
require './lib/encrypt_message'
require './lib/decrypt_message'
require './lib/caesar_cipher'

class Enigma
  include CaesarCipher

  def encrypt(encryption, key = key_gen, date = date_conversion)
    encripted = EncryptMessage.new(encryption, key, date)
    encryption = Hash.new
    encryption[:encryption] = encripted.encrypted_message
    encryption[:key] = encripted.key
    encryption[:date] = encripted.date
    encryption
  end

  def decrypt(decryption, key = key_gen, date = date_conversion)
    decrypt = DecryptMessage.new(decryption, key, date)
    decryption = Hash.new
    encryption = Hash.new
    decryption[:decryption] = decrypt.encrypted_message
    decryption[:key] = decrypt.key
    decryption[:date] = decrypt.date
    decryption
  end
end