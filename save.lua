function getSaves()
  saves = 0
  for i = 1, 100 do
    if love.filesystem.exists("save" .. i ..  ".txt") then
      saves = saves + 1
    else
      i = 100
    end
  end
end
