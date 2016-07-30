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
crash = Sound.load("media/drums/crash.wav")
hi = Sound.load("media/drums/hi.wav")
bass = Sound.load("media/drums/bass.wav")

l = Image.load("media/left_trigger.png")
snare = Sound.load("media/drums/snare.wav")

background = Image.load("media/background5.png")
li = Image.load("media/drums/l.png")
oi = Image.load("media/drums/o.png")
ri = Image.load("media/drums/r.png")
open = Image.load("media/drums.png")

screen:clear()
screen:print(185, 136, "Loading: 40%", orange)
screen.flip()

si = Image.load("media/drums/s.png")
ti = Image.load("media/drums/t.png")
xi = Image.load("media/drums/x.png")
tom1 = Sound.load("media/drums/tom1.wav")
tom2 = Sound.load("media/drums/tom2.wav")
opening = Sound.load("media/opening4.wav")

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



	  if pad:cross() and not oldpad:cross() then
			screen:blit(204, 189, xi)
			screen.flip()
			bass:play()
			Music.volume(128)
			
	  end
 		if pad:circle() and not oldpad:circle() then
			screen:blit(176, 86, oi)
			screen.flip()
				tom2:play()
				Music.volume(128)
			
          end

          if pad:triangle() and not oldpad:triangle() then
			screen:blit(270, 40, ti)
			screen.flip()
				tom1:play()
				Music.volume(128)
          end

          if pad:square() and not oldpad:square() then
			screen:blit(317, 100, si)
			screen.flip()
			snare:play()
			Music.volume(128)
          end

          if pad:up() and not oldpad:up() then
			screen:blit(270, 40, ti)
			screen.flip()
				tom1:play()
				Music.volume(128)
          end

          if pad:right() and not oldpad:right() then
			screen:blit(176, 86, oi)
			screen.flip()
				tom2:play()
				Music.volume(128)
          end

          if pad:down() and not oldpad:down() then
			screen:blit(204, 189, xi)
			screen.flip()
				bass:play()
				Music.volume(128)
          end

         

          if pad:left() and not oldpad:left() then
			screen:blit(317, 100, si)
			screen.flip()
			snare:play()
			Music.volume(128)
          end


          if pad:r() and not oldpad:r() then
			screen:blit(337, 28, ri)
			screen.flip()
			hi:play()
			Music.volume(128)
	end

          if pad:l() and not oldpad:l() then
			screen:blit(50, 28, li)
			screen.flip()
			crash:play()
			Music.volume(128)
	end


if pad:select() and not oldpad:select() then
screen:save("drumsscreenshot.png") 
end 

if  pad:start() then
dofile("script.lua")
end

oldpad = pad
end
