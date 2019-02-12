class WordReader
  #метод обрабатывает ввод из командной строки
  def read_from_args
    ARGV[0]
  end

  #метод получает на вход путь к файлу со словами, проверяет есть ли там файлы, возвращает одно из слов файла со
  # словами.
  # этот код чтобы не набирать вручную, я скопировал из принтера результатов и забыл поправить строку ошибки
  def read_from_file(words_file_name)
    #если файл существует, создаем переменную и передаем в нее файл.
    if File.exist?(words_file_name)
      lines = IO.readlines(words_file_name, encoding: 'UTF-8')
    #возвращаем случайный элемент из массива слов
      lines.sample.downcase.chomp
      #если при чтении файла возникла ошибка прекращаем программу и выводим сообщение,
      #что Файл не найден
    else
      raise "\n [ Файл со словами не найден ] \n"
    end
  end
end
