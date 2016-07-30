blue = Color.new(0, 50, 175)

white = Color.new(255,255,255)

orange = Color.new(255, 102, 0)

ms = 1

mms = 5

opening = Sound.load("media/openingmain.wav")
bg = Image.load("media/background1.png")


opening:play()
Music.volume(128)
oldpad = Controls.read()


while true do
screen:blit(0, 0, bg, false)

pad = Controls.read()



if pad:up() and oldpad:up() ~= pad:up() then

ms = ms - 1

end


if pad:down() and oldpad:down() ~= pad:down() then

ms = ms + 1

end


if ms > mms then

ms = 0
else
if ms <= 0 then

ms = mms

end



mc = { white,white,white,white,white }

mc[ms] = blue

screen:print(320,25,"Load Acoustic Guitar",mc[1])

screen:print(320,35,"Load Electric Guitar",mc[2])


screen:print(320,45,"Load Bass Guitar",mc[3])


screen:print(320,55,"Load Drums",mc[4])


screen:print(320,65,"Load Keyboard",mc[5])



if pad:cross() and not oldpad:cross() and ms == 1 then

dofile("guitar.lua")

end


if pad:cross() and not oldpad:cross() and ms == 2 then

dofile("electric.lua")

end



if pad:cross() and not oldpad:cross() and ms == 3 then

dofile("bass.lua")

end



if pad:cross() and not oldpad:cross() and ms == 4 then

dofile("drums.lua")

end



if pad:cross() and not oldpad:cross() and ms == 5 then

dofile("keys.lua")

end



if pad:select() and not oldpad:select() then
screen:save("menuscreenshot.png") 
end 

screen.waitVblankStart()
screen.flip()
oldpad = pad

end


end