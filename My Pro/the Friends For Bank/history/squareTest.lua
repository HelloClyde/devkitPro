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

angle = 0
a = 30
b = 180
c = 3
while true do
  screen:clear()
  if a <= 0 then
    a = 1
  end
  pad = Controls.read()
  if pad:left() then angle = angle-1 end
  if pad:right() then angle =angle+1 end
  if pad:up() then a =a-1 end
  if pad:down() then a =a+1 end
  if pad:square() then b =b-1 end
  if pad:circle() then b =b+1 end
  if pad:triangle() then c =c-1 end
  if pad:cross() then c =c+1 end
  screen:print(200,10,'angle:'..angle,Color.new(255,255,255))
  screen:print(200,20,'a:'..a,Color.new(255,255,255))
  screen:print(200,30,'adjust angle:math.pi/'..b,Color.new(255,255,255))
  screen:print(200,40,'times:'..c,Color.new(255,255,255))
  drawsquare(screen,100,160,angle,a,Color.new(255,255,255),1,0)
  drawsquare(screen,200,160,angle,a,Color.new(255,255,255),c,math.pi/b)
  screen.flip()
  screen.waitVblankStart()
end