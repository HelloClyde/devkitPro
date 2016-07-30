white = Color.new(255,255,255)
blue = Color.new(0,0,255)
black = Color.new(0,0,0)
oldpad = Controls.read()
startcolor = black
gamestate = "menu" 
menusound = Sound.load("beep.wav",false)
goodbye = Sound.load("goodbye.wav",false) 
file = io.open("counter.txt", "r")
counter = file:read("*n")
file:close() 
selector = { image = Image.createEmpty(145,15), x = 147,y = 77 }
selector.image:clear(blue)
function drawMenu() 
screen:clear()
pad = Controls.read() 
screen:blit(selector.x,selector.y,selector.image)
screen:print(150,80,"Start Game (Black)",white)
screen:print(150,100,"Start Game (Blue)",white) 
if pad:up() and oldpad:up() ~= pad:up() then
   selector.y = 77
   startcolor = black
   local sound = menusound
   voice = sound:play()
end 
if pad:down() and oldpad:down() ~= pad:down() then
selector.y = 97
startcolor = blue
local sound = menusound
voice = sound:play()
end 
if pad:cross() and oldpad:cross() ~= pad:cross() then
gamestate = "game"
counter = counter + 1
file = io.open("counter.txt","w")
file:write(counter)
file:close()
end
end 
function playGame()
screen:clear(startcolor)
pad = Controls.read() 
screen:print(100,100,"This program has been executed " .. counter .. " times.",white)
screen:print(100,110,"Press Start to exit to Menu",white)

if pad:start() then
gamestate = "menu"
local sound = goodbye
voice = sound:play()
end
end 
while true do

if gamestate == "menu" then
drawMenu()
end

if gamestate == "game" then
playGame()
end

screen.flip()
oldpad = pad
end 
