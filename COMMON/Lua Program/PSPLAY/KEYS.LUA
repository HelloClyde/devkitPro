System.usbDiskModeActivate()
y = 0
pink = Color.new(255, 0 , 153)
white = Color.new(255, 255, 255)
blue = Color.new(0 , 153, 255)
orange = Color.new(255, 102, 0)
gray = Color.new(153, 153, 153)
black = Color.new(0 , 0 , 0) 
screen:print(185, 136, "Loading: 0%", orange)
screen.flip()
c8v = Sound.load("media/keys/c8v.wav")
ab = Sound.load("media/keys/ab.wav")
gb = Sound.load("media/keys/gb.wav")
db = Sound.load("media/keys/db.wav")

background = Image.load("media/background6.png")
open = Image.load("media/keys.png")


screen:clear()
screen:print(185, 136, "Loading: 40%", orange)
screen.flip()

p = Image.load("media/smiley.png")
l = Image.load("media/left_trigger.png")

screen:clear()
screen:print(185, 136, "Loading: 60%", orange)
screen.flip()
b = Sound.load("media/keys/b.wav")
ld = Sound.load("media/l.wav")
c = Sound.load("media/keys/c.wav")
d = Sound.load("media/keys/d.wav")
f = Sound.load("media/keys/f.wav")
g = Sound.load("media/keys/g.wav")
eb = Sound.load("media/keys/eb.wav")
a = Sound.load("media/keys/a.wav")
bb = Sound.load("media/keys/bb.wav")
opening = Sound.load("media/opening5.wav")
e = Sound.load("media/keys/e.wav")
screen:clear()
screen:print(185, 136, "Loading: 80%", orange)
screen.flip()


screen:clear()
screen:print(185, 136, "Loading: 90%", orange)
screen.flip()

 screen:clear()
          screen:blit(0, 0, open)
screen.flip()
opening:play()
screen.waitVblankStart(60)
Music.volume(128)

oldpad = Controls.read()

while true do
          screen:blit(0, 0, background, false)

pad = Controls.read()

if pad:r() then
y = 1
end

if pad:cross() and not oldpad:cross() then
                    screen:blit(78, 209, p)
                    screen.flip()
			c:play()
			Music.volume(128)
			
	  end
 		if pad:circle() and not oldpad:circle() then
                    screen:blit(204, 209, p)
                    screen.flip()
				f:play()
				Music.volume(128)
			end

          if pad:triangle() and not oldpad:triangle() then
			if y == 0 then
                    screen:blit(160, 209, p)
                    screen.flip()
				e:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(141, 153, p)
                    screen.flip()
				eb:play()
				Music.volume(128)
			end
          end

          if pad:square() and not oldpad:square() then
			if y== 0 then
                    screen:blit(118, 209, p)
                    screen.flip()
				d:play()
				Music.volume(128)
         		end
			if y == 1 then
                    screen:blit(98, 153, p)
                    screen.flip()
				db:play()
				Music.volume(128)
			end
	end

          if pad:up() and not oldpad:up() then
			if y == 0 then
                    screen:blit(330, 209, p)
                    screen.flip()
				b:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(309, 153, p)
                    screen.flip()
				bb:play()
				Music.volume(128)
			end
          end

          if pad:right() and not oldpad:right() then
			c8v:play()
                    screen:blit(372, 209, p)
                    screen.flip()
				Music.volume(128)
			end
       

          if pad:down() and not oldpad:down() then
			if y == 0 then
                    screen:blit(246, 209, p)
                    screen.flip()
				g:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(226, 153, p)
                    screen.flip()
				gb:play()
				Music.volume(128)
			end
        

   end      

          if pad:left() and not oldpad:left() then
			if y== 0 then
                    screen:blit(288, 209, p)
                    screen.flip()
			a:play()
			Music.volume(128)
end
			if y == 1 then
                    screen:blit(268, 153, p)
                    screen.flip()
				ab:play()
				Music.volume(128)
			end
end
        

          if pad:l() and not oldpad:l() then
                    screen:blit(0, 100, l)
                    screen.flip()
			ld:play()
			Music.volume(128)
          end


if pad:select() and not oldpad:select() then
screen:save("keysscreenshot.png") 
end 

if  pad:start() then
dofile("script.lua")
end

oldpad = pad
y = 0
end
