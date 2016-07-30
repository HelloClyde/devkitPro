fond = Image.load("Images/fond d'ecran2.png")
souris = Image.load("Images/souris.png")
violet = Color.new(106,48,255)

x = 240
y = 136 


while true do 
pad = Controls.read() 
screen:clear()
screen:blit(0,0,fond)
screen:blit(x,y,souris)


if pad:cross() and x >= 76 and x <= 131  and y >= 107 and y <= 162 then
dofile ("Script2.lua")
end

if pad:cross() and x >= 212 and x <= 267 and y >= 107 and y <= 162 then
dofile ("Script3.lua")
end

if pad:cross() and x >= 349 and x <= 404 and y >= 107 and y <= 162 then
dofile ("Script4.lua")
end


if pad:cross() and x >= 214 and x <= 261 and y >= 241 and y <= 252 then
System.Quit()
end


if math.abs(pad:analogY()) > 32 then
y = y + pad:analogY() / 32;
end

if math.abs(pad:analogX()) > 32 then
x = x + pad:analogX() / 32;
end

if x < 0 then x = 0 elseif x + souris:width() > 480 then x = 480 -  souris:width() end
if y < 0 then y = 0 elseif y + souris:height() > 272 then y = 272 -  souris:width() end

screen.flip()
screen.waitVblankStart()
end
