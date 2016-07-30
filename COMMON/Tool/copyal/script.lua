function dt()
for x=0,width-1 do
  for y=0,height-1 do
    color=image:pixel(x, y)
    colors=color:colors()
    if colors.r>250 and colors.b>250 and colors.g>250 then
      im:pixel(x,y,Color.new(255,255,255,0))
    else
      im:pixel(x,y,color)
    end
  end
end
end

pic=Image.load("pic.png")
width=pic:width()
height=pic:height()
image=Image.createEmpty(width,height)
image:clear(Color.new(255,255,255,0))
image:blit(0,0,pic)

im=Image.createEmpty(width,height)
im:clear(Color.new(255,255,255,0))
curr=1
x=0
y=0
al=40
oldpad=Controls.read()
while true do
  screen:clear(Color.new(255,255,255))
  pad=Controls.read()
  if oldpad:start() and not pad:start() then
    im:save("pichasmod.png")
    System.message('Picture is saved!',0)
  elseif oldpad:select() and not pad:select() then
    dt()
    System.message('OK!',0)
  elseif oldpad:left() and not pad:left() and not pad:l()then
    if curr==1 then
      al=al-1
    elseif curr==2 then
      x=x-1
    elseif curr==3 then
      y=y-1
    end
  elseif oldpad:left() and not pad:left() and pad:l() then
    if curr==1 then
      al=al-10
    elseif curr==2 then
      x=x-10
    elseif curr==3 then
      y=y-10
    end
  elseif oldpad:right() and not pad:right() and pad:l() then
    if curr==1 then
      al=al+10
    elseif curr==2 then
      x=x+10
    elseif curr==3 then
      y=y+10
    end
  elseif oldpad:right() and not pad:right() and not pad:l()then
    if curr==1 then
      al=al+1
    elseif curr==2 then
      x=x+1
    elseif curr==3 then
      y=y+1
    end
  elseif oldpad:up() and not pad:up() and curr>1 then
    curr=curr-1
  elseif oldpad:down() and not pad:down() and curr<3 then
    curr=curr+1
  end
  screen:blit(x,y,im)
  screen:blit(0,0,image)
  screen:print(20,10,"al:" ..al,Color.new(255,0,255))
  screen:print(20,20,"x:" ..x,Color.new(255,0,255))
  screen:print(20,30,"y:" ..y,Color.new(255,0,255))
  screen:fillRect(10,curr*10,8,8,Color.new(255,0,255))
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end
