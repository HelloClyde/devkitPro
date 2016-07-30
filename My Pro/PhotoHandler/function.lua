function keyboard()
textInputed = false
text=""
while (textInputed == false) do
length = string.len(text) 
oldpad = pad
pad = Controls.read()

dx = pad:analogX()
dy = pad:analogY()

if (dx > 64) then

select.x = 3

if (dy > 64) then
hx=274
hy=198
elseif (dy < -64) then
hx=274
hy=80
else
hx=274
hy=140
end

elseif (dx < -64) then

select.x = 1

if (dy > 64) then
hx=152
hy=200
elseif (dy < -64) then
hx=152
hy=80
else
hx=152
hy=140
end

else

select.x = 2

if (dy > 64) then
hx=213
hy=200
elseif (dy < -64) then
hx=213
hy=80
else
hx=213
hy=140
end

end
if (dy > 64) then
select.y = 3
elseif (dy < -64) then
select.y = 1
else
select.y = 2
end

if (pad ~= oldpad) then

if (mode == 0) then
if (pad:cross()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "b"
end
if (select.y == 2) then
text = text .. "k"
end
if (select.y == 3) then
text = text .. "s"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "e"
end
if (select.y == 2) then
text = text .. " "
end
if (select.y == 3) then
text = text .. "v"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "h"
end
if (select.y == 2) then
text = text .. "p"
end
if (select.y == 3) then
text = text .. "y"
end
end
end

if (pad:square()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "a"
end
if (select.y == 2) then
text = text .. "j"
end
if (select.y == 3) then
text = text .. "r"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "d"
end
if (select.y == 2) then
text = text .. "m"
end
if (select.y == 3) then
text = text .. "u"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "g"
end
if (select.y == 2) then
text = text .. "o"
end
if (select.y == 3) then
text = text .. "x"
end
end
end


if (pad:circle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "c"
end
if (select.y == 2) then
text = text .. "l"
end
if (select.y == 3) then
text = text .. "t"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "f"
end
if (select.y == 2) then
text = text .. "n"
end
if (select.y == 3) then
text = text .. "w"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "i"
end
if (select.y == 2) then
text = text .. "q"
end
if (select.y == 3) then
text = text .. "z"
end
end
end

if (pad:triangle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. ","
end
if (select.y == 2) then
text = text .. "-"
end
if (select.y == 3) then
text = text .. "("
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "."
end
if (select.y == 2) then
text=string.sub(text, 1,length-1)
end
if (select.y == 3) then
text = text .. ":"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "!"
end
if (select.y == 2) then
text = text .. "?"
end
if (select.y == 3) then
text = text .. ")"
end
end
end
elseif mode == 2 then
if (pad:cross()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "B"
end
if (select.y == 2) then
text = text .. "K"
end
if (select.y == 3) then
text = text .. "T"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "E"
end
if (select.y == 2) then
text = text .. "N"
end
if (select.y == 3) then
text = text .. "W"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "H"
end
if (select.y == 2) then
text = text .. "Q"
end
if (select.y == 3) then
text = text .. "Z"
end
end
end

if (pad:square()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "A"
end
if (select.y == 2) then
text = text .. "J"
end
if (select.y == 3) then
text = text .. "S"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "D"
end
if (select.y == 2) then
text = text .. "M"
end
if (select.y == 3) then
text = text .. "V"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "G"
end
if (select.y == 2) then
text = text .. "P"
end
if (select.y == 3) then
text = text .. "Y"
end
end
end


if (pad:circle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "C"
end
if (select.y == 2) then
text = text .. "L"
end
if (select.y == 3) then
text = text .. "U"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "F"
end
if (select.y == 2) then
text = text .. "O"
end
if (select.y == 3) then
text = text .. "X"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "I"
end
if (select.y == 2) then
text = text .. "R"
end
if (select.y == 3) then
text = text .. ""
end
end
end
else

if (pad:circle()) then

if (select.x == 1) then
if (select.y == 1) then
text = text .. "1"
end
if (select.y == 2) then
text = text .. "4"
end
if (select.y == 3) then
text = text .. "7"
end
end
if (select.x == 2) then
if (select.y == 1) then
text = text .. "2"
end
if (select.y == 2) then
text = text .. "5"
end
if (select.y == 3) then
text = text .. "8"
end
end
if (select.x == 3) then
if (select.y == 1) then
text = text .. "3"
end
if (select.y == 2) then
text = text .. "6"
end
if (select.y == 3) then
text = text .. "9"
end
end
end

if (pad:cross()) then

if (select.x == 1) then
if (select.y == 1) then
end
if (select.y == 2) then
end
if (select.y == 3) then
end
end
if (select.x == 2) then
if (select.y == 1) then
end
if (select.y == 2) then
text = text .. " "
end
if (select.y == 3) then
end
end
if (select.x == 3) then
if (select.y == 1) then
end
if (select.y == 2) then
end
if (select.y == 3) then
text = text .. "0"
end
end
end


end

if (pad:r()) then
if (mode == 1)then
mode = 0
else
mode = 1
end
end
if (pad:l()) then
if (mode == 2)then
mode = 0
else
mode = 2
end
end

if pad:right() then text = text.."/" end

if (pad:start()) then
textInputed = true
end

end

screen:blit(0, 0, kb_bg)
screen:blit(hx, hy, kb_highlight)
if (mode == 1)then
screen:blit(0, 0, kb_overlayB)
elseif (mode == 2) then
screen:blit(0, 0, kb_overlayA)
else
screen:blit(0, 0, kb_overlay)
end
screen:print(50, 38, text, black)
screen.flip()
screen.waitVblankStart()
screen:clear()

end
return text
end

function scleImage(newX, newY, theImage) 

rsizedImage = Image.createEmpty(newX, newY) 
for x = 1, newX do 
for y = 1, newY do 
rsizedImage:blit(x,y , theImage,
math.floor(x*(theImage:width()/newX)),
math.floor(y*(theImage:height()/newY)),1,1) 
end 
end 
return rsizedImage 

end

function Gu.blit(x, y, image, scale, flip)
  
  if not scale or type(scale) == "string" then 
    flip = scale
    scale = 1
  end
  
  if flip then
    if flip == 1 then
      x_start = image:width()
      y_start = 0
      x_end  = 0
      y_end = image:height()
    elseif  flip == 2 then
      x_start = 0
      y_start = image:height()
      x_end  = image:width()
      y_end = 0
    elseif flip == 3 then
      x_start = image:width()
      y_start = image:height()
      x_end = 0
      y_end = 0
    end
  else
    x_start = 0
    y_start = 0
    x_end = image:width()
    y_end = image:height()
  end
  
  width = (image:width()*scale)+x
  height = (image:height()*scale)+y
  temp = {
  {x_start, y_start, x, y, 0},
  {x_end, y_end, width, height, 0}
  }
  Gu.enable(Gu.TEXTURE_2D)
  Gu.texImage(image)
  Gum.drawArray(Gu.SPRITES, Gu.TEXTURE_32BITF+Gu.VERTEX_32BITF+Gu.TRANSFORM_2D, temp)
end
