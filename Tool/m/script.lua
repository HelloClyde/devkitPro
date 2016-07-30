pic=Image.load("pic.png")
width=pic:width()
height=pic:height()
image=Image.createEmpty(width, height)
image:blit(0,0,pic)
im=Image.createEmpty(width,height)
for x=0,width-1 do
  for y=0,height-1 do
    color=image:pixel(x, y)
    im:pixel(width-1-x,y,color)
  end
end
oldpad=Controls.read()
while true do
  pad=Controls.read()
  image:clear()
  screen:blit(0,0,im)
  if oldpad:start() and not pad:start() then
    im:save("pichasmod.png")
    System.message('Picture is saved!',0)
  end
  oldpad=pad
  screen.flip()
  screen.waitVblankStart()
end
