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

function save()
  if menu == 2 then
   if x > w / 2 - 100 and x < w / 2 + 100 and y > h / 2 + 300 and y < h / 2 + 400 then
     love.filesystem.write("save" .. tostring(saves + 1) ..  ".txt", tostring(selectedBody) .. ", " .. tostring(selectedHead))
     getSaves()
     loaded = saves
     menu = 0
   end
 end
end
