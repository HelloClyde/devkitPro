Selecteur1 = 1
SelecteurDir1 = 3

System.currentDirectory("ms0:/psp/game/NINJA/records")
Fichiers = System.listDirectory()
i= sansAccents(Fichiers[SelecteurDir1 ].name)

noi = Color.new (255,255,255)

font = Font.load("ms0:/psp/game/NINJA/qwe.ttf")
font:setPixelSizes(30,30)
puka=0
while true do
puka=puka+1
screen:blit(0,0,pochet)
pad = Controls.read()

screen:fontPrint(font,270,147,i,noi)
if puka>3 then
if pad:cross() then
puka=0
dofile("ms0:/psp/game/NINJA/script.lua")
end
end

  screen:flip()
  screen.waitVblankStart()
end 