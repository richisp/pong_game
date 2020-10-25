require_relative 'game_object'

class Paddle < GameObject
  WIDTH = 10
  HEIGHT = 70

  def initialize(x, y)
    super(x, y, WIDTH, HEIGHT)
    @last_mouse_y = 0
  end

  def display
    Gosu.draw_rect x_coordinate, y_coordinate, width, height, Gosu::Color::WHITE
  end

  def player_move(mouse_y, game_window_height)
    y = mouse_y
    diff = y - @last_mouse_y
    self.y_coordinate += diff

    self.y_coordinate = 0 if self.y_coordinate <= 0
    self.y_coordinate = game_window_height - self.height if self.bottom_coordinate >= game_window_height

    @last_mouse_y = y
  end

  def bot_move(ball_center_y_coordinate, game_window_height)
    ball_center_y_coordinate - self.center_y_coordinate > 0 ? direction = 1 : direction = -1

    self.y_coordinate += 5 * direction

    self.y_coordinate = 0 if self.top_coordinate <= 0
    self.y_coordinate = game_window_height - self.height if self.bottom_coordinate >= game_window_height
  end
end