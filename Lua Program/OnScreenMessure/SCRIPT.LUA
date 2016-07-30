-- OnScreenMessrue v0.6
-- by N0ePDA_PSP


chooser = Image.load("chooser.png")
back = Image.load("karo.jpg")
bar = Image.load("bar.jpg")
bopfont = Font.load("Boopee.ttf")
help = Image.load("help.png")
helping = false
bopfont:setPixelSizes(0, 25)
top = 19
x1 = 0
y1 = 0
x2 = 0
y2 = 0
firstset = true
bothset = false
colour = Color.new(0,0,0)
infocol = Color.new(255,0,0)
greencol = Color.new(0,255,0)
length = 0
cm = 0
inchon = false
ansinch = ""
ans = ""
calced = false
waiting = false
waiter = 0
line = true
rect = false
area = 0
r = 0

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end


while true do
	screen:clear()
	screen:blit(0,0, back)
	if line == true then
		screen:blit(293,0, bar)
	else
		screen:blit((480 - bar:width()),0, bar)
	end
	pad = Controls.read()
	
	if pad:analogX()> 25 then
		if firstset == true then
			x1 = x1 + 1
		else
			x2 = x2 + 1
		end
	elseif pad:analogX()< -25 then
		if firstset == true then
			x1 = x1 - 1
		else
			x2 = x2 - 1
		end
	end

	if pad:analogY()> 25 then
		if firstset == true then
			y1 = y1 + 1
		else
			y2 = y2 + 1
		end
	elseif pad:analogY()< -25 then
		if firstset == true then
			y1 = y1 - 1
		else
			y2 = y2 - 1
		end
	end
	
	if pad : down()then
		if firstset == true then
			if y1 + chooser:height() < 271 then
				y1 = y1 + 1
			end
		else
			if y2 + chooser:height() < 271 then
				y2 = y2 + 1
			end
		end
	end
	
	if pad : up()then
		if firstset == true then
			if y1 > 1 then
				y1 = y1 - 1
			end
		else
			if y2 > 1 then
				y2 = y2 - 1
			end
		end
	end
	
	if pad : left()then
		if firstset == true then
			if x1 > 1 then
				x1 = x1 - 1
			end
		else
			if x2 > 1 then
				x2 = x2 - 1
			end
		end
	end
	
	if pad : right()then
		if firstset == true then
			if x1 + chooser:width() < 479 then
				x1 = x1 + 1
			end
		else
			if x2 + chooser:width() < 479 then
				x2 = x2 + 1
			end
		end
	end
	
	if pad : cross() then
		if firstset == true then
			firstset = false
		end
	end
	
	
	if pad : r() then
		line = false
		x1 = 0
		y1 = 0
		x2 = 0
		y2 = 0
		firstset = true
		bothset = false
		length = 0
		cm = 0
		ans = ""
		calced = false
		
	end
	
	if pad : l() then
		line = true
		x1 = 0
		y1 = 0
		x2 = 0
		y2 = 0
		firstset = true
		bothset = false
		length = 0
		cm = 0
		ans = ""
		calced = false
	end
	
	if pad : select() then
		if waiting == false then
			if inchon == false then
				inchon = true
			else
				inchon = false
			end
			waiting = true
		end
	end
	
	if pad : circle() then
		rect = false
	end
	
	if pad : square() then

	end
	
	if line == true then
		if firstset == false then
			length = math.sqrt(((y2-y1)*(y2-y1)) + ((x2-x1) * (x2-x1)))
			cm = length / 51.132
			ans = tostring(cm)
			dot = string.find(ans, ".")
			ans = string.sub(ans, 1, (dot + 3))
			
			ansinch = tostring(cm / 2.54)
			dot = string.find(ansinch, ".")
			ansinch = string.sub(ansinch, 1, (dot + 3))
			calced = true
		end
	else
		if rect == false then
			if firstset == false then
				r = math.sqrt(((y2-y1)*(y2-y1)) + ((x2-x1) * (x2-x1)))
				r = r / 51.132
				area = math.pi * (r * r)
				ans = tostring(area)
				dot = string.find(ans, ".")
				ans = string.sub(ans, 1, (dot + 3))
				
				ansinch = tostring(area / 6.4516)
				dot = string.find(ansinch, ".")
				ansinch = string.sub(ansinch, 1, (dot + 3))
				calced = true
			end
		end
	end
	
	screen:blit(x1,y1, chooser, true)
	screen:blit(x2,y2, chooser, true)
	screen:fontPrint(bopfont,310,top, "Line             Area", colour)
	if line == false then
		if rect == true then
			screen:fontPrint(bopfont,1,265, "Rectangle", colour)
		else
			screen:fontPrint(bopfont,1,265, "Circle", colour)
		end
	end
	if calced == true then
		if inchon == false then
			if line == true then
				screen:fontPrint(bopfont,1,top, ans .. " cm", colour)
			else
				screen:fontPrint(bopfont,1,top, ans .. " cm*cm", colour)
			end
		else
			if line == true then
				screen:fontPrint(bopfont,1,top, ansinch .. " inch", colour)
			else
				screen:fontPrint(bopfont,1,top, ansinch .. " inch*inch", colour)
			end
		end
	end
	
	if pad : start() then
		if waiting == false then
			if helping == false then
				screen:blit(0,0,help,true)
				waiting = true
				helping = true
			end
		end
	end
	
	if helping == true then
		if waiting == false then
			if pad:cross() or pad:start() then
				helping = false
			end
		end
	screen:blit(0,0,help,true)
	end
			
	if waiting == true then
		if waiter < 10 then
			waiter = waiter + 1
		else
			waiter = 0
			waiting = false
		end
	end
	screen.waitVblankStart()
	screen.flip()
end