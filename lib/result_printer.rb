class ResultPrinter
  def initialize(current_path)
    @status_image = []
    @current_path = current_path

    # счетчик номеров файлов для отображения
    counter = 0
    # цикл для рисования изображений соответствующих номеру ошибок
    while counter <= 7
      # открываем файл
      file_name = @current_path + "/image/#{counter}.txt"
      # если файл существует передаем картинку в переменную закрываем файл, иначе пишем что файл с изображением
      # не найден
        if File.exist?(file_name)
          file = File.new(file_name, "r:UTF-8")
          @status_image << file.read
          file.close
        else
          @status_image << "\n [ изображение не найдено ] \n"
        end
      counter += 1
    end
  end

  # метод отображени картинок на основе полученых ошибок
  def print_viselitsa(errors)
    puts @status_image[errors]
  end

  # метод отображения статуса игры
  def print_status(game)
    # чистим экран
    cls

    puts
    # передаем на экран сообщение и вызываем методы у класа игра
    puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
    # передаем на экран сообщение о количестве ошибок
    puts "Ошибки: #{game.bad_letters.join(", ")}"
    # передаем на экран изображение из метода отображения виселиц
    print_viselitsa(game.errors)

    # проверяем статус игры и выводим соответсвующее ему сообщение
    if game.status == -1
      puts
      puts "Вы проиграли :("
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.status == 1
      puts
      puts "Поздравляем, вы выиграли!"
      puts
    else
      puts "У вас осталось ошибок: " + (7 - game.errors).to_s
    end
  end

  # метод отображения загаданного слова и отгаданных букв
  def get_word_for_print(letters, good_letters)
    result = ""

    # отображаем на экране отгаданную букву или прочерк вместо неотгаданной букву
    for item in letters do
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    end

    return result
  end

  # метод очистки экрана
  def cls
    system("clear") || system("cls")
  end
end
