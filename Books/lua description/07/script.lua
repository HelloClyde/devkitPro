-- Í¼ÏñÊ¹ÓÃÊ¾Àý

grass = Image.load("grass.png")
player = Image.load("player.png")
flower = Image.load("flower.png") 

screenwidth = 480 - player:width()
screenheight = 272 - player:width() 

Player = { } Player[1] = { x = 200, y = 50 } 

while true do
pad = Controls.read()
screen:clear()

for a = 0, 14 do
     for b = 0,8 do
          screen:blit(32 * a, 32 * b, grass)
     end
end 
screen:blit(100,100,flower)

screen:blit(300,220,flower)
screen:blit(Player[1].x,Player[1].y,player) 

if pad:left() and Player[1].x > 0 then
Player[1].x = Player[1].x - 2
end

if pad:right() and Player[1].x < screenwidth then
Player[1].x = Player[1].x + 2
end

if pad:up() and Player[1].y > 0 then
Player[1].y = Player[1].y - 2
end

if pad:down() and Player[1].y < screenheight then
Player[1].y = Player[1].y + 2
end

screen.waitVblankStart()
screen.flip()
end 

