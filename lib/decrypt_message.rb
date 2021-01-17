require './lib/character_set'
require 'date'

class DecryptMessage
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
end