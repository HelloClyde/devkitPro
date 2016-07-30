
blanc=Color.new(255,255,255)
credit=Image.load("images/credit.png")
cred={x=0,y=272}
while true do
pad=Controls.read()
screen:clear(blanc)
screen:blit(cred.x,cred.y,credit)
if cred.y>0 then
cred.y=cred.y-1
end
if pad:circle()and cred.y<10  then
break
end
screen.waitVblankStart()
screen.flip()
end
