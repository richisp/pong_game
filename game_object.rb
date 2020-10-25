class GameObject
  attr_accessor :x_coordinate, :y_coordinate, :width, :height

  def initialize(x_coordinate, y_coordinate, width, height)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @width = width
    @height = height
  end

  def left_coordinate
    x_coordinate
  end

  def right_coordinate
    x_coordinate + width
  end

  def top_coordinate
    y_coordinate
  end

  def bottom_coordinate
    y_coordinate + height
  end

  def center_y_coordinate
    y_coordinate + height/2
  end

  def center_x_coordinate
    x_coordinate + width/2
  end
end