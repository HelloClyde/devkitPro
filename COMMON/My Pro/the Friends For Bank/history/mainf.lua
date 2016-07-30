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

function fsmain(image)
  image:clear()
  image:blit(0,0,backpic)
  d=480-bcard100:width()
  image:blit(d*1/8,(272-bcard070:height())/2,bcard070)
  image:blit(d*2/8,(272-bcard080:height())/2,bcard080)
  image:blit(d*3/8,(272-bcard090:height())/2,bcard090)
  image:blit(480-d*4/8,(272-bcard090:height())/2,bcard090)
  image:blit(480-d*3/8,(272-bcard080:height())/2,bcard080)
  image:blit(480-d*2/8,(272-bcard070:height())/2,bcard070)
  image:blit(d/2,0,bcard100)
  
end

cardkind={}
namecard={}
cpuspeed=333
smain=Image.createEmpty(480,272)--ÆÁÄ»´òÓ¡Ò³Ãæ

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
cardkind={}
namecard={}
allkind,allcard=getallnum()

cpuspeed=333
System.setcpuspeed(cpuspeed)

bcard100=Image.load("pic/bcard100.png")
bcard090=Image.load("pic/bcard090.png")
bcard080=Image.load("pic/bcard080.png")
bcard070=Image.load("pic/bcard070.png")

while true do
  fsmain(screen)
  screen.flip()      
  screen.waitVblankStart()
end