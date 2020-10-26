require 'gosu'

require_relative 'paddle'
require_relative 'ball'

class GameWindow < Gosu::Window
  attr_reader :life

  WIDTH = 1000
  HEIGHT = 500

  def initialize
    super GameWindow::WIDTH, GameWindow::HEIGHT

    margin = 10

    @player_paddle = Paddle.new(margin, 0)

    @bot_paddle = Paddle.new(self.width - Paddle::WIDTH - margin, 0)

    @ball = Ball.new(GameWindow::WIDTH/2, GameWindow::HEIGHT/2, { :horizontal => 5, :vertical => 5 })

    @life = { right: 3, left: 3 }
    @score_font = Gosu::Font.new(50)
  end

  def update
    @player_paddle.player_move(mouse_y, self.height)
    @bot_paddle.bot_move(@ball.center_y_coordinate, self.height)

    @ball.move
    @ball.update(@player_paddle, @bot_paddle, @life, self.width, self.height)

    if @life[:right] <= 0
      close
      puts "You win!"
    elsif @life[:left] <= 0
      close
      puts "You lose."
    end
  end

  def draw
    draw_background
    display_score
    @player_paddle.display
    @bot_paddle.display
    @ball.display
  end

  def draw_background
    Gosu.draw_rect 0, 0, self.width, self.height, Gosu::Color::BLACK
  end

  def display_score
    center_x = self.width / 2
    offset = 50
    space = 300
    @score_font.draw "Life: #{@life[:left]}", center_x - offset - space, offset, 2
    @score_font.draw "Life: #{@life[:right]}", center_x - offset + space, offset, 2
  end
end

window = GameWindow.new
window.show