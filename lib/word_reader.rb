class WordReader
  def read_from_args
    return ARGV[0]
  end

  def read_from_file(file_name)
    begin File.exist?(file_name)
      file = File.new(file_name, "r:UTF-8")
      lines = file.readlines
      file.close
      return lines.sample.downcase.chomp
    rescue
      @status_image << "\n [ изображение не найдено ] \n"
    end
  end
end
