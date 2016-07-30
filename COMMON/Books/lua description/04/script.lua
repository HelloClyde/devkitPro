-- *****变量********
green = Color.new(0,255,0) 
upPressed = 'You are pressing the "UP" button'
downPressed = 'You are pressing the "DOWN" button'
leftPressed = 'You are pressing the "LEFT" button'
rightPressed = 'You are pressing the "RIGHT" button'
LPressed = 'You are pressing the "L" button' 

-- *****主循环****** 
while true do 
screen:clear() 
pad = Controls.read() 
if pad:up() then screen:print(100,100,upPressed,green) end 
if pad:down() then screen:print(100,100,downPressed,green) end
if pad:left() then screen:print(100,100,leftPressed,green) end
if pad:right() then screen:print(100,100,rightPressed,green) end
if pad:l() then screen:print(100,100,LPressed,green) end 
if pad:r() then screen:print(100,100,'You are pressing the "R" button',green) end
if pad:triangle() then screen:print(100,100,'You are pressing the "TRIANGLE" button',green) end
if pad:circle() then screen:print(100,100,'You are pressing the "CIRCLE" button',green) end
if pad:cross() then screen:print(100,100,'You are pressing the "X" button',green) end
if pad:square() then screen:print(100,100,'You are pressing the "SQUARE" button',green) end
screen.waitVblankStart()
screen.flip()
end 