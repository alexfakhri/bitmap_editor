class Image

  DEFAULT_VALUE = 'O'
  MAX_IMAGE_SIZE = 250

  attr_accessor :image

  def initialize(width, height)
    raise "Maximum size of #{MAX_IMAGE_SIZE} x #{MAX_IMAGE_SIZE} exceeded" if image_too_big?(width.to_i, height.to_i)
    @image = Array.new(height.to_i){Array.new(width.to_i, DEFAULT_VALUE)}
  end

  def colour_pixel(x, y, colour)
    raise 'Coordinates are off canvas' if coordinate_exists?(x.to_i - 1, y.to_i - 1)
    image[y.to_i - 1 ][x.to_i - 1] = colour
  end

  def clear_image
    image.each{|row| row.map!{|pixle| pixle = DEFAULT_VALUE}}
  end

  def verticle_line(x, y1, y2, colour)
    for n in order_range(y1, y2)
      raise 'Coordinates are off canvas' if coordinate_exists?(n.to_i - 1, x.to_i - 1)
      image[n.to_i - 1 ][x.to_i - 1] = colour
    end
  end

  def horizontal_line(x1, x2, y, colour)
    for n in order_range(x1, x2)
      raise 'Coordinates are off canvas' if coordinate_exists?(y.to_i - 1, n.to_i - 1)
      image[y.to_i - 1 ][n.to_i - 1] = colour
    end
  end

  def show_image
    image.each{ |row| STDOUT.puts(row.join(' ')) }
  end

  def order_range(arg1, arg2)
    a = [arg1, arg2].sort
    return a.first..a.last
  end

  private

    def image_too_big?(width, height)
      width.to_i > MAX_IMAGE_SIZE || height > MAX_IMAGE_SIZE
    end

    def coordinate_exists?(arg1, arg2)
      image.dig(arg1, arg2).nil?
    end

end
