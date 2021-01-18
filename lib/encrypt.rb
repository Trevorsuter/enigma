require './lib/enigma'
enigma = Enigma.new
message = File.open(ARGV[0])
encrypted = File.open(ARGV[1], 'w+')
encryption = enigma.encrypt(message.read)
encrypted.write(encryption[:encryption])
puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
