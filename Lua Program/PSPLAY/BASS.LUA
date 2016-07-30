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
e8v = Sound.load("media/bass/e8v.wav")

ab = Sound.load("media/bass/ab.wav")

gb = Sound.load("media/bass/gb.wav")

db = Sound.load("media/bass/db.wav")

background = Image.load("media/background2.png")
open = Image.load("media/bass.png")

screen:clear()
screen:print(185, 136, "Loading: 40%", orange)
screen.flip()

l = Image.load("media/left_trigger.png")

screen:clear()
screen:print(185, 136, "Loading: 60%", orange)
screen.flip()


b = Sound.load("media/bass/b.wav")
ld = Sound.load("media/l.wav")
c = Sound.load("media/bass/c.wav")
d = Sound.load("media/bass/d.wav")
f = Sound.load("media/bass/f.wav")
g = Sound.load("media/bass/g.wav")
eb = Sound.load("media/bass/eb.wav")
a = Sound.load("media/bass/a.wav")
bb = Sound.load("media/bass/bb.wav")
opening = Sound.load("media/opening2.wav")
e = Sound.load("media/bass/e.wav")
screen:clear()
screen:print(185, 136, "Loading: 80%", orange)
screen.flip()


screen:clear()
screen:print(185, 136, "Loading: 90%", orange)
screen.flip()

p = Image.load("media/arrow.png")
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
                    screen:blit(36, 34, p)
                    screen.flip()
			e:play()
			Music.volume(128)
			
	  end
 		if pad:circle() and not oldpad:circle() then
			if y == 0 then
                    screen:blit(199, 34, p)
                    screen.flip()
				a:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(166, 34, p)
                    screen.flip()
				ab:play()
				Music.volume(128)
			end
          end

          if pad:triangle() and not oldpad:triangle() then
			if y == 0 then
                    screen:blit(134, 34, p)
                    screen.flip()
				g:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(103, 34, p)
                    screen.flip()
				gb:play()
				Music.volume(128)
			end
          end

          if pad:square() and not oldpad:square() then
			f:play()
                    screen:blit(68, 34, p)
                    screen.flip()
			Music.volume(128)
          end

          if pad:up() and not oldpad:up() then
			if y == 0 then
                    screen:blit(364, 34, p)
                    screen.flip()
				d:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(329, 34, p)
                    screen.flip()
				db:play()
				Music.volume(128)
			end
          end

          if pad:right() and not oldpad:right() then
			if y == 0 then
				e8v:play()
                    screen:blit(429, 34, p)
                    screen.flip()
				Music.volume(128)
			end
			if y == 1 then
				eb:play()
                    screen:blit(395, 34, p)
                    screen.flip()
				Music.volume(128)
			end
          end

          if pad:down() and not oldpad:down() then
			if y == 0 then
                    screen:blit(264, 34, p)
                    screen.flip()
				b:play()
				Music.volume(128)
			end
			if y == 1 then
                    screen:blit(232, 34, p)
                    screen.flip()
				bb:play()
				Music.volume(128)
			end
          end

         

          if pad:left() and not oldpad:left() then
                    screen:blit(297, 34, p)
                    screen.flip()
			c:play()
			Music.volume(128)

          end

          if pad:l() and not oldpad:l() then
                    screen:blit(138, 218, l)
                    screen.flip()
			ld:play()
			Music.volume(128)
          end

if pad:select() and not oldpad:select() then
screen:save("bassscreenshot.png") 
end 

if  pad:start() then
dofile("script.lua")
end

oldpad = pad
y = 0
end
