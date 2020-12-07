require_relative 'ball'
require_relative 'paddle'
require 'test/unit'

class Tests < Test::Unit::TestCase

  def test_simple
    ball = Ball.new(0, 0, { :horizontal => 5, :vertical => 4 })

    ball.move
    assert_equal(5, ball.x_coordinate )
    assert_equal(4, ball.y_coordinate )
  end

  def test_simple2
    bot_paddle = Paddle.new(0, 0)

    bot_paddle.bot_move(50, 100)
    assert_equal(5, bot_paddle.y_coordinate)
  end

  def test_simple3
    player_paddle = Paddle.new(0, 0)

    player_paddle.player_move(450, 500)
    assert_equal(430, player_paddle.y_coordinate)
  end
end