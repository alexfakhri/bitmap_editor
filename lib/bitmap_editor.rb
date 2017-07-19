require './lib/image'

class BitmapEditor

  COMMANDS = {'C' => :clear_image, 'L' => :colour_pixel, 'V' => :verticle_line,
              'H' => :horizontal_line, 'S' => :show_image, 'I' => :new_image, 'D' => :diagonal_line }

  attr_reader :image

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      commands(line)
    end
  end

  def commands(line)
    command, *arguments = line.split(" ")
    if line.match(/I (\d+) (\d+)/)
      new_image(*arguments)
    else
      if command_valid?(command, line) == true
        image.send(COMMANDS[command], *arguments)
      else
        raise 'Invalid Command Entered'
      end
    end
  end

  def new_image(width, height)
    @image = Image.new(width, height)
  end

  def command_valid?(command, line)
    case command
      when 'C'
        return true if line.match(/C+$/)
      when 'L'
        return true if line.match(/L (\d+) (\d+) (\w+)+$/)
      when 'V'
        return true if line.match(/V (\d+) (\d+) (\d+) (\w+)+$/)
      when 'H'
        return true if line.match(/H (\d+) (\d+) (\d+) (\w+)+$/)
      when 'D'
        return true if line.match(/D (\d+) (\d+) (\d+) (\w+)+$/)
      when 'S'
        return true if line.match(/S+$/)
      end
  end

end
