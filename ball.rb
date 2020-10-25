require_relative 'game_object'

class Ball < GameObject
  WIDTH = 5
  HEIGHT = 5

  attr_reader :speed
  def initialize(x_coordinate, y_coordinate, speed)
    super(x_coordinate, y_coordinate, WIDTH, HEIGHT)
    @speed = speed
  end

  def move
    self.x_coordinate += speed[:horizontal]
    self.y_coordinate += speed[:vertical]
  end

  def update(player_paddle, bot_paddle, life, game_window_width, game_window_height)
    reflect_vertical if collide_wall?(game_window_height)

    if collide_with?(player_paddle)
      bounce
    elsif collide_with?(bot_paddle)
      bounce
    elsif x_coordinate <= 0
      life[:left] -= 1
      speed[:horizontal] = 5
      self.x_coordinate = player_paddle.right_coordinate
    elsif right_coordinate >= game_window_width
      life[:right] -= 1
      speed[:horizontal] = -5
      self.x_coordinate = bot_paddle.left_coordinate
    end
  end

  def collide_wall?(game_window_height)
    y_coordinate < 0 || bottom_coordinate > game_window_height
  end

  def increase_speed
    self.speed[:horizontal] *= 1.1
  end

  def bounce
    self.speed[:horizontal] *= -1
    increase_speed
  end

  def reflect_vertical
    self.speed[:vertical] *= -1
  end

  def collide_with?(object)
    if x_coordinate >= object.x_coordinate + object.width || object.x_coordinate >= x_coordinate + width
      return false
    elsif y_coordinate >= object.y_coordinate + object.height || object.y_coordinate >= y_coordinate + height
      return false
    end

    true
  end

  def display
    Gosu.draw_rect x_coordinate, y_coordinate, WIDTH, HEIGHT, Gosu::Color::RED
  end
end