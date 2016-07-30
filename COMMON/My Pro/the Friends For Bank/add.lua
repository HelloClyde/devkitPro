function selectfile() 
  oldpad=Controls.read()
  
  oldpath=System.currentDirectory("ms0:/PSP/PHOTO")
  fl=System.listDirectory()
  nf=table.getn(fl)
  currfile=1
  fs=1
  rpath=""
  while true do
    pad=Controls.read()
    screen:blit(0,0,sc)
    screen:blit(0,0,alimage)
    if nf-fs<10 then
      for a=fs,nf do
        screen:fontPrint(font,100,30+(a-fs)*20,fl[a].name,Color.new(255,255,255,255))
      end
    else
      for a=fs,fs+9 do
        screen:fontPrint(font,100,30+(a-fs)*20,fl[a].name,Color.new(255,255,255,255))
      end
    end
    t=timer:time()/100
    drawsquare(screen,60,25+(currfile-1)*20,math.pi*2*t/0.2,16,Color.new(255,255,30,200))
    
    if oldpad:up() and not pad:up() then
      if currfile>1 then
        currfile=currfile-1
      elseif currfile==1 and fs>1 then
        fs=fs-1
      end
    elseif oldpad:down() and not pad:down() then
      if (currfile<nf and currfile<10) then
        currfile=currfile+1
      elseif currfile==10 and fs<nf-9 then
        fs=fs+1
      end
    elseif oldpad:cross() and not pad:cross() then
      rpath=""
      System.currentDirectory(oldpath)
      break
    elseif oldpad:circle() and not pad:circle() then
      if fl[fs+currfile-1].directory == true then
        System.currentDirectory(fl[fs+currfile-1].name)
        fl=System.listDirectory()
        nf=table.getn(fl)
        currfile=1
        fs=1
      else
        if string.lower(string.sub(fl[fs+currfile-1].name, -4)) == ".jpg" or string.lower(string.sub(fl[fs+currfile-1].name, -4)) == ".png" then
          rpath=System.currentDirectory() .."/" ..fl[fs+currfile-1].name
          System.currentDirectory(oldpath)
          break
        end
      end
    end
    screen.flip()      
    screen.waitVblankStart()
    oldpad=pad
  end
  return rpath
end

function selectkind()
  oldpad=Controls.read()
  currtk=currkind
  temkind=cardkind[currtk]
  while true do
    pad=Controls.read()
    screen:blit(0,0,sc)
    screen:blit(0,0,alimage)
    screen:fontPrint(font,100,50,"Kind: " ..temkind,Color.new(150,100,60,255))
    screen:blit(80,100-12,iconspsp,64,0,64,32)
    screen:fontPrint(font,150,100,"To change curr-kind.",Color.new(155,155,255,255))
    screen:blit(80,150-12,iconspsp,32*5,0,32,32)
    screen:fontPrint(font,150,150,"To create new-kind.",Color.new(155,155,255,255))
    if oldpad:left() and not pad:left() and currtk > 1 then
      currtk=currtk-1
      temkind=cardkind[currtk]
    elseif oldpad:right() and not pad:right() and currtk < allkind then
      currtk=currtk+1
      temkind=cardkind[currtk]
    elseif (oldpad:start() and not pad:start()) or (oldpad:circle() and not pad:circle()) then
      break
    elseif oldpad:cross() and not pad:cross() then
      temkind=cardkind[currkind]
      break
    elseif oldpad:triangle() and not pad:triangle() then
      a=inputstr("NewKind",10)
      if a ~= "" then
        temkind=a
      end
    end
    screen.flip()      
    screen.waitVblankStart()
    oldpad=pad
  end
  return temkind
end

function inputstr(text,strlen)
kb_bg = Image.load("pic/kb_bg.png")
kb_overlay = Image.load("pic/kb_overlay.png")
kb_overlayB = Image.load("pic/kb_overlay_B.png")
kb_overlayA = Image.load("pic/kb_overlay_A.png")
kb_highlight = Image.load("pic/kb_highlight.png")

mode=0
select = {}
textInputed = false
while (textInputed == false) do
length = string.len(text) 
oldpad = pad
pad = Controls.read()

dx = pad:analogX()
dy = pad:analogY()

if (dx > 64) then

select.x = 3

if (dy > 64) then
hx=274
hy=198
elseif (dy < -64) then
hx=274
hy=80
else
hx=274
hy=140
end

elseif (dx < -64) then

select.x = 1

if (dy > 64) then
hx=152
hy=200
elseif (dy < -64) then
hx=152
hy=80
else
hx=152
hy=140
end

else

select.x = 2

if (dy > 64) then
hx=213
hy=200
elseif (dy < -64) then
hx=213
hy=80
else
hx=213
hy=140
end

end
if (dy > 64) then
select.y = 3
elseif (dy < -64) then
select.y = 1
else
select.y = 2
end

if (pad ~= oldpad) then

if (mode == 0) then

if (length < strlen) then     --

if (pad:cross()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "b"
end
if (select.y == 2) then
text = text .. "k"
end
if (select.y == 3) then
text = text .. "s"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "e"
end
if (select.y == 2) then
text = text .. " "
end
if (select.y == 3) then
text = text .. "v"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "h"
end
if (select.y == 2) then
text = text .. "p"
end
if (select.y == 3) then
text = text .. "y"
end
end
end

if (pad:square()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "a"
end
if (select.y == 2) then
text = text .. "j"
end
if (select.y == 3) then
text = text .. "r"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "d"
end
if (select.y == 2) then
text = text .. "m"
end
if (select.y == 3) then
text = text .. "u"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "g"
end
if (select.y == 2) then
text = text .. "o"
end
if (select.y == 3) then
text = text .. "x"
end
end
end


if (pad:circle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "c"
end
if (select.y == 2) then
text = text .. "l"
end
if (select.y == 3) then
text = text .. "t"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "f"
end
if (select.y == 2) then
text = text .. "n"
end
if (select.y == 3) then
text = text .. "w"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "i"
end
if (select.y == 2) then
text = text .. "q"
end
if (select.y == 3) then
text = text .. "z"
end
end
end

if (pad:triangle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. ","
end
if (select.y == 2) then
text = text .. "-"
end
if (select.y == 3) then
text = text .. "("
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "."
end
if (select.y == 2) then
text=string.sub(text, 1,length-1)
end
if (select.y == 3) then
text = text .. ":"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "!"
end
if (select.y == 2) then
text = text .. "?"
end
if (select.y == 3) then
text = text .. ")"
end
end
end
else
  if (select.x == 2) and (select.y == 2) and (pad:triangle()) then
    text=string.sub(text, 1,length-1)
  end
end
elseif mode == 2 then

if (length < strlen) then     --

if (pad:cross()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "B"
end
if (select.y == 2) then
text = text .. "K"
end
if (select.y == 3) then
text = text .. "T"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "E"
end
if (select.y == 2) then
text = text .. "N"
end
if (select.y == 3) then
text = text .. "W"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "H"
end
if (select.y == 2) then
text = text .. "Q"
end
if (select.y == 3) then
text = text .. "Z"
end
end
end

if (pad:square()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "A"
end
if (select.y == 2) then
text = text .. "J"
end
if (select.y == 3) then
text = text .. "S"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "D"
end
if (select.y == 2) then
text = text .. "M"
end
if (select.y == 3) then
text = text .. "V"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "G"
end
if (select.y == 2) then
text = text .. "P"
end
if (select.y == 3) then
text = text .. "Y"
end
end
end


if (pad:circle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "C"
end
if (select.y == 2) then
text = text .. "L"
end
if (select.y == 3) then
text = text .. "U"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "F"
end
if (select.y == 2) then
text = text .. "O"
end
if (select.y == 3) then
text = text .. "X"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "I"
end
if (select.y == 2) then
text = text .. "R"
end
if (select.y == 3) then
text = text .. ""
end
end
end
end
else
if (length < strlen) then     --

if (pad:circle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "1"
end
if (select.y == 2) then
text = text .. "4"
end
if (select.y == 3) then
text = text .. "7"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "2"
end
if (select.y == 2) then
text = text .. "5"
end
if (select.y == 3) then
text = text .. "8"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "3"
end
if (select.y == 2) then
text = text .. "6"
end
if (select.y == 3) then
text = text .. "9"
end
end
end

if (pad:cross()) then

if (select.x == 1) then
if (select.y == 1) then
end
if (select.y == 2) then
end
if (select.y == 3) then
end
end
if (select.x == 2) then
if (select.y == 1) then
end
if (select.y == 2) then
text = text .. " "
end
if (select.y == 3) then
end
end
if (select.x == 3) then
if (select.y == 1) then
end
if (select.y == 2) then
end
if (select.y == 3) then
text = text .. "0"
end
end
end
end

end

if (pad:r()) then
if (mode == 1)then
mode = 0
else
mode = 1
end
end
if (pad:l()) then
if (mode == 2)then
mode = 0
else
mode = 2
end
end

if pad:right() then text = text.."/" end

if (pad:start()) then
textInputed = true
end

end
screen:blit(0, 0, kb_bg)
screen:blit(hx, hy, kb_highlight)
if (mode == 1)then
screen:blit(0, 0, kb_overlayB)
elseif (mode == 2) then
screen:blit(0, 0, kb_overlayA)
else
screen:blit(0, 0, kb_overlay)
end
screen:fontPrint(font,50,50, text,Color.new(0,0,0))
screen.flip()
screen.waitVblankStart()
screen:clear()

end
return text
end


temkind=cardkind[currkind]
temname=""
temimage=""
temnote=""
curr=1
oldpad=Controls.read()
while true do
  pad=Controls.read()
  screen:blit(0,0,sc)
  screen:blit(0,0,alimage)
  screen:fontPrint(font,100,50,"Kind: " ..temkind,Color.new(150,100,60,255))
  screen:fontPrint(font,100,100,"Name: " ..temname,Color.new(150,100,60,255))
  screen:fontPrint(font,100,150,"Photo Pattern: " ..temimage,Color.new(150,100,60,255))
  if string.len(temnote) > 10 then
    screen:fontPrint(font,100,200,"Note: " ..string.sub(temnote,1,10) .."...",Color.new(150,100,60,255))
  else
    screen:fontPrint(font,100,200,"Note: " ..temnote,Color.new(150,100,60,255))
  end
  t=timer:time()/100
  drawsquare(screen,80,50*curr,math.pi*2*t/0.2,20,Color.new(255,255,30,200))
  if oldpad:cross() and not pad:cross() then
    break
  elseif oldpad:circle() and not pad:circle() then
    if curr==1 then
      temkind=selectkind()
    elseif curr==2 then
      temname=inputstr(temname,15)
    elseif curr==3 then
      temimage=selectfile()
    elseif curr==4 then
      temnote=inputstr(temnote,170)
    end
  elseif not oldpad:up() and pad:up() then
    if curr==1 then
      curr=4
    else
      curr=curr-1
    end
  elseif not oldpad:down() and pad:down() then
    if curr==4 then
      curr=1
    else
      curr=curr+1
    end
  end
  screen.flip()      
  screen.waitVblankStart()
  oldpad=pad
end