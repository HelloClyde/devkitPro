deletemenu={
"Delete this kind ?",
"Delete this card ?",
}
de2={
"Yes",
"No",
}

korc=0
currde=1
currd=1
oldpad=Controls.read()
while true do
  pad=Controls.read()
  screen:blit(0,0,sc)
  screen:blit(0,0,alimage)
  screen:fontPrint(font,(480-font:getTextSize(deletemenu[1]).width)/2,90,deletemenu[1],Color.new(150,100,60,255))
  screen:fontPrint(font,(480-font:getTextSize(deletemenu[2]).width)/2,180,deletemenu[2],Color.new(150,100,60,255))
  t=timer:time()/100
  drawsquare(screen,((480-font:getTextSize(deletemenu[currde]).width)/2)-30,90*currde,math.pi*2*t/0.2,20,Color.new(255,255,30,200))
  drawsquare(screen,((480-font:getTextSize(deletemenu[currde]).width)/2)+font:getTextSize(deletemenu[currde]).width+30,90*currde,math.pi*2*t/-0.2,20,Color.new(255,255,30,200))
  if oldpad:cross() and not pad:cross() then
    break
  elseif oldpad:circle() and not pad:circle() then
    if currde==1 then
      korc=1
    else
      korc=2
    end
    oldpad=Controls.read()
    while true do
      pad=Controls.read()
      screen:blit(0,0,sc)
      screen:blit(0,0,alimage)
      screen:fontPrint(font,(480-font:getTextSize("Are you sure ?").width)/2,70,"Are you sure ?",Color.new(150,100,60,255))
      screen:fontPrint(font,(480-font:getTextSize(de2[1]).width)/2,140,de2[1],Color.new(150,100,60,255))
      screen:fontPrint(font,(480-font:getTextSize(de2[2]).width)/2,210,de2[2],Color.new(150,100,60,255))
      t=timer:time()/100
      drawsquare(screen,((480-font:getTextSize(de2[1]).width)/2)-30,70+70*currd,math.pi*2*t/0.2,20,Color.new(255,255,30,200))
      drawsquare(screen,((480-font:getTextSize(de2[2]).width)/2)+font:getTextSize(de2[2]).width+30,70+70*currd,math.pi*2*t/-0.2,20,Color.new(255,255,30,200))
      if oldpad:cross() and not pad:cross() then
        break
      elseif oldpad:circle() and not pad:circle() then
        if currd==1 then
          if korc==1 then
            namecard[cardkind[currkind]]=nil
            for a=currkind,allkind do
              cardkind[a]=cardkind[a+1]
            end
            if currkind~=1 then
              currkind=currkind-1
            end
            currcard=1
            allkind,allcard=getallnum()
          elseif korc==2 then
            for a=1,allcard do
              namecard[cardkind[currkind]][a]=namecard[cardkind[currkind]][a+1]
            end
            if currcard~=1 then
              currcard=currcard-1
            end
            allkind,allcard=getallnum()
          end
          recordsave()
          break
        elseif currd==2 then
          break
        end
      elseif (not oldpad:up() and pad:up()) or (not oldpad:down() and pad:down()) then
        if currd==1 then
          currd=2
        else
          currd=1
        end
      end
      screen.flip()      
      screen.waitVblankStart()
      oldpad=pad
    end
  elseif (not oldpad:up() and pad:up()) or (not oldpad:down() and pad:down()) then
    if currde==1 then
      currde=2
    else
      currde=1
    end
  end
  screen.flip()      
  screen.waitVblankStart()
  oldpad=pad
end
  