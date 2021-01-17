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
end