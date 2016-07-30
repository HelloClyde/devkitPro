function scleImage(newX, newY, theImage) 

rsizedImage = Image.createEmpty(newX, newY) 
for x = 0, newX do 
for y = 0, newY do 
rsizedImage:blit(x,y , theImage,
math.floor(x*(theImage:width()/newX)),
math.floor(y*(theImage:height()/newY)),1,1) 
end 
end 
return rsizedImage 

end

pic=Image.load("pic.png")
width=pic:width()
height=pic:height()
image=Image.createEmpty(width,height)
curr=1
x=0
y=0
oldpad=Controls.read()
while true do
  pad=Controls.read()
  screen:clear()
  screen:blit(0,0,image)
  if oldpad:start() and not pad:start() then
    image:save("pichasmod.png")
    System.message('Picture is saved!',0)
  elseif oldpad:select() and not pad:select() then
    image=scleImage(x,y,pic)
    System.message('OK!',0)
  elseif oldpad:left() and not pad:left() and not pad:l()then
    if curr==1 then
      x=x-1
    elseif curr==2 then
      y=y-1
    end
  elseif oldpad:left() and not pad:left() and pad:l() then
    if curr==1 then
      x=x-10
    elseif curr==2 then
      y=y-10
    end
  elseif oldpad:right() and not pad:right() and pad:l() then
    if curr==1 then
      x=x+10
    elseif curr==2 then
      y=y+10
    end 
  elseif oldpad:right() and not pad:right() and not pad:l()then
    if curr==1 then
      x=x+1
    elseif curr==2 then
      y=y+1
    end
  elseif oldpad:up() and not pad:up() then
    curr=1
  elseif oldpad:down() and not pad:down() then
    curr=2
  end
  screen:print(20,10,"x:" ..x,Color.new(255,0,255))
  screen:print(20,20,"y:" ..y,Color.new(255,0,255))
  screen:fillRect(10,curr*10,8,8,Color.new(255,0,255))
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end