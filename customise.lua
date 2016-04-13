body = {}
head = {}
character = love.graphics.newImage("polaroids.png")
picture = love.graphics.newQuad (0, 560, 800, 600, character:getDimensions())
pictureBack = love.graphics.newQuad (0, 1160, 800, 600, character:getDimensions())
body[1] = love.graphics.newQuad (0, 144, 330, 416, character:getDimensions())
body[2] = love.graphics.newQuad (330, 144, 330, 416, character:getDimensions())
body[3] = love.graphics.newQuad (660, 144, 330, 416, character:getDimensions())
body[4] = love.graphics.newQuad (990, 144, 330, 416, character:getDimensions())
head[1] = love.graphics.newQuad (0, 0, 330, 144, character:getDimensions())
head[2] = love.graphics.newQuad (330, 0, 330, 144, character:getDimensions())
head[3] = love.graphics.newQuad (660, 0, 330, 144, character:getDimensions())
head[4] = love.graphics.newQuad (990, 0, 330, 144, character:getDimensions())
arrow = {love.graphics.newQuad (800, 562, 48, 90, character:getDimensions()), love.graphics.newQuad (848, 562, 48, 90, character:getDimensions())}
selectedBody = 1
selectedHead = 1
part = 1
arrow1 = 0
arrow2 = 1
function cC()
  love.graphics.draw(character,pictureBack, w / 2 - 400, h / 2 - 300)
  love.graphics.draw(character, body[selectedBody], w / 2 - 164 - 115, h / 2 + 96 - 213)
  love.graphics.draw(character, head[selectedHead], w / 2 - 164 - 115, h / 2 - 189 - 72)
  love.graphics.draw(character, picture, w / 2 - 400, h / 2 - 300)
  if part == 1 then
    love.graphics.draw(character, arrow[arrow2], w / 2, h / 2 - 176 - 45)
  else
    love.graphics.draw(character, arrow[arrow2], w / 2 + 100, h / 2 + 50 - 45)
  end
  love.graphics.draw(buttons, saveButton, w / 2 - 100, h / 2 + 300)
end

function updateArrow(t)
  arrow1 = arrow1 + t
  if arrow1 > 0.5 and arrow1 < 1 then
    arrow2 = 2
  elseif arrow1 > 1 then
    arrow2 = 1
    arrow1 = 0
  end
end
