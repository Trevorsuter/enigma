class EncryptMessage
  attr_reader :message

  def initialize(message)
    @message = message
    @encrypted = ""
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

  def ordinates
    separated_characters.map do |separate|
      separate.map do |char|
       if char.ord == 32
        char.ord - 1000
       else
        char.ord
       end
      end
    end
  end
end