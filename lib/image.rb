class Image

  DEFAULT_VALUE = 'O'

  attr_accessor :image

  def initialize(width, height)
    @image = Array.new(height){Array.new(width, DEFAULT_VALUE)}
  end

  def colour_pixel(x, y)
    image[x.to_i - 1 ][y.to_i - 1] = 'C'
  end


end
