require './lib/date_cleaner'

class Cypher
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
end