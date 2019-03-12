require 'digest'

puts "Введите слово или фразу для шифрования"
message = STDIN.gets.chomp

puts "Выберите способ шифрования:\n1.MD5\n2.SHA1\n3.SHA2"
choise = gets.chomp

if choise == "1"
  puts Digest::MD5.hexdigest message
elsif choise == "2"
  puts Digest::SHA1.hexdigest message
elsif choise == "3"
  puts Digest::SHA2.hexdigest message
end
