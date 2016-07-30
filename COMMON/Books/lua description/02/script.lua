-- 我的第一个 Lua 程序
-- 作者: gadget2k

red = Color.new(255, 0, 0) 
screen:print(200, 100, "Look! I made text appear!", red) 
screen.flip() 
while true do
  screen.waitVblankStart()
end