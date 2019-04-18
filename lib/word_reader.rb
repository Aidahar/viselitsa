class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(words_file_name)
    if File.exist?(words_file_name)
      lines = IO.readlines(words_file_name, encoding: 'UTF-8')
      lines.sample.downcase.chomp
    else
      raise "\n [ Файл со словами не найден ] \n"
    end
  end
end
