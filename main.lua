function love.load ()
  char = {}
  require("collision")

      --Start Menu
    love.graphics.getWidth ()
    love.graphics.getHeight ()
    love.window.setFullscreen (true)

    logo = love.graphics.newImage ("logo.png")
    skyline = love.graphics.newImage ("skyline.png")
    startsprite = love.graphics.newImage ("StartButtons.png")
    start = love.graphics.newQuad (0, 0, 200, 100, startsprite:getDimensions())
    back = love.graphics.newQuad (0, 100, 200, 100, startsprite:getDimensions())

    w = love.graphics.getWidth ()
    h = love.graphics.getHeight ()
      --Width of starting screen 1366, 768
    menu = true
    resolution = math.ceil (w / 1366)


      --Wolrd Creation

      top = love.graphics.newImage ("toplayer.png")
      bottom = love.graphics.newImage ("backlayer.png")

      addCollision(67, 734, 1854, 911)
      --65, 184, 1852, 345 real cordinates
      addCollision(67, 94, 1854, 255)
      --65, 985, 1852, 824 real cordinates


      --Character Creation
          right = love.graphics.newImage("right.png")
    left = love.graphics.newImage("left.png")
    front = love.graphics.newImage("front.png")

    char[1] = love.graphics.newQuad (0, 64, 64, 64, right:getDimensions())
    char[2] = love.graphics.newQuad (0, 128, 64, 64, right:getDimensions())
    char[3] = love.graphics.newQuad (0, 192, 64, 64, right:getDimensions())
    char[4] = love.graphics.newQuad (0, 128, 64, 64, right:getDimensions())
    char[5] = love.graphics.newQuad (0, 0, 64, 64, right:getDimensions())





   function love.draw ()
       i = 0
     if menu == true then
       love.graphics.draw (logo, w / 2 - 500, h / 2 - 600)
       love.graphics.setBackgroundColor (178, 168, 160)
       while i < resolution do
         love.graphics.draw (skyline, i * 1366, h - 868)
         i = i + 1
       end
       if resolution == 0 then
         love.graphics.draw (skyline, 0, 0 )
       end
       love.graphics.draw (startsprite, start, w / 2 - 100, h / 2 - 50)
       love.graphics.draw (startsprite, back, w / 2 - 100, h / 2 + 160)
     else
       love.graphics.draw(bottom, w / 2 + x, h / 2 + y)
       if direction == "right" then
         love.graphics.draw(right, char[math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       elseif direction == "left" then
         love.graphics.draw(left, char[math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       elseif direction == "back" then
         love.graphics.draw(front, char[math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       elseif direction == "front" then
         love.graphics.draw(front, char[math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       end
       love.graphics.draw(top, w / 2 + x, h / 2 + y)
     end

   function love.mousepressed (x, y, button)
      if menu == true then
        if button == 1 then
          if x > w / 2 - 100 and x < w / 2 + 100 and y > h / 2 - 50 and y < h / 2 + 50  then
            love.graphics.setBackgroundColor(0, 0, 0)
            menu = false
          elseif x > w / 2 - 100 and x < w / 2 + 100 and y > h / 2 + 160 and y < h / 2 + 260 then
            love.event.quit ()
          end
        end
      end
   end

   function love.keypressed (key)
     if key == "escape" and menu == false then
       love.graphics.setBackgroundColor (104, 92, 83)
       menu = true
     end
   end
 end
end
