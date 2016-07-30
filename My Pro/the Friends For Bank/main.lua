function updatenum(curr)
  c=1
  while namecard[cardkind[curr]][c] ~= nil do
    c=c+1
  end
  return c-1
end

function recordsave()
  file = io.open("record.dat", "w")
  assert(file);

  file:write("--[Top]Kyd\n");
  file:write("--the Word of friend\n");

  file:write("cardkind={\n");
  for i, v in pairs(cardkind) do
    file:write('"' ..v ..'",\n');
  end
  file:write('}\n');

  file:write('namecard={}\n');
  for a=1,allkind do
    file:write('namecard[cardkind[' ..a ..']]={}\n');
  end

  for a=1,allkind do
    n=updatenum(a)
    for b=1,n do
      file:write('namecard[cardkind[' ..a ..']][' ..b ..']={name="' ..namecard[cardkind[a]][b].name ..'",relation=' ..namecard[cardkind[a]][b].relation ..',note="' ..namecard[cardkind[a]][b].note ..'",image="' ..namecard[cardkind[a]][b].image ..'"}\n');
    end
  end
  file:write('\n');
  file:close()
  System.message('Record has saved!',0)
end

function turnlr(image)
  picy=-256--Í¼Æ¬¸ß
  t=timer:time()/100
  cardnum=1
  while picy<0 or cardnum<6 do
    image:blit(0,0,backpic)
    if timer:time()/100>=t+1 and cardnum<8 then
      t=timer:time()/100
      cardnum=cardnum+1
    end

    if cardnum>0 then
      screen:blit(9,45,cardal050)
      image:blit(61+cardpic:width()-cardal050:width(),45,cardal050)
    end
    if cardnum>1 then
      screen:blit(12,40,cardal100)
      image:blit(58+cardpic:width()-cardal100:width(),40,cardal100)
    end
    if cardnum>2 then
      screen:blit(17,35,cardal150)
      image:blit(53+cardpic:width()-cardal150:width(),35,cardal150)
    end
    if cardnum>3 then
      screen:blit(25,30,cardal200)
      image:blit(45+cardpic:width()-cardal200:width(),30,cardal200)
    end
    if cardnum>4 then
      screen:blit(35,25,cardpic)
    end
    screen:blit(60,0,numpic)
    if currkind>1 then
      image:blit(8,0,iconspsp,192,32,64,32)
    end
    if currkind<allkind then
      image:blit(170,0,iconspsp,256,32,64,32)
    end
    
    if picy<0 then
      picy=picy+8
    end    
    screen:blit(235,picy+5,taskal)--»­ÒõÓ°
    screen:blit(230,picy,taskpic)

    screen.flip()
    screen.waitVblankStart()
  end
end

function turnleft(image)
  picy=-256--Í¼Æ¬¸ß
  woodmusic:play()
  cardnum=1
  t=timer:time()/100
  while picy<0 or cardnum<8 do
    image:blit(0,0,backpic)
    if timer:time()/100>=t+1 and cardnum<8 then
      t=timer:time()/100
      cardnum=cardnum+1
    end

    if cardnum>0 then
      screen:blit(9,45,cardal050)
    end
    if cardnum>1 then
    screen:blit(12,40,cardal100)
    end
    if cardnum>2 then
    screen:blit(17,35,cardal150)
    end
    if cardnum>3 then
    screen:blit(25,30,cardal200)
    end
    if cardnum>7 then
      image:blit(61+cardpic:width()-cardal050:width(),45,cardal050)
    end
    if cardnum>6 then
      image:blit(58+cardpic:width()-cardal100:width(),40,cardal100)
    end
    if cardnum>5 then
      image:blit(53+cardpic:width()-cardal150:width(),35,cardal150)
    end
    if cardnum>4 then
      image:blit(45+cardpic:width()-cardal200:width(),30,cardal200)
    end
    screen:blit(35,25,cardpic)
    screen:blit(60,0,numpic)
    if currkind>1 then
      image:blit(8,0,iconspsp,192,32,64,32)
    end
    if currkind<allkind then
      image:blit(170,0,iconspsp,256,32,64,32)
    end
    --ÖÖÀà
    font:setPixelSizes(0,16)
    wh=font:getTextSize(cardkind[currkind])
    image:fontPrint(font,60+math.abs((numpic:width()-wh.width)/2),15,cardkind[currkind],Color.new(255,255,255,255))

    if picy<0 then
      picy=picy+8
    end    
    screen:blit(235,picy+5,taskal)--»­ÒõÓ°
    screen:blit(230,picy,taskpic)

    screen.flip()
    screen.waitVblankStart()
  end
end

function turnright(image)
  picy=-256--Í¼Æ¬¸ß
  woodmusic:play()
  cardnum=1
  t=timer:time()/100
  while picy<0 or cardnum<8 do
    image:blit(0,0,backpic)
    if timer:time()/100>=t+1 and cardnum<8 then
      t=timer:time()/100
      cardnum=cardnum+1
    end

    if cardnum>7 then
      screen:blit(9,45,cardal050)
    end
    if cardnum>6 then
    screen:blit(12,40,cardal100)
    end
    if cardnum>5 then
    screen:blit(17,35,cardal150)
    end
    if cardnum>4 then
    screen:blit(25,30,cardal200)
    end
    if cardnum>0 then
      image:blit(61+cardpic:width()-cardal050:width(),45,cardal050)
    end
    if cardnum>1 then
      image:blit(58+cardpic:width()-cardal100:width(),40,cardal100)
    end
    if cardnum>2 then
      image:blit(53+cardpic:width()-cardal150:width(),35,cardal150)
    end
    if cardnum>3 then
      image:blit(45+cardpic:width()-cardal200:width(),30,cardal200)
    end
    screen:blit(35,25,cardpic)
    screen:blit(60,0,numpic)
    if currkind>1 then
      image:blit(8,0,iconspsp,192,32,64,32)
    end
    if currkind<allkind then
      image:blit(170,0,iconspsp,256,32,64,32)
    end
    --ÖÖÀà
    font:setPixelSizes(0,16)
    wh=font:getTextSize(cardkind[currkind])
    image:fontPrint(font,60+math.abs((numpic:width()-wh.width)/2),15,cardkind[currkind],Color.new(255,255,255,255))

    if picy<0 then
      picy=picy+8
    end    
    screen:blit(235,picy+5,taskal)--»­ÒõÓ°
    screen:blit(230,picy,taskpic)
    
    screen.flip()
    screen.waitVblankStart()
  end
end

function isexistrecord(flist,name)
  fileexist = false
  for idx, file in ipairs(flist) do
    if file.name ~= "." and file.name ~= ".." then
      if string.lower(file.name) == name then
        fileexist = true
      end
    end
  end
  return fileexist
end

function movein()
  fscreen(sc)
  showsq(sc)
  alcolor=255
  while true do
    screen:blit(0,0,sc)
    alimage:clear(Color.new(0,255,0,alcolor))
    screen:blit(0,0,alimage)
    if alcolor>=10 then 
      alcolor=alcolor-10
    else
      break
    end
    screen.flip()
    screen.waitVblankStart()
  end
end

function getallnum()
  a=1
  while cardkind[a] ~= nil do
    a=a+1
  end
  b=1

  while namecard[cardkind[currkind]][b] ~= nil do
    b=b+1
  end
  return a-1,b-1
end

function fscreen(image)
  image:blit(0,0,backpic)
  --¿¨Æ¬Í¸Ã÷
  image:blit(9,45,cardal050)
  image:blit(12,40,cardal100)
  image:blit(17,35,cardal150)
  image:blit(25,30,cardal200)
  image:blit(61+cardpic:width()-cardal050:width(),45,cardal050)
  image:blit(58+cardpic:width()-cardal100:width(),40,cardal100)
  image:blit(53+cardpic:width()-cardal150:width(),35,cardal150)
  image:blit(45+cardpic:width()-cardal200:width(),30,cardal200)
  image:blit(35,25,cardpic)
  --Êý×ÖÅÆ
  image:blit(60,0,numpic)
  if currkind>1 then
    image:blit(8,0,iconspsp,192,32,64,32)
  end
  if currkind<allkind then
    image:blit(170,0,iconspsp,256,32,64,32)
  end
  --½éÉÜ°å
  image:blit(235,5,taskal)--»­ÒõÓ°
  image:blit(230,0,taskpic)

  --´òÓ¡Ò³Âë
  font:setPixelSizes(0,12)
  image:fontPrint(font,172,258,currcard .."/" ..allcard,Color.new(60,40,10,255))
  --ÖÖÀà
  font:setPixelSizes(0,16)
  wh=font:getTextSize(cardkind[currkind])
  image:fontPrint(font,60+math.abs((numpic:width()-wh.width)/2),15,cardkind[currkind],Color.new(255,255,255,255))
  --Ãû³Æ
  font:setPixelSizes(0,12)
  image:fontPrint(font,46,43,namecard[cardkind[currkind]][currcard].name,Color.new(200,100,60,255))


  --´òÓ¡note
  font:setPixelSizes(0,16)
  start=1
  enter=0
  while true do
    notestr=string.sub(namecard[cardkind[currkind]][currcard].note,start,start+16)
    if notestr~="" and enter<=9 then
      image:fontPrint(font,270,60+18*enter,notestr,Color.new(200,100,60,255))
      start=start+17
      enter=enter+1
    else
      break
    end
  end

  --ÌùÕÕÆ¬
  if namecard[cardkind[currkind]][currcard].image~="" then
    face=Image.load(System.currentDirectory() .."/cardimage/" ..namecard[cardkind[currkind]][currcard].image)
  end
  image:blit(35+11,25+53,face)
  
end  

function condo()
  if oldpad:l() and not pad:l() and currkind>1 then
    currkind=currkind-1
    currcard=1
    allkind,allcard=getallnum()
    turnlr(screen)
    fscreen(sc)
  elseif oldpad:r() and not pad:r() and currkind<allkind then
    currkind=currkind+1
    currcard=1
    allkind,allcard=getallnum()
    turnlr(screen)
    fscreen(sc)
  elseif oldpad:left() and not pad:left() and currcard>1 then
    currcard=currcard-1
    turnleft(screen)
    fscreen(sc)
  elseif oldpad:right() and not pad:right() and currcard<allcard then
    currcard=currcard+1
    turnright(screen)
    fscreen(sc)
  elseif oldpad:start() and not pad:start() then
    showmenu()
    fscreen(sc)
  end
end

function showmenu()
  alimage:clear(Color.new(0,0,0,160))
  font:setPixelSizes(0,20)
  currmenu=1
  showsq(sc)
  
  oldpad=Controls.read()
  while true do
    pad=Controls.read()
    screen:blit(0,0,sc)
    screen:blit(0,0,alimage)
    for index=1,6 do
      screen:fontPrint(font,(480-font:getTextSize(menu[index].str).width)/2,menu[index].y,menu[index].str,Color.new(150,100,60,255))
    end

    t=timer:time()/100
    drawsquare(screen,((480-font:getTextSize(menu[currmenu].str).width)/2)-30,menu[currmenu].y,math.pi*2*t/0.2,20,Color.new(255,255,30,200))
    drawsquare(screen,((480-font:getTextSize(menu[currmenu].str).width)/2)+font:getTextSize(menu[currmenu].str).width+30,menu[currmenu].y,math.pi*2*t/-0.2,20,Color.new(255,255,30,200))
    
    if (oldpad:start() and not pad:start()) or (oldpad:cross() and not pad:cross()) then
      break
    elseif pad:up() and not oldpad:up() then
      if currmenu==1 then
        currmenu=6
      else
        currmenu=currmenu-1
      end
    elseif pad:down() and not oldpad:down() then
      if currmenu==6 then
        currmenu=1
      else
        currmenu=currmenu+1
      end
    elseif oldpad:circle() and not pad:circle() then
      if currmenu==1 then
        dofile("add.lua")
      elseif currmenu==2 then
        dofile("modify.lua")
      elseif currmenu==3 then
        dofile("delete.lua")
      elseif currmenu==4 then
        dofile("option.lua")
      elseif currmenu==5 then
        System.Quit()
      elseif currmenu==6 then
        break
      end
    end

    screen.flip()      
    screen.waitVblankStart()
    oldpad=pad
  end
end

function showsq(image)
  t=timer:time()/100
  for index=1,6 do
    if index<=namecard[cardkind[currkind]][currcard].relation then
      drawsquare(image,sq[index].x,sq[index].y,math.pi*2*t/sq[index].T,sq[index].a,sq[index].color)
    end
  end
end

backpic=Image.load("pic/backpic.png")
woodmusic = Sound.load("sound/artifact.wav",false)    
numpic=Image.load("pic/num.png")
taskpic=Image.load("pic/taskboard.png")
taskal=Image.load("pic/task.png")
cardpic=Image.load("pic/cardpic.png")
cardal050=Image.load("pic/60x50.png")
cardal100=Image.load("pic/70x100.png")
cardal150=Image.load("pic/80x150.png")
cardal200=Image.load("pic/90x200.png")
iconspsp=Image.load("pic/iconspsp.png")
face=Image.load("pic/face.png")
sc=Image.createEmpty(480,272)--ÆÁÄ»´òÓ¡Ò³Ãæ

cardkind={}
namecard={}
cpuspeed=333

System.setcpuspeed(cpuspeed)

if isexistrecord(System.listDirectory(),"record.dat") then
    dofile("record.dat")
else
  System.message('No found "record.dat",Start to create it .',0)
  file = io.open("record.dat","w")
  file:write("\n")
  file:close()
end

currcard=1
currkind=1

allkind,allcard=getallnum()

sq[1]={x=56,y=61,a=12,T=-0.2,color=Color.new(255,0,0)}
sq[2]={x=81,y=61,a=12,T=0.2,color=Color.new(255,0,255)}
sq[3]={x=106,y=61,a=12,T=0.2,color=Color.new(255,255,0)}
sq[4]={x=131,y=61,a=12,T=0.2,color=Color.new(0,255,255)}
sq[5]={x=156,y=61,a=12,T=-0.2,color=Color.new(0,0,255)}
sq[6]={x=181,y=61,a=12,T=-0.2,color=Color.new(0,255,0)}

menu={}
menu[1]={str="Add",y=40}
menu[2]={str="Modify",y=80}
menu[3]={str="Delete",y=120}
menu[4]={str="Option",y=160}
menu[5]={str="Quit",y=200}
menu[6]={str="Cancel",y=240}


movein()

fscreen(sc)

oldpad=Controls.read()

while true do
  pad=Controls.read()
  condo()
  oldpad=pad
  
  screen:blit(0,0,sc)
  showsq(screen)
    
  screen.flip()      
  screen.waitVblankStart()
end