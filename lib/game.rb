class Game
  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(slovo)
    if slovo == nil || slovo == ""
      abort "Загадано пустое слово, нечего отгадывать. Закрываемся"
    end
    return Unicode::downcase(slovo).encode('UTF-8').split("")
  end

  def status
    return @status
  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      @good_letters << bukva

      if @good_letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end
    else
      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ""
    while letter == ""
      letter = Unicode::downcase(STDIN.gets.encode("UTF-8").chomp)
    end

    if (letter == "е" && letters.include?("ё")) ||
    (letter == "ё" && letters.include?("е")) ||
    (letter == "и" && letters.include?("й")) ||
    (letter == "й" && letters.include?("и"))

      if letter == "е"
        good_letters << "ё"
      end

      if letter == "ё"
        good_letters << "е"
      end

      if letter == "и"
        good_letters << "й"
      end

      if letter == "й"
        good_letters << "и"
      end
    end

    next_step(letter)
  end

  def errors
    @errors
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end
end
