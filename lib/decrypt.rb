require './lib/enigma'

enigma = Enigma.new
encrypted = File.open(ARGV[0])
decrypted = File.open(ARGV[1], 'w+')
decryption = enigma.decrypt(encrypted.read, ARGV[2], ARGV[3])
decrypted.write(decryption[:decryption])

puts "Created #{ARGV[1]} with the key #{ARGV[2]} and the date #{ARGV[3]}"