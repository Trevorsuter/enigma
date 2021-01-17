require 'date'
class Enigma

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

    char_ord = character_set.map do |char|
      char.ord
    end

    crypted = separate_ords.select do |ords|
      ords[0] += cypher[:A]
      ords[1] += cypher[:B]
      ords[2] += cypher[:C]
      ords[3] += cypher[:D]
    end.flatten!

    almost_finished = crypted.map do |ord|
      if ord < 0
          " "
      elsif ord > 122
        ord -= 27 until char_ord.include?(ord)
        ord.chr
      else
        ord.chr
      end
    end

    unless almost_finished[-1] != " "
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