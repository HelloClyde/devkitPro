--AAVV-Kyd
--萧山中学科技节

--test

function drawsquare(image,x0,y0,angle,a,color,times,adjustangle)
  angle = math.rad(angle)
  for adjusttime = 1,times do
    A = (2^(1/2))*a*math.cos(angle)/2
    B = (2^(1/2))*a*math.sin(angle)/2
    x1 = x0-B
    y1 = y0-A
    x2 = x0-A
    y2 = y0+B
    x3 = x0+A
    y3 = y0-B
    x4 = x0+B
    y4 = y0+A
    if x1~=x2 and x3 ~= x4 and x3 ~= x1 and x4 ~= x2 then
    --画正一次
      if x1>x2 then
        step = 1
      else 
        step = -1
      end
      for xa = x2,x1,step do
        ya = (y2-y1)*(xa-x1)/(x2-x1)+y1
        xb = xa+A+B
        yb = (y4-y3)*(xb-x3)/(x4-x3)+y3
        image:drawLine(math.floor(xa),math.floor(ya),math.floor(xb),math.floor(yb),color)
      end
    --画次一次
      if x3>x1 then
        step = 1
      else 
        step = -1
      end
      for xa = x1,x3,step do
        ya = (y3-y1)*(xa-x1)/(x3-x1)+y1
        xb = xa-A+B
        yb = (y4-y2)*(xb-x2)/(x4-x2)+y2
        image:drawLine(math.floor(xa),math.floor(ya),math.floor(xb),math.floor(yb),color)
      end
    else
      xmin = math.min(x1,x2,x3,x4)
      ymin = math.min(y1,y2,y3,y4)
      image:fillRect(xmin, ymin, a, a,color)
    end
      angle = angle+adjustangle
  end
end

function fontalpha(x0,y0,image1,image2,alpha)
  for x=0,image1:width()-1 do
    for y=0,image1:height()-1 do
      color1=image1:pixel(x,y)
      colors1=color1:colors()
      if colors1.a~=0 then
    --  color2=image2:pixel(x0+x, y0+y)
    --  colors2=color2:colors()
    --  r=math.floor(colors1.r*alpha/255+colors2.r*(1-alpha)/255)
    --  g=math.floor(colors1.g*alpha/255+colors2.g*(1-alpha)/255)
    --  b=math.floor(colors1.b*alpha/255+colors2.b*(1-alpha)/255)
        image2:pixel(x0+x, y0+y, Color.new(colors1.r,colors1.g,colors1.b,alpha))
      end
    end
  end
end

--main
sq={}
sq[1]={x=80,y=60,a=160,T=-1,color=Color.new(255,0,0)}
sq[2]={x=240,y=60,a=160,T=1,color=Color.new(255,0,255)}
sq[3]={x=400,y=60,a=160,T=1,color=Color.new(255,255,0)}
sq[4]={x=80,y=212,a=160,T=1,color=Color.new(0,255,255)}
sq[5]={x=240,y=212,a=160,T=-1,color=Color.new(0,0,255)}
sq[6]={x=400,y=212,a=160,T=-1,color=Color.new(0,255,0)}
timer=Timer.new(0)
timer:start()
v=10
startpress=false
while startpress==false do
  screen:clear(Color.new(255,255,255))
  pad = Controls.read()
  if pad:start() then
    startpress=true
  end
  t=timer:time()/100
  for index=1,6 do
    drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color,1,math.pi/128)
  end
  if sq[1].x>10 then
    sq[1].x=sq[1].x-v
  end
  if sq[1].y>10 then
    sq[1].y=sq[1].y-v
  end
  if sq[2].y>10 then
    sq[2].y=sq[2].y-v
  end
  if sq[3].x<470 then
    sq[3].x=sq[3].x+v
  end
  if sq[3].y>10 then
    sq[3].y=sq[3].y-v
  end
  if sq[3].x>10 then
    sq[3].x=sq[3].x-v
  end
  if sq[4].y<262 then
    sq[4].y=sq[4].y+v
  end
  if sq[5].y<262 then
    sq[5].y=sq[5].y+v
  end
  if sq[6].y<262 then
    sq[6].y=sq[6].y+v
  end
  if sq[6].x<470 then
    sq[6].x=sq[6].x+v
  end
  if sq[6].x>= 470 then
    break
  end
  screen.flip()
  screen.waitVblankStart()
end
font=Font.createMonoSpaced()
font:setPixelSizes(0, 30)
alpha=0
string='AAVV-Kyd'
fwh=font:getTextSize(string)
imagefont=Image.createEmpty(fwh.width, fwh.height)
imagefont:fontPrint(font,0,0,string)
while true do
  screen:clear(Color.new(255,255,255))
  t=timer:time()/100
  for index=1,6 do
    drawsquare(screen,sq[index].x,sq[index].y,math.pi*(2*t/sq[index].T+0.25),sq[index].a,sq[index].color,1,math.pi/128)
  end
  fontalpha((480-fwh.width)/2,(272-fwh.height)/2,imagefont,screen,alpha)
  if alpha<255 then
    alpha=alpha+1
  end
  screen.flip()
  screen.waitVblankStart()
end
  