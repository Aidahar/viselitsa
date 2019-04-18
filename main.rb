require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"
require 'unicode_utils'

current_path = __dir__

puts "Игра виселица. Версия 3. (c) goodprogrammer.ru\n\n"
sleep 1

printer = ResultPrinter.new(current_path)
word_reader = WordReader.new
words_file_name = File.dirname(__FILE__) + "/data/words.txt"
game = Game.new(word_reader.read_from_file(words_file_name))

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
