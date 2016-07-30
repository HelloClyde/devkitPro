function notegetstring()
  for a = 1,5 do
    str[a] = nil
    str[a] = ""
  end
  text.length = string.len(namecard[namecardshowstart + namecardselect.index - 1].note)
  start = 1
  for b = 1,4 do
    if start <= text.length then
      for a = start,text.length do
        text.word = nil
        text.word = string.sub(namecard[namecardshowstart + namecardselect.index - 1].note,start,a)
        text.width,text.height = wordfont:getTextSize(text.word).width , wordfont:getTextSize(text.word).height
        if text.width >= (note.x2 - note.x1) or a == text.length then
          str[b] = text.word
          if a < text.length and b == 4 then
            str[5] = "..."
          end
          start = a + 1
          break
        end
      end
    end  
  end
end

function menumain()
  menu.select = 1
  oldpad = Controls.read()   
  while true do
    screen:blit(480-menu.pic:width(),272-menu.pic:height(),menu.pic)
    pad = Controls.read()
    if oldpad:up() and pad:up() ~= oldpad:up() then
      Music.volume(128)
      keysound:play()
      if menu.select > 1 then
        menu.select = menu.select - 1
      else
        menu.select = 6
      end
    end
    if oldpad:down() and pad:down() ~= oldpad:down() then
      Music.volume(128)
      keysound:play()
      if menu.select < 6 then
        menu.select = menu.select + 1
      else
        menu.select = 1
      end
    end
    if oldpad:circle() and pad:circle() ~= oldpad:circle() then
      if menu.select == 1 then
        dofile("add.lua")
      elseif menu.select == 2 then
        dofile("modify.lua")
      elseif menu.select == 3 then
        dofile("delete.lua")
      elseif menu.select == 4 then
        dofile("option.lua")
      elseif menu.select == 5 then
        System.Quit()
      else
        break
      end
    end
    if (oldpad:start() and pad:start() ~= oldpad:start()) or (oldpad:cross() and pad:cross() ~= oldpad:cross()) then
      break
    end
    t = math.floor(ter:time()/300)
    if math.mod(t,4) == 0 then menu.selectpic = menu.selectpic1 end
    if math.mod(t,4) == 1 then menu.selectpic = menu.selectpic2 end    
    if math.mod(t,4) == 2 then menu.selectpic = menu.selectpic3 end
    if math.mod(t,4) == 3 then menu.selectpic = menu.selectpic4 end
    screen:blit(480-menu.pic:width()+30,272-menu.pic:height()+22+(menu.select-1)*16,menu.selectpic)
    screen.flip()
    oldpad = pad
  end
end

function isexistrecord()
  flist = System.listDirectory()
  fileexist = false
  for idx, file in ipairs(flist) do
    if file.name ~= "." and file.name ~= ".." then
      if string.lower(file.name) == "record.dat" then
        fileexist = true
      end
    end
  end
  return fileexist
end

function getnamecardnum()
  a = 1
  while namecard[a] ~= nil do
    a = a + 1
  end
  return a-1
end

function getheight()
  rollstick.height = math.floor(6*180/namecardnum)
  if rollstick.height > 180 then rollstick.height = 180 end
  if rollstick.height < rollstick.picfront:height() then rollstick.height = rollstick.picfront:height() end
end

function gethy()
  rollstick.hy =math.floor((namecardshowstart+namecardselect.index-2)*(180-rollstick.height)/(namecardnum-1)+rollstick.y)
end

function showloading()
  screen:blit(120,111,loading)
  screen.flip()
end

namecard = {}
keysound = Sound.load("bass.wav", false)
backpic = Image.load("backpic.png")
namecardselect = { x = 22 ,index = 1,pic = Image.load("select.png")}
rollstick = { picback = Image.load("rollback.png"),picfront = Image.load("rollfront.png"),x = 126,y = 49,height = nil,hy = nil}
gun = { x = 280,y = 70,pic = Image.load("gun.png"),sound = Sound.load("gun.wav",false),warn = Image.load("relationwarn.png")}
note = { x = 170,y = 175,x1 = 170 , y1 = 175 ,x2 =460 ,y2 =245 }
text = { width = 25 ,height = 25,length = 0,word = ""}
menu = { pic = Image.load("menu.png") , select = 1 , selectpic1 = Image.load("1.png") , selectpic2 = Image.load("2.png") , selectpic3 = Image.load("3.png") , selectpic4 = Image.load("4.png"),selectpic = nil}
str = { "" , "" , "" , "" , "" }
loading = Image.load("loading.png")
cpuspeed = 333
namecardshowstart = 1

if isexistrecord() then
    dofile("record.dat")
else
  System.message('No found "record.dat",Start to create it .',0)
  file = io.open("record.dat","w")
  file:write("\n")
  file:close()
end

System.setcpuspeed(cpuspeed)
namecardnum = getnamecardnum()
getheight()
gethy()
loadnow = true
loadnum = 1
showloading()
notegetstring()
oldpad = Controls.read()
while true do
  pad = Controls.read()
  if  oldpad:up() and not pad:up() then
    if namecardselect.index ~= 1 then
      namecardselect.index = namecardselect.index - 1 
      showloading()
      notegetstring()
      loadnow = true
      loadnum = 1
    else
      if namecardshowstart ~= 1 then
        namecardshowstart = namecardshowstart - 1
        showloading()
        notegetstring()
        loadnow = true
        loadnum = 1
      end
    end
    getheight()
    gethy()
    Music.volume(128)
    keysound:play()
  end
  if oldpad:down() and not pad:down() then
    if namecard[namecardselect.index + namecardshowstart] ~= nil then
      if namecardselect.index == 6 then
        namecardshowstart = namecardshowstart + 1
        showloading()
        notegetstring()
      else
        namecardselect.index = namecardselect.index + 1
        showloading()
        notegetstring()
      end
      loadnow = true
      loadnum = 1
      getheight()
      gethy()
    end
    Music.volume(128)
    keysound:play()
  end
  screen:blit(0,0,backpic)
  screen:blit(namecardselect.x,(namecardselect.index - 1)*30 + 47,namecardselect.pic,0,0,namecardselect.pic:width(),namecardselect.pic:height(),true)
  wordprinty = 70
  for a = namecardshowstart,namecardshowstart + 5 do
    if namecard[a] ~= nil then
     screen:fontPrint(wordfont,30,wordprinty,namecard[a].name,Color.new(255,255,255))
    end
    wordprinty = wordprinty + 30
  end
  if loadnow and namecard[namecardshowstart + namecardselect.index - 1].relation ~= 0 then
    for a = 1,loadnum do
      screen:blit(gun.x,gun.y,gun.pic)
      gun.x = gun.x + 30
    end
    gun.x = 280
    loadnum = loadnum + 1
    Music.volume(32)
    gun.sound:play()
    t = ter:time()
    while ter:time() <= t + 100 do
    end
    if loadnum == namecard[namecardshowstart + namecardselect.index - 1].relation + 1 then
      loadnow = false
      loadnum = 1
    end
  else
    if namecard[namecardshowstart + namecardselect.index - 1].relation == 0 then
      screen:blit(280,70,gun.warn)
    else
      for a = 1 ,namecard[namecardshowstart + namecardselect.index - 1].relation do
        screen:blit(gun.x,gun.y,gun.pic)
        gun.x = gun.x + 30
      end
      gun.x = 280
    end
  end
  screen:blit(rollstick.x,rollstick.y,rollstick.picback)
  for b = rollstick.hy,rollstick.hy+rollstick.height-rollstick.picfront:height() do
    screen:blit(rollstick.x+1,b,rollstick.picfront)
  end
  for y = 1,5 do
    screen:fontPrint(wordfont,note.x1,note.y1 + (y - 1) * 22,str[y],Color.new(255,155,60))
  end
  if oldpad:start() and not pad:start() then
    menumain()
  end
  screen.flip()
  screen.waitVblankStart()
  oldpad = pad
end