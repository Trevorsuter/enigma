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
    until message.length % 4 == 0
      message += " "
    end
    split_message = (message.scan(/..../))
    separated = split_message.map do |split_mess|
      split_mess.chars
    end
    separate_ords = separated.map do |separate|
      separate.map do |char|
       if char.ord == 32
        char.ord - 1000
       else
        char.ord
       end
      end
    end
    crypted = separate_ords.select do |ords|
      ords[0] += cypher[:A]
      ords[1] += cypher[:B]
      ords[2] += cypher[:C]
      ords[3] += cypher[:D]
    end
    crypted.map do |crypt|
      crypt.flat_map do |ord|
        if ord < 0
          " "
        else
          ord.chr
        end
      end
    end
  end

  def encrypt(message, key = key_gen, date = date_conversion)
    encryption = Hash.new
    encryption[:message] = message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end