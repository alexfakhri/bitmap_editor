class Image

  DEFAULT_VALUE = 'O'
  MAX_IMAGE_SIZE = 250

  attr_accessor :image

  def initialize(width, height)
    raise "Maximum size of #{MAX_IMAGE_SIZE} x #{MAX_IMAGE_SIZE} exceeded" if image_too_big?(width, height)
    @image = Array.new(height){Array.new(width, DEFAULT_VALUE)}
  end

  def colour_pixel(x, y, colour)
    image[x.to_i - 1 ][y.to_i - 1] = colour
  end

  def clear_image
    image.each{|row| row.map!{|pixle| pixle = DEFAULT_VALUE}}
  end

  def horizontal_line(x, y1, y2, colour)
    for n in y1..y2
      image[x.to_i - 1 ][n.to_i - 1] = colour
    end
  end

  def verticle_line(x1, x2, y, colour)
    for n in x1..x2
      image[n.to_i - 1 ][y.to_i - 1] = colour
    end
  end

  def image_too_big?(width, height)
    width.to_i > MAX_IMAGE_SIZE || height > MAX_IMAGE_SIZE
  end

end
