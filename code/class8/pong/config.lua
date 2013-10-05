window = {
  width = 900,
  height = 600
}

paddle = {
  speed = window.height / 90,
  left_color = RED,
  right_color = BLUE,
  left_ai = function (ball_x, ball_y, paddle_y, direction)
              if direction < 0 then
                if paddle_y > ball_y then
                  return -1
                else
                  return 1
                end
              else
                return 0
              end
            end,
  right_ai = function (ball_x, ball_y, paddle_y, direction)
              if direction > 0 then
                if paddle_y > ball_y then
                  return -1
                else
                  return 1
                end
              else
                return 0
              end
            end
}

ball = {
  speed = window.width / 120
}
