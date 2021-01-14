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

  def encrypt(message, key = key_gen, date = date_conversion)
    encryption = Hash.new
    encryption[:message] = message
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end