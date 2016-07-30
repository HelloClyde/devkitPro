System.setHigh()
font = Font.load("ms0:/psp/game/NINJA/qwe.ttf")
font:setPixelSizes(40,40)
font2 = Font.load("ms0:/psp/game/NINJA/qwe.ttf")
font2:setPixelSizes(11,14)
Mp3me.stop()
System.currentDirectory("ms0:/psp/game/NINJA/music")
Mp3me.load("1.mp3")
Mp3me.play()
zapizdonsa=0
fon=Image.load("ms0:/psp/game/NINJA/images/1.png")
nintendo=Image.load("ms0:/psp/game/NINJA/images/nintendo.png")
nintendobum=Image.load("ms0:/psp/game/NINJA/images/nintendobum.png")
nintendo2=Image.load("ms0:/psp/game/NINJA/images/nintendo2.png")
nintendobum2=Image.load("ms0:/psp/game/NINJA/images/nintendobum2.png")
pod=Image.load("ms0:/psp/game/NINJA/images/pod.png")
podbum=Image.load("ms0:/psp/game/NINJA/images/podbum.png")
starie=Image.load("ms0:/psp/game/NINJA/images/starie.png")
stariebum=Image.load("ms0:/psp/game/NINJA/images/stariebum.png")
psp=Image.load("ms0:/psp/game/NINJA/images/psp.png")
pspbum=Image.load("ms0:/psp/game/NINJA/images/pspbum.png")
pspbum2=Image.load("ms0:/psp/game/NINJA/images/pspbum2.png")
pspbum3=Image.load("ms0:/psp/game/NINJA/images/pspbum3.png")
pspbum4=Image.load("ms0:/psp/game/NINJA/images/pspbum4.png")
cel=Image.load("ms0:/psp/game/NINJA/images/cel.png")
vxod1= Image.load("ms0:/psp/game/NINJA/images/vxod1.png")
vxod2= Image.load("ms0:/psp/game/NINJA/images/vxod2.png")
vxod3= Image.load("ms0:/psp/game/NINJA/images/vxod3.png")
xxx0= Image.load("ms0:/psp/game/NINJA/images/xxx.png")
xxx1= Image.load("ms0:/psp/game/NINJA/images/xxx1.png")
xxx2= Image.load("ms0:/psp/game/NINJA/images/xxx2.png")
xxx3= Image.load("ms0:/psp/game/NINJA/images/xxx3.png")
pochet = Image.load("ms0:/psp/game/NINJA/images/pochet.png")
sled= Image.load("ms0:/psp/game/NINJA/images/sled.png")
sled2= Image.load("ms0:/psp/game/NINJA/images/sled2.png")
sled3= Image.load("ms0:/psp/game/NINJA/images/sled3.png")
sled4= Image.load("ms0:/psp/game/NINJA/images/sled4.png")
sled5= Image.load("ms0:/psp/game/NINJA/images/sled5.png")
pay= Image.load("ms0:/psp/game/NINJA/images/pay.png")
pay2= Image.load("ms0:/psp/game/NINJA/images/pay2.png")
pay3= Image.load("ms0:/psp/game/NINJA/images/pay3.png")
ukaz= Image.load("ms0:/psp/game/NINJA/images/ukaz.png")
isa=2
rnd=0
cold=0
bb=1
kui=0
x=0
xx=0
xxx=0
xxxx=0
xxxxx=0
qq=0
qqq=0
qqqq=0
qqqqq=0
qqqqqq=0
vb=0
cb=0
patx=0
paty=0
patxx=0
patyy=0
patxxx=0
patyyy=0
patxxxx=0
patyyyy=0
patxxxxx=0
patyyyyy=0
y=271
yy=271
yyy=271
yyyy=271
yyyyy=271
k=0
l=0
m=0
n=0
o=0
a=0
b=0
c=0
d=0
r=0
p=0
q = 240
w = 140

function sansAccents (texte)
	
nomaffiche = string.gsub(texte, "é", "e")
nomaffiche = string.gsub(nomaffiche, "è", "e")
nomaffiche = string.gsub(nomaffiche, "à", "a")
nomaffiche = string.gsub(nomaffiche, "ç", "c")
nomaffiche = string.gsub(nomaffiche, "ê", "e")
nomaffiche = string.gsub(nomaffiche, "î", "i")
nomaffiche = string.gsub(nomaffiche, "€", "E")
nomaffiche = string.gsub(nomaffiche, "ñ", "n")
nomaffiche = string.gsub(nomaffiche, "ù", "u")
return nomaffiche
end
ii=150
iii=200
iiii=250
while true do
ii=ii+1
iii=iii+1
iiii=iiii+1
if ii>255 then
ii=0
end
if iii>255 then
iii=0
end
if iiii>255 then
iiii=0
end
noir = Color.new (ii,iii,iiii)
pad = Controls.read()

if pad:right() and oldpad:right() ~= pad:right() then
isa=isa+1
end

if pad:left() and oldpad:left() ~= pad:left() then
isa=isa-1
end

if isa==1 then
screen:blit(0,0,vxod1)
if pad:cross() then
dofile("ms0:/psp/game/NINJA/scripts/b.lua")
end
end
if isa==2 then
screen:blit(0,0,vxod2)
if pad:cross() then
dofile("ms0:/psp/game/NINJA/scripts/a.lua")
end
end
if isa==3 then
screen:blit(0,0,vxod3)
if pad:cross() then
System.Quit()
end
end
if isa>3 then
isa=1
end
if isa<1 then
isa=3
end
oldpad=pad
screen:fontPrint(font,280,40,"VITTACH",noir)
screen:fontPrint(font2,280,60,"windows 8 aka supersashaman",noir)
screen:flip()
screen.waitVblankStart()
end 