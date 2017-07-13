class Image

  DEFAULT_VALUE = 'O'

  attr_accessor :image

  def initialize(width, height)
    @image = Array.new(height){Array.new(width, DEFAULT_VALUE)}
  end


end
