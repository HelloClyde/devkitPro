function pixelcolor()
  for x=0,width-1 do
    for y=0,height-1 do
      color=image:pixel(x, y)
      colors=color:colors()
      im:pixel(x,y,Color.new(colors.r+dr,colors.g+dg,colors.b+db,colors.a+da))
    end
  end
end


dr=0
dg=0
db=0
da=0
pic=Image.load("pic.jpg")
width=pic:width()
height=pic:height()
image=Image.createEmpty(width,height)
im=Image.createEmpty(width,height)
image:blit(0,0,pic)
curr=1
oldpad=Controls.read()
while true do
  screen:clear()
  pad=Controls.read()
  screen:blit(0,0,im)
  if oldpad:start() and not pad:start() then
    im:save("pichasmod.png")
    System.message('Picture is saved!',0)
  elseif oldpad:select() and not pad:select() then
    pixelcolor()
    System.message('OK!',0)
  elseif oldpad:left() and not pad:left() and not pad:l()then
    if curr==1 then
      dr=dr-1
    elseif curr==2 then
      dg=dg-1
    elseif curr==3 then
      db=db-1
    elseif curr==4 then
      da=da-1
    end
  elseif oldpad:left() and not pad:left() and pad:l() then
    if curr==1 then
      dr=dr-10
    elseif curr==2 then
      dg=dg-10
    elseif curr==3 then
      db=db-10
    elseif curr==4 then
      da=da-10
    end
  elseif oldpad:right() and not pad:right() and pad:l() then
    if curr==1 then
      dr=dr+10
    elseif curr==2 then
      dg=dg+10
    elseif curr==3 then
      db=db+10
    elseif curr==4 then
      da=da+10
    end 
  elseif oldpad:right() and not pad:right() and not pad:l()then
    if curr==1 then
      dr=dr+1
    elseif curr==2 then
      dg=dg+1
    elseif curr==3 then
      db=db+1
    elseif curr==4 then
      da=da+1
    end
  elseif oldpad:up() and not pad:up() and curr~=1 then
    curr=curr-1
  elseif oldpad:down() and not pad:down() and curr~=4 then
    curr=curr+1
  end
  screen:print(20,10,"dr:" ..dr,Color.new(255,255,255))
  screen:print(20,20,"dg:" ..dg,Color.new(255,255,255))
  screen:print(20,30,"db:" ..db,Color.new(255,255,255))
  screen:print(20,40,"da:" ..da,Color.new(255,255,255))
  screen:fillRect(10,curr*10,8,8,Color.new(255,255,255))
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end
