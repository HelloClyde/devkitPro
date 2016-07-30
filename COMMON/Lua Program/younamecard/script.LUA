-- Your Name Card
-- By KydKong
-- For XiaoShanHighSchool STF.

-- *******main******
System.oaenable()

proinfo = Image.load("proinfo.png")
wordfont = Font.load("Boopee.ttf")
wordfont:setPixelSizes(0, 25)
ter = Timer.new()
strj = ""
backmusic = Sound.load("l.wav",true)
Music.volume(128)
backmusic:play()
ter:start()

--main loop

oldpad = Controls.read()
while true do

--backmusic acviate   

  
--loop start movie
  
  t = ter:time()
  t = math.floor(t/1000)
  if math.mod(t,3) == 0 then
    strj = ""
  elseif math.mod(t,3) == 1 then
    strj = "."
  elseif math.mod(t,3) == 2 then
    strj = ".."
  end

--phate pic

  screen:blit(0,0,proinfo)
  screen:fontPrint(wordfont,160,30, "Please Press Start." ..strj,Color.new(255,255,255))
  screen.flip()

--button controls

  pad = Controls.read()
  if oldpad:start() and pad:start() ~= oldpad:start() then
    break
  end

  screen.waitVblankStart()
  oldpad=pad
end

--delete the value to return memery

proinfo = nil
strj = nil

--next

dofile("main.lua")