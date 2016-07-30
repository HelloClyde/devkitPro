function quit()  
  System.Quit()
end
function config()
end
function help()
end
function resume()
end
function delete()
end
function isexistrecord(flist,name)
  fileexist = false
  for idx, file in ipairs(flist) do
    if file.name ~= "." and file.name ~= ".." then
      if string.lower(file.name) == string.lower(name) then
        fileexist = true
      end
    end
  end
  return fileexist
end
--[[
]]--
function getfilelist()
fl=System.listDirectory()
nf=table.getn(fl)
t=1
f2={}
for a=1,nf do
  if fl[a].name~="." and fl[a].name~=".." and string.sub(fl[a].name,1,1)~="%" and string.sub(fl[a].name,-1)~="%" and fl[a].directory == true then
    f2[t]=fl[a]
    t=t+1
  end
end
fl=f2
end
--[[
]]--
function doready()
      oldpath=System.currentDirectory("ms0:/PSP/GAME150")
      dir="ms0:/PSP/GAME150/"
      fna=fl[fs+currfile-1].name .."%"
      if isexistrecord(System.listDirectory(),fna)==false then
        fna="%" ..fl[fs+currfile-1].name
        a=dir ..fna .."/EBOOT.PBP"
      else
        a=dir ..fna .."/EBOOT.PBP"
      end
      pic1=nil
      pic2=nil
      pic1,pic2=loadebootimage(a)
      a=dir ..fl[fs+currfile-1].name .."/EBOOT.PBP"
      al=Image.createEmpty(480,272)
      al:clear(Color.new(0,0,0,100))
      screen:blit(0,0,al)
      if pic2 then
        screen:blit(0,0,pic2)
      end
      if pic1 then
        screen:blit(22,96,pic1)
      end
      screen:fillRect(46,210,310,14,Color.new(255,255,255,100))
      screen:fontPrint(System_Font,50,220,"Circle to continue,Cross to return",Color.new(0,0,0))
      screen.flip()
      oldpad=Controls.read()
      while true do
        pad=Controls.read()
        screen.waitVblankStart()
        if oldpad:cross() and not pad:cross() then
          break
        end
        if pad:circle()==false and oldpad:circle()==true then
          dofile("ms0:/psp/game/150loader/next.txt")
        end
        oldpad=pad
      end
end
--[[
]]--
logo=Image.load("Img/bg.png")
curi=Image.load("Img/curse.png")
p_pic=Image.load("Img/pbp.png")
System_Font=Font.load("font.ttf")
System_Font:setPixelSizes(0,40)
logo:fontPrint(System_Font,20,80,"150loader  Ver 1.0",Color.new(0,0,0))
System_Font:setPixelSizes(0,30)
logo:fontPrint(System_Font,20,130,"Author:",Color.new(0,0,0)) 
System_Font:setPixelSizes(0,25)
logo:fontPrint(System_Font,40,170,"Kyd Kela,THEDemoliretor,Notonlyeyes",Color.new(0,0,0)) 
System_Font:setPixelSizes(0,20)
logo:fontPrint(System_Font,50,220,"Circle to continue,Cross to escape",Color.new(0,0,40))

oldpad=Controls.read()
while true do
  pad=Controls.read()
  screen:blit(0,0,logo)
  screen.flip()
  screen.waitVblankStart()
  if pad:cross()==false and oldpad:cross()==true then
    quit()
  end
  if pad:circle()==false and oldpad:circle()==true then
    break
  end
  oldpad=pad
end
dofile("ebootimage.lua")
log=Image.load("Img/bg.png")
log:blit(0,0,Image.load("img/cbar.png"))
line=Image.load("Img/line.png")
log:blit(80,251,Image.load("Img/dbar.png"))
System_Font=Font.load("2.ttf")
System_Font:setPixelSizes(0,20)
log:fontPrint(System_Font,70,10,"   150 Loader V1.0        By Kyd",Color.new(60,60,60))
oldpath=System.currentDirectory("ms0:/PSP/GAME150")
getfilelist()
nf=table.getn(fl)
currfile=1
fs=1
  oldpad=Controls.read()
  timer=Timer.new()
  timer:start()
  while true do
    pad=Controls.read()
    screen:clear()
    screen:blit(0,0,log)
    if nf-fs<7 then
      for a=fs,nf do
        screen:blit(55,23+(a-fs)*30,p_pic)
        screen:blit(15,43+(a-fs)*30,line)
        screen:fontPrint(System_Font,90,40+(a-fs)*30,fl[a].name,Color.new(0,0,0))
      end
    else
      for a=fs,fs+6 do
        screen:blit(55,23+(a-fs)*30,p_pic)
        screen:blit(15,43+(a-fs)*30,line)
        screen:fontPrint(System_Font,90,40+(a-fs)*30,fl[a].name,Color.new(0,0,0))
      end
    end
    screen:blit(20,20+(currfile-1)*30,curi,math.mod(math.floor(timer:time()/100),8)*25,0,25,25)
    if oldpad:up() and not pad:up() then
      if currfile>1 then
        currfile=currfile-1
      elseif currfile==1 and fs>1 then
        fs=fs-1
      end
    elseif oldpad:down() and not pad:down() then
      if (currfile<nf and currfile<7) then
        currfile=currfile+1
      elseif currfile==7 and fs<nf-6 then
        fs=fs+1
      end
    elseif oldpad:circle() and not pad:circle() then
      doready()
    elseif oldpad:square() and not pad:square() then
      config()
    elseif oldpad:triangle() and not pad:triangle() then
      help()
    elseif oldpad:cross() and not pad:cross() then
      resume()
    elseif oldpad:select() and not pad:select() then
      delete()
    end
    oldpad=pad
    screen.flip()      
    screen.waitVblankStart()     
end