require './lib/date_cleaner'

class Cipher
  include DateCleaner

  def date
    date_conversion(Date.today)
  end

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

  def cipher_hash
    date_cypher = ((date.to_i ** 2).to_s)[-4..-1]
    cypher = Hash.new
    cypher[:A] = key_gen[0..1].to_i + date_cypher[0].to_i
    cypher[:B] = key_gen[1..2].to_i + date_cypher[1].to_i
    cypher[:C] = key_gen[2..3].to_i + date_cypher[2].to_i
    cypher[:D] = key_gen[3..4].to_i + date_cypher[3].to_i
    cypher
  end
end