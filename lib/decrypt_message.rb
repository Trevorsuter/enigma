require './lib/character_set'

class DecryptMessage
  attr_reader :message, :key, :date

  def initialize (message, key, date)
    @message = message
    @key = key
    @date = date
  end
end