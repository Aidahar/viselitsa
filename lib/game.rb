class Game
  attr_reader :letters, :errors, :good_letters, :bad_letters, :status

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  #получаем слово
  def get_letters(slovo)
    #если ничего не загадано, прерываем программу
    if slovo == nil || slovo == ""
      raise "Загадано пустое слово, нечего отгадывать. Закрываемся"
    end
    #если слово загадано разбиваем слово на массив букв
    return Unicode::downcase(slovo).encode('UTF-8').split("")
  end

  #проверяем букву на наличии в слове
  def next_step(bukva)
    #если статус игры -1 или 1 прекращаем работу метода
    if @status == -1 || @status == 1
      return
    end

    #если буква есть в массиве хороших букв или плохих букв прекращаем работу метода
    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    # если массив букв содержит букву и если выполнено оно из условий
    # то добавляем ее в массив хороших букв
    if @letters.include?(bukva) ||
      (bukva == "е" && @letters.include?("ё")) ||
      (bukva == "ё" && @letters.include?("е")) ||
      (bukva == "и" && @letters.include?("й")) ||
      (bukva == "й" && @letters.include?("и"))

      # берем букву и если эта букву: е, ё, и, й
      # добавляем в массив хороших букв её "сестру"
      case bukva
      when "е" then @good_letters << "ё"
      when "ё" then @good_letters << "е"
      when "и" then @good_letters << "й"
      when "й" then @good_letters << "и"
      end
      @good_letters << bukva
      # если массив хороших букв равен массиву букв из загаданного слова меняем статус на 1
      if @good_letters.uniq.sort == @letters.uniq.sort ||
        (@letters - good_letters).empty?
        @status = 1
      end
      # иначе букву добавляем в массив плохих букв и увеличиваем счетчик ошибок на 1
    else
      @bad_letters << bukva
      @errors += 1

      case bukva
      when "е" then @bad_letters << "ё"
      when "ё" then @bad_letters << "е"
      when "и" then @bad_letters << "й"
      when "й" then @bad_letters << "и"
      end
      # если ошибок станет больше 7 то статус игры равен -1
      if @errors >= 7
        @status = -1
      end
    end
  end

  #Спрашиваем букву
  def ask_next_letter
    puts "\nВведите следующую букву"

    #До тех пор пока бука не введена запрашивать букву
    letter = ""
    while letter == ""
      letter = Unicode::downcase(STDIN.gets.encode("UTF-8").chomp)
    end

    #передаем в метод полученную букву
    next_step(letter)
  end
end
