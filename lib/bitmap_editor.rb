require './lib/image'

class BitmapEditor

  COMMANDS = {'C' => :clear_image, 'L' => :colour_pixel, 'V' => :verticle_line,
              'H' => :horizontal_line, 'S' => :show_image, 'I' => :new_image }

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
      image.send(COMMANDS[command], *arguments)
    end
  end

  def new_image(width, height)
    @image = Image.new(width, height)
  end

end
