--再会~~~

--定义
P={};
p={};
l={};
System.setcpuspeed(333)

--旋转方块函数
function drawsquare(image,x0,y0,angle,a,color)
  angle = math.rad(angle)
  B = (2^(1/2))*a*math.cos(angle)/2
  A = (2^(1/2))*a*math.sin(angle)/2
  p[1]={x=x0-A,y=y0-B};
  p[2]={x=x0-B,y=y0+A};
  p[3]={x=x0+B,y=y0-A};
  p[4]={x=x0+A,y=y0+B}; 
--重新索引P点
  for index=1,4 do
    if p[index].x<=x0 and p[index].y<y0 then
      P[1]=p[index];
    elseif p[index].x<x0 and p[index].y>=y0 then
      P[2]=p[index];
    elseif p[index].x>x0 and p[index].y<=y0 then
      P[3]=p[index];
    elseif p[index].x>=x0 and p[index].y>y0 then
      P[4]=p[index];
    end
  end
  if P[1].x~=P[3].x and P[3].x~=P[4].x and P[4].x~=P[2].x and P[1].x~=P[2].x then
    l[1]={x1=P[2].x,x2=P[1].x,y1=P[1].y,y2=P[2].y,k=(P[2].y-P[1].y)/(P[2].x-P[1].x),b=(P[2].y-P[1].y)*(-P[1].x)/(P[2].x-P[1].x)+P[1].y};
    l[2]={x1=P[2].x,x2=P[4].x,y1=P[2].y,y2=P[4].y,k=(P[4].y-P[2].y)/(P[4].x-P[2].x),b=(P[4].y-P[2].y)*(-P[2].x)/(P[4].x-P[2].x)+P[2].y};
    l[3]={x1=P[4].x,x2=P[3].x,y1=P[3].y,y2=P[4].y,k=(P[3].y-P[4].y)/(P[3].x-P[4].x),b=(P[3].y-P[4].y)*(-P[4].x)/(P[3].x-P[4].x)+P[4].y}; 
    l[4]={x1=P[1].x,x2=P[3].x,y1=P[1].y,y2=P[3].y,k=(P[1].y-P[3].y)/(P[1].x-P[3].x),b=(P[1].y-P[3].y)*(-P[3].x)/(P[1].x-P[3].x)+P[3].y};      
    xmax = math.max(P[1].x,P[2].x,P[3].x,P[4].x)
    xmin = math.min(P[1].x,P[2].x,P[3].x,P[4].x)
    ymax = math.max(P[1].y,P[2].y,P[3].y,P[4].y)
    ymin = math.min(P[1].y,P[2].y,P[3].y,P[4].y)
    for x=xmin,xmax do
      l1index=nil
      l2index=nil
      for index=1,4 do
        if l[index].x1<=l[index].x2 then
          if l[index].x1<=x and l[index].x2>=x then
            if type(l1index)=="nil" then
              l1index=index
            else
              l2index=index
              break
            end
          end  
        elseif l[index].x1>l[index].x2 then
          if l[index].x2<=x and l[index].x1>=x then
            if type(l1index)=="nil" then
              l1index=index
            else
              l2index=index
              break
            end
          end
        end
      end
      image:drawLine(x,l[l1index].k * x + l[l1index].b , x , l[l2index].k * x + l[l2index].b , color);
    end
  else
    if P[1].x<0 then
      w=a+P[1].x-1
      P[1].x=0;
    end
    if P[1].y<0 then
      h=a+P[1].y-1
      P[1].y=0;
    end
    image:fillRect(P[1].x, P[1].y,w,h,color)
  end
end

--透明算法0:完全透明,1:不透明
function rgbalpha(colors1,r,g,b,alpha)
  alpha=alpha/100
  R=colors1.r+((r-colors1.r)*alpha)
  G=colors1.g+((g-colors1.g)*alpha)
  B=colors1.b+((b-colors1.b)*alpha)
  return Color.new(R,G,B)
end

--主要函数
backmusic="sound/backmusic.mp3"
Mp3me.load(backmusic)
Mp3me.play()


sq={}
sq[1]={x=80,y=60,a=70,T=-1,color=Color.new(255,0,0),ap=true}
sq[2]={x=240,y=60,a=70,T=1,color=Color.new(255,0,255),ap=true}
sq[3]={x=400,y=60,a=70,T=1,color=Color.new(255,255,0),ap=true}
sq[4]={x=80,y=212,a=70,T=1,color=Color.new(0,255,255),ap=true}
sq[5]={x=240,y=212,a=70,T=-1,color=Color.new(0,0,255),ap=true}
sq[6]={x=400,y=212,a=70,T=-1,color=Color.new(0,255,0),ap=true}
timer=Timer.new(0)
timer:start()
v=5
startpress=false
while true do
  screen:clear(Color.new(255,255,255))
  pad = Controls.read()
  t=timer:time()/100
  for index=1,6 do
    drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color)
  end
--移动方块
  if sq[1].x>10 then
    sq[1].x=sq[1].x-v
  end
  if sq[1].y>10 then
    sq[1].y=sq[1].y-v
  end
  if sq[2].y>5 then
    sq[2].y=sq[2].y-v
  end
  if sq[3].x<470 then
    sq[3].x=sq[3].x+v
  end
  if sq[3].y>10 then
    sq[3].y=sq[3].y-v
  end
  if sq[4].y<262 then
    sq[4].y=sq[4].y+v
  end
  if sq[4].x>10 then
    sq[4].x=sq[4].x-v
  end
  if sq[5].y<267 then
    sq[5].y=sq[5].y+v
  end
  if sq[6].y<262 then
    sq[6].y=sq[6].y+v
  end
  if sq[6].x<470 then
    sq[6].x=sq[6].x+v
  end
  if sq[2].y<=5 then
    break
  end
  screen.flip()
  screen.waitVblankStart()
end

font=Font.createMonoSpaced()
font:setPixelSizes(0, 30)

alpha=0
first=true
v2=5
fontx=65
fonty=154.5
color1=screen:pixel(fontx,fonty)
colors1=color1:colors()
oldpad=Controls.read()
while startpress==false do
  screen:clear(Color.new(255,255,255))
  pad = Controls.read()
  if pad:start()==false and oldpad:start()==true then
    startpress=true
  end
  t=timer:time()/100
  for index=1,6 do
    drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color)
  end
  
--渐入渐出
  screen:fontPrint(font,fontx,fonty,"The Friends For Bank",rgbalpha(colors1,0,0,0,alpha))
  if first==true then
    if alpha<100 then
      alpha=alpha+v2
    else
      first=false
    end
  elseif first==false then
    if alpha<=0 then
      break
    end
    alpha=alpha-v2
  end
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end

alpha=0
first=true
v2=5
fontx=177
fonty=121
fonx=78
fony=156
color1=screen:pixel(fontx,fonty)
colors1=color1:colors()
oldpad=Controls.read()
while startpress==false do
  screen:clear(Color.new(255,255,255))
  pad = Controls.read()
  if pad:start()==false and oldpad:start()==true then
    startpress=true
  end
  t=timer:time()/100
  for index=1,6 do
    drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color)
  end
  
--渐入渐出
  screen:fontPrint(font,fontx,fonty,"Author:",rgbalpha(colors1,0,0,0,alpha))
  screen:fontPrint(font,fonx,fony,"Class1202 [TOP]Kyd",rgbalpha(colors1,0,0,0,alpha))
  if first==true then
    if alpha<100 then
      alpha=alpha+v2
    else
      first=false
    end
  elseif first==false then
    if alpha<=0 then
      break
    end
    alpha=alpha-v2
  end
  
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end

alpha=0
first=true
v2=5

--[[
fwh=font:getTextSize("Press Start")
fontx=(480-fwh.width)/2
fonty=(272-fwh.height)/2+30
]]

fontx=141
fonty=155
color1=screen:pixel(fontx,fonty)
colors1=color1:colors()
oldpad=Controls.read()
while true do
  screen:clear(Color.new(255,255,255))
  pad = Controls.read()
  if pad:start()==false and oldpad:start()==true then
    break
  end
  t=timer:time()/100
  for index=1,6 do
    drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color)
  end
  
--渐入渐出
  screen:fontPrint(font,fontx,fonty,"Press Start",rgbalpha(colors1,0,0,0,100*math.sin(math.pi*t/10)))
  if Mp3me.eos()=="true" then
    Mp3me.stop()
    Mp3me.load(backmusic)
    Mp3me.play()
  end
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end
Mp3me.stop()
System.oaenable()
changemusic = Sound.load("sound/bonus.wav",false)
Music.volume(128)
changemusic:play()
while true do
  screen:clear(Color.new(255,255,255))
  t=timer:time()/100
  for index=1,6 do
    if sq[index].ap==true then
      drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color)
    end
  end
  for i=1,5 do
    if sq[i].x> -sq[i].a/2 then
      sq[i].x=sq[i].x-20
    else
      sq[i].ap=false
    end
  end
  if sq[6].x>240 then
    sq[6].x=sq[6].x-10
  end
  if sq[6].y>136 then
    sq[6].y=sq[6].y-10
  end
  if sq[6].x<=240 and sq[6].y<=136 then
    break
  end
  screen.flip()
  screen.waitVblankStart()
end
t=timer:time()/100

while timer:time()/100>=t+5 do
  screen:clear(Color.new(255,255,255))
  drawsquare(screen,sq[6].x,sq[6].y,math.pi*(2*(timer:time()/100)/sq[6].T+0.25),sq[6].a,sq[6].color)
  screen.flip()
  screen.waitVblankStart()
end

--[[
wh=sq[6].a
alx=(480-wh)/2
aly=(272-wh)/2
]]

alcolor=0
alimage=Image.createEmpty(480,272)--遮罩图层
while true do
  screen:clear(Color.new(255,255,255))
  t=timer:time()/100
  drawsquare(screen,sq[6].x,sq[6].y,math.pi*(2*t/sq[6].T+0.25),sq[6].a,sq[6].color)
  alimage:clear(Color.new(0,255,0,alcolor))
  screen:blit(0,0,alimage)
  if alcolor<=245 then 
    alcolor=alcolor+10
  else
    break
  end
  screen.flip()
  screen.waitVblankStart()
end


dofile("main.lua")