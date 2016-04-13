function love.load ()
  require("collision")
  require("customise")
  require("save")

      --Start Menu

    love.graphics.getWidth ()
    love.graphics.getHeight ()
    love.window.setFullscreen (true)

    logo = love.graphics.newImage ("logo.png")
    skyline = love.graphics.newImage ("skyline.png")
    buttons = love.graphics.newImage ("StartButtons.png")
    loadButton = love.graphics.newQuad (0, 0, 200, 100, buttons:getDimensions())
    backButton = love.graphics.newQuad (0, 100, 200, 100, buttons:getDimensions())
    newButton = love.graphics.newQuad (0, 200, 200, 100, buttons:getDimensions())
    saveButton = love.graphics.newQuad (0, 300, 200, 100, buttons:getDimensions())

    w = love.graphics.getWidth ()
    h = love.graphics.getHeight ()
      --Width of starting screen 1366, 768
    menu = 1
    resolution = math.ceil (w / 1366)


      --Wolrd Creation

      top = love.graphics.newImage ("toplayer.png")
      bottom = love.graphics.newImage ("backlayer.png")

      addCollision(67, 734, 1854, 911)
      --65, 184, 1852, 345 real coordinates
      addCollision(67, 94, 1854, 255)
      --65, 985, 1852, 824 real coordinates


      --Character Generation

      right = love.graphics.newImage("right.png")
      left = love.graphics.newImage("left.png")
      front = love.graphics.newImage("front.png")
      back = love.graphics.newImage("back.png")

      charBody = {}
      charHead = {}
      for i = 1, 4 do
        charBody[i] = {}
        charBody[i][1] = love.graphics.newQuad (i * 64 - 64, 84, 64, 44, right:getDimensions())
        charBody[i][2] = love.graphics.newQuad (i * 64 - 64, 148, 64, 44, right:getDimensions())
        charBody[i][3] = love.graphics.newQuad (i * 64 - 64, 212, 64, 44, right:getDimensions())
        charBody[i][4] = love.graphics.newQuad (i * 64 - 64, 148, 64, 44, right:getDimensions())
        charBody[i][5] = love.graphics.newQuad (i * 64 - 64, 20, 64, 44, right:getDimensions())
        charHead[i] = {}
        charHead[i][1] = love.graphics.newQuad (i * 64 - 64, 64, 64, 20, right:getDimensions())
        charHead[i][2] = love.graphics.newQuad (i * 64 - 64, 128, 64, 20, right:getDimensions())
        charHead[i][3] = love.graphics.newQuad (i * 64 - 64, 192, 64, 20, right:getDimensions())
        charHead[i][4] = love.graphics.newQuad (i * 64 - 64, 128, 64, 20, right:getDimensions())
        charHead[i][5] = love.graphics.newQuad (i * 64 - 64, 0, 64, 20, right:getDimensions())
      end

    loaded = 0
    getSaves()

    -- Drawing Images

   function love.draw ()
       i = 0

       --Start Menu
     if menu == 1 then
       love.graphics.draw (logo, w / 2 - 500, h / 2 - 600)
       love.graphics.setBackgroundColor (178, 168, 160)
       while i < resolution do
         love.graphics.draw (skyline, i * 1366, h - 868)
         i = i + 1
       end
       if resolution == 0 then
         love.graphics.draw (skyline, 0, 0 )
       end
       love.graphics.draw (buttons, loadButton, w / 2 - 100, h - 550)
       love.graphics.draw (buttons, newButton, w / 2 - 100, h - 400)
       love.graphics.draw (buttons, backButton,  w / 2 - 100, h - 250)

       --Character/Animations
     elseif menu == 0 then
       love.graphics.setBackgroundColor(0, 0, 0)
       love.graphics.draw(bottom, w / 2 + x, h / 2 + y)
       if direction == "right" then
         love.graphics.draw(right, charBody[selectedBody][math.floor(frame) + 1], w / 2 - 32, h / 2 - 44)
         love.graphics.draw(right, charHead[selectedHead][math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       elseif direction == "left" then
         love.graphics.draw(left, charBody[selectedBody][math.floor(frame) + 1], w / 2 - 32, h / 2 - 44)
         love.graphics.draw(left, charHead[selectedHead][math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       elseif direction == "back" then
         love.graphics.draw(back, charBody[selectedBody][math.floor(frame) + 1], w / 2 - 32, h / 2 - 44)
         love.graphics.draw(back, charHead[selectedHead][math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       elseif direction == "front" then
         love.graphics.draw(front, charBody[selectedBody][math.floor(frame) + 1], w / 2 - 32, h / 2 - 44)
         love.graphics.draw(front, charHead[selectedHead][math.floor(frame) + 1], w / 2 - 32, h / 2 - 64)
       end
       love.graphics.draw(top, w / 2 + x, h / 2 + y)

       --Character Customization
     elseif menu == 2 then
       love.graphics.setBackgroundColor(191, 178, 165)
       while i < resolution do
         love.graphics.draw (skyline, i * 1366, h - 868)
         i = i + 1
       end
       if resolution == 0 then
         love.graphics.draw (skyline, 0, 0 )
       end
       cC()
     elseif menu == 3 then
       for i = 0, saves do

       end
     end
   end

     --Buttons Function (makes buttons work)
   function love.mousepressed (x, y, button)
      if button == 1 then
        if menu == 1 then

            --Start button
          if x > w / 2 - 100 and x < w / 2 + 100 and y > h - 550 and y < h - 450  then
            menu = 0

            --Back button
          elseif x > w / 2 - 100 and x < w / 2 + 100 and y > h -250 and y < h - 150 then
            love.event.quit ()

            -- Load button
          elseif x > w / 2 - 100 and x < w / 2 + 100 and y > h - 400 and y < h - 300 then
           menu = 2
         end
        elseif menu == 2 then

            -- Character customization buttons
          if x > w / 2 - 100 and x < w / 2 + 100 and y > h / 2 + 300 and y < h / 2 + 400 then
           love.filesystem.write("save" .. tostring(saves + 1) ..  ".txt", "selectedBody = " .. tostring(selectedBody) .. "\r\nselectedHead = " .. tostring(selectedHead))
           getSaves()
           load = love.filesystem.load("save" .. tostring(saves) ..  ".txt", 10)
           load()
           menu = 0
          end
        end
      end
   end

     --Escape menu + Character customization Navigation
   function love.keypressed (key)

     --Escape menu
     if key == "escape" and menu ~= 1 then
       love.graphics.setBackgroundColor (104, 92, 83)
       menu = 1
     end

     --Arrow Navigation (up)
     if key == "w" and menu == 2 then
       part = part + 1
       if part > 2 then
         part = 1
       end
     end

     --Arrow Navigation (down)
     if key == "s" and menu == 2 then
       part = part - 1
       if part < 1 then
         part = 2
       end
     end

     --Clothing change (light)
     if key == "d" and menu == 2 then
       if part == 1 then
         selectedHead = selectedHead + 1
         if selectedHead > 4 then
           selectedHead = 1
         end
       else
         selectedBody = selectedBody + 1
         if selectedBody > 4 then
           selectedBody = 1
         end
       end
     end

     --Clothing change (left)
     if key == "a" and menu == 2 then
       if part == 1 then
         selectedHead = selectedHead - 1
         if selectedHead < 1 then
           selectedHead = 4
         end
       else
         selectedBody = selectedBody - 1
         if selectedBody < 1 then
           selectedBody = 4
         end
       end
     end
   end
end
