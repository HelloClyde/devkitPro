fond = Image.load("Images/fond d'ecran4.png")
souris = Image.load("Images/souris.png")

x = 240
y = 136 

while true do 
pad = Controls.read() 
screen:clear()
screen:blit(0,0,fond)
screen:blit(x,y,souris)

if pad:cross()and x >= 39 and x <= 193  and y >= 46 and y <= 200 then
System.usbDevUMD() 
System.usbDiskModeActivate() 
System.message("USB UMD actif",0) 
System.usbDiskModeDeactivate() 
end

if pad:cross()and x >= 295 and x <= 449  and y >= 48 and y <= 202 then
System.startUMD()
end

if pad:cross()and x >= 142 and x <= 357  and y >= 234 and y <= 261 then
dofile ("Script1.lua")
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