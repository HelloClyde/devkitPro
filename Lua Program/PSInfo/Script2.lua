fond = Image.load("Images/fond d'ecran.png")
souris = Image.load("Images/souris.png")

x = 240
y = 136 


while true do 
pad = Controls.read() 
screen:clear()
screen:blit(0,0,fond)
screen:blit(x,y,souris)


if pad:cross() and x >= 100 and x <= 179  and y >= 33 and y <= 111 then
System.usbDiskModeActivate() 
System.message("USB actif, appuyer sur O pour desactiver",0) 
System.usbDiskModeDeactivate() 
end


if pad:cross() and x >= 104 and x <= 182  and y >= 157 and y <= 235 then
System.usbDevFlash0()
System.usbDiskModeActivate() 
System.message("USB flash0 actif, appuyer sur O pour desactiver",0) 
System.usbDiskModeDeactivate() 
end


if pad:cross() and x >= 205 and x <= 281  and y >= 106 and y <= 184 then
System.usbDevFlash1()
System.usbDiskModeActivate() 
System.message("USB flash1 actif, appuyer sur O pour desactiver",0) 
System.usbDiskModeDeactivate() 
end


if pad:cross() and x >= 305 and x <= 384  and y >= 37 and y <= 115 then
System.usbDevFlash2()
System.usbDiskModeActivate()
System.message("USB flash2 actif, appuyer sur O pour desactiver",0) 
System.usbDiskModeDeactivate() 
end


if pad:cross() and x >= 306 and x <= 386  and y >= 152 and y <= 231 then
System.usbDevFlash3()
System.usbDiskModeActivate()
System.message("USB flash3 actif, appuyer sur O pour desactiver",0)
System.usbDiskModeDeactivate() 
end

if pad:cross() and x >= 151 and x <= 366  and y >= 242 and y <= 269 then
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
