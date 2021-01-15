require 'date'
class Enigma

  def character_set
    ("a".."z").to_a << " "
  end

  def key_gen
    generated_key = String.new
    until generated_key.length == 5
      generated_key << rand(0..9).to_s
    end
    generated_key
  end

  def date_conversion
    year = (Date.today).year.to_s
    year.slice!(0,2)
    month_day = Date.today.to_s
    month_day.delete!('-')
    month_day.slice!(0,4)
    date = String.new(month_day + year)
  end

  def cypher
    date_cypher = ((date_conversion.to_i ** 2).to_s)[-4..-1]
    cypher = Hash.new
    cypher[:A] = key_gen[0..1].to_i + date_cypher[0].to_i
    cypher[:B] = key_gen[1..2].to_i + date_cypher[1].to_i
    cypher[:C] = key_gen[2..3].to_i + date_cypher[2].to_i
    cypher[:D] = key_gen[3..4].to_i + date_cypher[3].to_i
    cypher
  end

  def message_encrypted(message)
    File.new('data/encrypted.txt')
    chars = message.chars
    indexs = []
    encrypted_indexs = []
    chars.select do |char|
      indexs << character_set.index(char)
    end
    # require 'pry'; binding.pry
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