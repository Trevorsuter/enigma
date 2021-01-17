require './lib/character_set'
require 'date'

class DecryptMessage
  include CharacterSet
  attr_reader :message, :key, :date

  def initialize (message, key = DecryptMessage.key_gen, date = DecryptMessage.date_conversion)
    @message = message
    @key = key
    @date = date
  end

  def self.key_gen
    generated_key = String.new
    until generated_key.length == 5
      generated_key << rand(0..9).to_s
    end
    generated_key
  end

  def self.date_conversion
    year = (Date.today).year.to_s
    year.slice!(0,2)
    month_day = Date.today.to_s
    month_day.delete!('-')
    month_day.slice!(0,4)
    date = String.new(month_day + year)
  end

  def cypher
    date_cypher = ((date.to_i ** 2).to_s)[-4..-1]
    cypher = Hash.new
    cypher[:A] = key[0..1].to_i + date_cypher[0].to_i
    cypher[:B] = key[1..2].to_i + date_cypher[1].to_i
    cypher[:C] = key[2..3].to_i + date_cypher[2].to_i
    cypher[:D] = key[3..4].to_i + date_cypher[3].to_i
    cypher
  end

  def compatible_message
    compatible = @message
    until compatible.length % 4 == 0
      compatible += " "
    end
    compatible
  end

  def split_message_into_fours
    compatible_message.scan(/..../)
  end

  def separated_characters
    split_message_into_fours.map do |split_mess|
      split_mess.chars
    end
  end

  def separated_indexs
    separated_characters.map do |separate|
      separate.map do |char|
        character_set.index(char)
      end
    end
  end
end