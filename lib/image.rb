class Image

  DEFAULT_VALUE = 'O'
  MAX_IMAGE_SIZE = 250

  attr_accessor :image

  def initialize(width, height)
    raise "Maximum size of #{MAX_IMAGE_SIZE} x #{MAX_IMAGE_SIZE} exceeded" if image_too_big?(width.to_i, height.to_i)
    @image = Array.new(height.to_i){Array.new(width.to_i, DEFAULT_VALUE)}
  end

  def colour_pixel(x, y, colour)
    raise 'Coordinates are off canvas' if check_coordinates?(x, y)
    image[x.to_i - 1 ][y.to_i - 1] = colour
  end

  def clear_image
    image.each{|row| row.map!{|pixle| pixle = DEFAULT_VALUE}}
  end

  def verticle_line(x, y1, y2, colour)
    for n in y1..y2
      image[n.to_i - 1 ][x.to_i - 1] = colour
    end
  end

  def horizontal_line(x1, x2, y, colour)
    for n in x1..x2
      image[y.to_i - 1 ][n.to_i - 1] = colour
    end
  end

  def image_too_big?(width, height)
    width.to_i > MAX_IMAGE_SIZE || height > MAX_IMAGE_SIZE
  end

  def show_image
    image.each{ |row| STDOUT.puts(row.join(' ')) }
  end

  def check_coordinates?(x, y)
    image.dig(x, y).nil?
  end

end
