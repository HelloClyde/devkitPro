screen:clear()
Mp3me.stop()
noir = Color.new (255,216,0)
System.currentDirectory("ms0:/psp/game/NINJA/music")
Mp3me.load("1.mp3")
Mp3me.play()
bur=1
mxx=135
myy=65
culd=0
function kc()
x = math.random(0,400)
end
function kcc()
xx = math.random(0,400)
end
function kccc()
xxx = math.random(0,400)
end
function kcccc()
xxxx = math.random(0,400)
end
function kccccc()
xxxxx = math.random(0,400)
end
Selecteur2 = 1
SelecteurDir2 = 3

System.currentDirectory("ms0:/psp/game/NINJA/game")
Fichiers = System.listDirectory()
game = sansAccents(Fichiers[SelecteurDir2].name)

Selecteur3 = 1
SelecteurDir3 = 3

System.currentDirectory("ms0:/psp/game/NINJA/av2")
Fichiers = System.listDirectory()
av2 = sansAccents(Fichiers[SelecteurDir3].name)

Selecteur4 = 1
SelecteurDir4 = 3

System.currentDirectory("ms0:/psp/game/NINJA/av1")
Fichiers = System.listDirectory()
av1 = sansAccents(Fichiers[SelecteurDir4].name)

while cold==0 do
if game==av1 then
rnd= rnd+1/100
end
pad = Controls.read()
if pad:up() then
w=w-10
end
if pad:down() then
w=w+10
end
if pad:left() then
q=q-10
end
if pad:right() then
q=q+10
end

if w<0 then w=0 end
if w>252 then w=250 end
if q<0 then q=0 end
if q>460 then q=460 end

m = math.random(1,30)
if m==1 then
a=1
end
if m==2 then
b=1
end
if m==3 then
c=1
end
if m==4 then
d=1
end
if m==5 then
p=1
end

if a==1 then--nachal a
if k==0 and y==271 then
kc()
end
if y>0 and k==0 then
y=y-bb
x=x+0.5
else
k=1
end
if y<272 and k==1 then
y=y+bb
x=x+0.5
if y>271 then
x=0
if qq==1 then
cb=cb+1
end
qq=0
y=271
a=0
k=0
end
end
end--zakonchil a

if b==1 then--nachal b
if l==0 and yy==271 then
kcc()
end
if yy>0 and l==0 then
yy=yy-bb
xx=xx+0.5
else
l=1
end
if yy<272 and l==1 then
yy=yy+bb
xx=xx+0.5
if yy>271 then
xx=0
if qqq==1 then
cb=cb+1
end
qqq=0
yy=271
b=0
l=0
end
end
end--zakonchil b

if c==1 then--nachal c bomba
if r==0 and yyy==271 then
kccc()
end
if yyy>0 and r==0 then
yyy=yyy-bb
xxx=xxx+0.5
else
r=1
end
if yyy<272 and r==1 then
yyy=yyy+bb
xxx=xxx+0.5
if yyy>271 then
xxx=0
yyy=271
c=0
if qqqq==2 then
vb=vb+1
cb=cb-10
end
qqqq=0
r=0
end
end
end--zakonchil c bomba

if d==1 then--nachal d
if n==0 and yyyy==271 then
kcccc()
end
if yyyy>0 and n==0 then
yyyy=yyyy-bb
xxxx=xxxx+0.5
else
n=1
end
if yyyy<272 and n==1 then
yyyy=yyyy+bb
xxxx=xxxx+0.5
if yyyy>271 then
xxxx=0
yyyy=271
d=0
if qqqqq==1 then
cb=cb+1
end
qqqqq=0
n=0
end
end
end--zakonchil d

if p==1 then--nachal p
if o==0 and yyyyy==271 then
kccccc()
end
if yyyyy>0 and o==0 then
yyyyy=yyyyy-bb
xxxxx=xxxxx+0.5
else
o=1
end
if yyyyy<272 and o==1 then
yyyyy=yyyyy+bb
xxxxx=xxxxx+0.5
if yyyyy>271 then
xxxxx=0
yyyyy=271
p=0
if qqqqqq==1 then
cb=cb+1
end
qqqqqq=0
o=0
end
end
end--zakonchil p

if pad:start() then
cold=1
end
screen:blit(0,0,fon)
if qq==1 then
screen:blit(patx,paty,sled3)
end
if qqq==1 then
screen:blit(patxx,patyy,sled2)
end
if qqqq==1 then
screen:blit(patxxx,patyyy,sled)
end
if qqqqq==1 then
screen:blit(patxxxx,patyyyy,sled4)
end
if qqqqqq==1 then
screen:blit(patxxxxx,patyyyyy,sled5)
end
if qq~=1 then
screen:blit(x,y,nintendo)
else
screen:blit(x,y,nintendobum)
end
if qqq~=1 then
screen:blit(xx,yy,pod)
else
screen:blit(xx,yy,podbum)
end
if qqqq==0 then
screen:blit(xxx,yyy,psp)
end
if qqqq==1 then
kui=kui+1
if kui>1 and kui<10 then
screen:blit(xxx,yyy,pspbum)
end
if kui>10 and kui<20 then
screen:blit(xxx,yyy,pspbum2)
end
if kui>20 and kui<30 then
screen:blit(xxx,yyy,pspbum3)
end
if kui>30 and kui<40 then
screen:blit(xxx,yyy,pspbum4)
end
if kui>44 then
kui=0
qqqq=2
end
end
if qqqqq~=1 then
screen:blit(xxxx,yyyy,starie)
else
screen:blit(xxxx,yyyy,stariebum)
end
if qqqqqq~=1 then
screen:blit(xxxxx,yyyyy,nintendo2)
else
screen:blit(xxxxx,yyyyy,nintendobum2)
end
if vb==0 then
screen:blit(390,0,xxx0)
end
if vb==1 then
screen:blit(390,0,xxx1)
end
if vb==2 then
screen:blit(390,0,xxx2)
end
if vb==3 then
screen:blit(390,0,xxx3)
end
if vb>3 then
System.message("You died! =(",1)
if System.buttonPressed(0) == 1 then
Selecteur1 = 1
SelecteurDir1 = 3

System.currentDirectory("ms0:/psp/game/NINJA/records")
Fichiers = System.listDirectory()
System.rename(System.currentDirectory().."/"..Fichiers[SelecteurDir1].name,cb)
dofile("ms0:/psp/game/NINJA/script.lua")
end
end
if rnd>60 then
System.message("Time out! =(",1)
if System.buttonPressed(0) == 1 then
dofile("ms0:/psp/game/NINJA/script.lua")
end
end
if game==av2 then
screen:fontPrint(font,10,40,cb,noir)
end
if game==av1 then
screen:fontPrint(font,10,40,rnd,noir)
end
if pad:cross() and x-10<q and q<x+50 and y<w and w<y+47 and qq==0 then
patx=q-50
paty=w-15
qq=1
end
if pad:cross() and xx<q-10 and q-10<xx+67 and yy<w-10 and w-10<yy+61 and qqq==0 then
patxx=q-50
patyy=w-15
qqq=1
end
if pad:cross() and xxx<q-10 and q-10<xxx+50 and yyy<w-10 and w-10<yyy+47 and qqqq==0 then
patxxx=q-45
patyyy=w-10
qqqq=1
end
if pad:cross() and xxxx<q-10 and q-10<xxxx+50 and yyyy<w-10 and w-10<yyyy+47 and qqqqq==0 then
patxxxx=q-50
patyyyy=w-15
qqqqq=1
end
if pad:cross() and xxxxx<q-10 and q-10<xxxxx+60 and yyyyy<w-10 and w-10<yyyyy+60 and qqqqqq==0 then
patxxxxx=q-70
patyyyyy=w-10
qqqqqq=1
end
if cb>0 and cb < 3 or cb<0 then
bb=1
end
if cb>3 and cb<6 then
bb=2
end
if cb>6 and cb<10 then
bb=3
end
if cb>10 and cb<13 then
bb=3
end
if cb>13 and cb<16 then
bb=3
end
if cb>16 and cb<19 then
bb=4
end
if cb>19 and cb<21 then
bb=5
end
if cb>21 and cb<24 then
bb=6
end
if cb>24 then
bb=7
end

if math.abs(pad:analogY()) > 32 then
w = w + pad:analogY() / 8;
end
if math.abs(pad:analogX()) > 32 then
q = q + pad:analogX() / 8;
end
screen:blit(q,w,cel)
screen:flip()
end 
while cold==1 do
Mp3me.pause()
pad = Controls.read()
if pad:down() and oldpad:down() ~= pad:down() then
bur=bur+1
end
if pad:up() and oldpad:up() ~= pad:up() then
bur=bur-1
end
screen:blit(mxx,myy,pay2)
if culd==0 then
screen:blit(mxx,myy,pay)
end
if bur==1 then
screen:blit(mxx+50,myy+37,ukaz)
if pad:cross() then
Mp3me.play()
cold=0
end
end
if bur==2 then
screen:blit(mxx+50,myy+57,ukaz)
if pad:cross() then
culd=1
end
end
if bur==3 then
screen:blit(mxx+50,myy+74,ukaz)
if pad:cross() then
Selecteur1 = 1
SelecteurDir1 = 3
System.currentDirectory("ms0:/psp/game/NINJA/records")
Fichiers = System.listDirectory()
System.rename(System.currentDirectory().."/"..Fichiers[SelecteurDir1].name,cb)
dofile("ms0:/psp/game/NINJA/script.lua")
end
end
if bur==4 then
screen:blit(mxx+50,myy+92,ukaz)
if pad:cross() then
Selecteur2 = 1
SelecteurDir2 = 3
System.currentDirectory("ms0:/psp/game/NINJA/game")
Fichiers = System.listDirectory()
System.rename(System.currentDirectory().."/"..Fichiers[SelecteurDir2].name,1)
dofile("ms0:/psp/game/NINJA/scripts/a.lua")
end
end
if bur==5 then
screen:blit(mxx+50,myy+110,ukaz)
if pad:cross() then
Selecteur2 = 1
SelecteurDir2 = 3
System.currentDirectory("ms0:/psp/game/NINJA/game")
Fichiers = System.listDirectory()
System.rename(System.currentDirectory().."/"..Fichiers[SelecteurDir2].name,2)
dofile("ms0:/psp/game/NINJA/scripts/a.lua")
end
end
if culd==1 then
screen:blit(mxx,myy,pay3)
bur=bur
if pad:cross() then
culd=0
end
end
if bur>5 then bur=1 end
if bur<1 then bur=5 end
oldpad=pad
screen:flip()
end