class EncryptMessage
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def compatible_message
    until @message.length % 4 == 0
      @message += " "
    end
  end
end