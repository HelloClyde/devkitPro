pic=Image.load("pic.jpg")
color=Color.new(255,255,0)
x=0
y=0
w=1
h=1
m=Image.createEmpty(w,h)
mi=Image.createEmpty(pic:width(),pic:height())
mi:blit(0,0,pic)
curr=1
wh=true
oldpad=Controls.read()
while true do
  screen:blit(0,0,mi)
  screen:blit(x,y,m)
  screen:drawLine(x,y,x+w,y,color)
  screen:drawLine(x,y,x,y+h,color)
  screen:drawLine(x+w,y,x+w,y+h,color)
  screen:drawLine(x,y+h,x+w,y+h,color)
  
  screen:print(10,10,"x=" ..x,color)
  screen:print(10,20,"y=" ..y,color)
  screen:print(10,30,"w=" ..w,color)
  screen:print(10,40,"h=" ..h,color)
  screen:fillRect(1,curr*10,8,8,color)
  
  pad=Controls.read()
  if wh then
    if pad:left()==false and oldpad:left()==true and pad:l()==false then
      if curr==1 then
        x=x-1
      elseif curr==2 then
        y=y-1
      elseif curr==3 then
        w=w-1
      elseif curr==4 then
        h=h-1
      end
    elseif pad:right()==false and oldpad:right()==true and pad:l()==false then
      if curr==1 then
        x=x+1
      elseif curr==2 then
        y=y+1
      elseif curr==3 then
        w=w+1
      elseif curr==4 then
        h=h+1
      end
    elseif pad:right()==false and oldpad:right()==true and pad:l()==true then
      if curr==1 then
        x=x+10
      elseif curr==2 then
        y=y+10
      elseif curr==3 then
        w=w+10
      elseif curr==4 then
        h=h+10
      end
    elseif pad:left()==false and oldpad:left()==true and pad:l()==true then
      if curr==1 then
        x=x-10
      elseif curr==2 then
        y=y-10
      elseif curr==3 then
        w=w-10
      elseif curr==4 then
        h=h-10
      end
    end
    if oldpad:up() and not pad:up() and curr>1 then
      curr=curr-1
    elseif oldpad:down() and not pad:down() and curr<4 then
      curr=curr+1
    end
  else
    if oldpad:up() and not pad:up() then 
      y=y-1
    elseif oldpad:down() and not pad:down() then 
      y=y+1
    elseif oldpad:left() and not pad:left() then 
      x=x-1
    elseif oldpad:right() and not pad:right() then 
      x=x+1
    end
  end
  if oldpad:select() and not pad:select() then
    m=Image.createEmpty(w,h)
    m:clear()
    m:blit(0,0,pic,x,y,w,h)
    System.message('Done!',0)
  elseif oldpad:start() and not pad:start() then
    mi:save("pichasmod.png")
    System.message('Picture is saved!',0)
  elseif oldpad:circle() and not pad:circle() then
    mi:blit(x,y,m)
  elseif oldpad:cross() and not pad:cross() then
    if wh then
      wh=false
    else
      wh=true
    end
  end
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end
