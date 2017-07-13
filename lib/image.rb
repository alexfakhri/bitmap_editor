class Image

  DEFAULT_VALUE = 'O'

  attr_accessor :image

  def initialize(width, height)
    @image = Array.new(height){Array.new(width, DEFAULT_VALUE)}
  end

  def colour_pixel(x, y, colour)
    image[x.to_i - 1 ][y.to_i - 1] = colour
  end

  def clear_image
    image.each{|row| row.map!{|pixle| pixle = DEFAULT_VALUE}}
  end

end
