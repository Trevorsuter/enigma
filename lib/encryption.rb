class Encryption
  attr_reader :message, :encrypted_message

  def initialize(message)
    @message = message
    @encrypted_message = String.new
  end
end