require("customise")
x = 0
xV = 0
y = 0
yV = 0
direction = "right"
collision = {}
frame = 0

function getDirection()
  if math.abs(xV) > math.abs(yV) then
    if xV > 0 then
      return "left"
    elseif xV < 0 then
      return "right"
    end
  elseif math.abs(xV) < math.abs(yV) then
    if yV > 0 then
      return "back"
    elseif yV < 0 then
      return "front"
    end
  end
end
function addCollision(x1, y1, x2, y2)
  table.insert(collision, {x1 - bottom:getWidth(), y1 - bottom:getHeight(), x2- bottom:getWidth(), y2 - bottom:getHeight()})
end

function checkCollision()
  i = 1
  while i < #collision + 1 do
    if y > collision[i][2] and y < collision[i][4] and x > collision[i][1] - 10 and x < collision[i][1] and xV > 0 then
      x = x - xV
      xV = 0
    elseif y > collision[i][2] and y < collision[i][4] and x > collision[i][3] and x < collision[i][3] + 10 and xV < 0 then
      x = x - xV
      xV = 0
    elseif x > collision[i][1] and x < collision[i][3] and y > collision[i][2] - 10 and y < collision[i][2] and yV > 0 then
      y = y - yV
      yV = 0
    elseif x > collision[i][1] and x < collision[i][3] and y > collision[i][4] and y < collision[i][4] + 10 and yV < 0 then
      y = y - yV
      yV = 0
    end
      i = i + 1
  end
end
function love.update(dt)
  if menu == 0 then
  if love.keyboard.isDown("d") == true then
    xV = xV - 1
  end
  if love.keyboard.isDown("a") == true then
    xV = xV + 1
  end
  if love.keyboard.isDown("w") == true then
    yV = yV + 1
  end
  if love.keyboard.isDown("s") == true then
    yV = yV - 1
  end
  end
  x = x + xV
  y = y + yV
  if frame + 0.1 > 4 then
    frame = 0
  end
  frame = frame + (math.abs(xV) / 50 + math.abs(yV) / 50)
  if xV ~= 0 or yV ~= 0 then
    checkCollision()
    direction = getDirection()
  end
  if math.abs(xV) < 0.3 and math.abs(yV) < 0.3 then
    frame = 4
  end
  yV = yV * 0.9
  xV = xV * 0.9
  updateArrow(dt)
end
