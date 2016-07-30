pic=Image.load("pic.png")
x=0
y=0
sourcex=0
sourcey=0
width=3
height=3
alpha=true
color=Color.new(255,0,255)
oldpad=Controls.read()
show=true
curritem=1
while true do
  screen:clear()
  screen:blit(0,0,pic,alpha)
  screen:drawLine(x+1,y,x+width-2,y,color)
  screen:drawLine(x+1,y+height-1,x+width-2,y+height-1,color)
  screen:drawLine(x,y+1,x,y+height-2,color)
  screen:drawLine(x+width-1,y+1,x+width-1,y+height-2,color)
  if show==true then
    screen:print(10,10,"x=" ..x,color)
    screen:print(10,20,"y=" ..y,color)
    screen:print(10,30,"sourcex=" ..sourcex,color)
    screen:print(10,40,"sourcey=" ..sourcey,color)
    screen:print(10,50,"width=" ..width,color)
    screen:print(10,60,"height=" ..height,color)
    if alpha==true then
      screen:print(10,70,"alpha=true" ,color)
    else
      screen:print(10,70,"alpha=false" ,color)
    end
    screen:fillRect(0,curritem*10,8,8,color)
  end
  pad=Controls.read()
  if pad:left()==false and oldpad:left()==true and pad:l()==false then
    if curritem==1 then
      x=x-1
    elseif curritem==2 then
      y=y-1
    elseif curritem==3 then
      sourcex=sourcex-1
    elseif curritem==4 then
      sourcey=sourcey-1
    elseif curritem==5 then
      width=width-1
    elseif curritem==6 then
      height=height-1
    elseif curritem==7 then
      if alpha==true then
        alpha=false
      else
        alpha=true
      end
    end
  elseif pad:right()==false and oldpad:right()==true and pad:l()==false then
    if curritem==1 then
      x=x+1
    elseif curritem==2 then
      y=y+1
    elseif curritem==3 then
      sourcex=sourcex+1
    elseif curritem==4 then
      sourcey=sourcey+1
    elseif curritem==5 then
      width=width+1
    elseif curritem==6 then
      height=height+1
    elseif curritem==7 then
      if alpha==true then
        alpha=false
      else
        alpha=true
      end
    end
  elseif pad:right()==false and oldpad:right()==true and pad:l()==true then
    if curritem==1 then
      x=x+10
    elseif curritem==2 then
      y=y+10
    elseif curritem==3 then
      sourcex=sourcex+10
    elseif curritem==4 then
      sourcey=sourcey+10
    elseif curritem==5 then
      width=width+10
    elseif curritem==6 then
      height=height+10
    elseif curritem==7 then
      if alpha==true then
        alpha=false
      else
        alpha=true
      end
    end
  elseif pad:left()==false and oldpad:left()==true and pad:l()==true then
    if curritem==1 then
      x=x-10
    elseif curritem==2 then
      y=y-10
    elseif curritem==3 then
      sourcex=sourcex-10
    elseif curritem==4 then
      sourcey=sourcey-10
    elseif curritem==5 then
      width=width-10
    elseif curritem==6 then
      height=height-10
    elseif curritem==7 then
      if alpha==true then
        alpha=false
      else
        alpha=true
      end
    end
  end
  if oldpad:up() and not pad:up() and curritem>1 then
    curritem=curritem-1
  elseif oldpad:down() and not pad:down() and curritem<7 then
    curritem=curritem+1
  end
  if oldpad:select() and not pad:select() then
    if show==true then
      show=false
    else
      show=true
    end
  end
  if oldpad:start() and not pad:start() then
    image=Image.createEmpty(width, height)
    image:clear()
    image:blit(0,0,pic,x,y,width,height,alpha)
    image:save("pichasmod.png")
    System.message('Picture is saved!',0)
  end
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end
