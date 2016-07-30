-- 数据表示例

oldpad = Controls.read()
green = Color.new(0, 255, 0)
Enemy = { }
Enemy[1] = { type = "gargoyle", health = 100 }
Enemy[2] = { type = "vampire", health = 100 }
Enemy[3] = { type = "goomba", health = 100 }
Enemy[4] = { type = "ghost", health = 100 }
Enemy[5] = { type = "zombie", health = 100 } 
Player = { }
Player[1] = { weapon = "sword", health = 100 }
Player[2] = { weapon = "knife", health = 100 }

while true do
  pad = Controls.read()
  screen:clear()
  screen:print(5,10,"Player 1 Health: " .. Player[1].health,green)
  screen:print(5,20,"Player 1 Weapon: " .. Player[1].weapon,green)
  screen:print(250,10,"Enemy Health: " .. Enemy[1].health,green)
  screen:print(250,20,"Enemy Type: " .. Enemy[1].type,green)
  
  if pad:cross() and oldpad:cross() ~= pad:cross() and Enemy[1].health > 0 then 
    Enemy[1].health = Enemy[1].health - 5
  end 
  
  screen.waitVblankStart()
  screen.flip()
  oldpad = pad 
end 
