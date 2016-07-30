function loadebootimage(fp)

file=io.open(fp, "rb")

function get(pos)
file:seek("set",pos)
b1=string.byte(file:read(1))
file:seek("set",pos+1)
b2=string.byte(file:read(1))
file:seek("set",pos+2)
b3=string.byte(file:read(1))
file:seek("set",pos+3)
b4=string.byte(file:read(1))
return b1+b2*256+b3*256*256+b4*256*256*256
end

fn=file:seek("end")

a=8
n=1
p={}
while true do
t=get(a)
if t<fn then
  p[n]=t
  n=n+1
  a=a+4
else
  break
end
end

n=0
while true do
  if p[n+1]~=nil then
    n=n+1
  else
    break
  end
end

for i=1,n do
  j=i+1
  while j<=n do
    if p[i]==p[j] then
      p[j]=p[n]
      p[n]=nil
      n=n-1
    else
      j=j+1
    end
  end
end

n=1
while true do
 if p[n] then
  file:seek("set",p[n])
  k1=string.byte(file:read(1))
  file:seek("set",p[n]+1)
  k2=string.byte(file:read(1))
  file:seek("set",p[n]+2)
  k3=string.byte(file:read(1))
  if k1==137 and k2==80 and k3==78 then
    if p[n+1] then
      file:seek("set",p[n])
      if pic1==nil then
        pic1=Image.loadFromMemory(file:read(p[n+1]-p[n]))
      else
        pic2=Image.loadFromMemory(file:read(p[n+1]-p[n]))
        break
      end
    else
      file:seek("set",p[n])
      if pic1==nil then
        pic1=Image.loadFromMemory(file:read(fn-p[n]))
      else
        pic2=Image.loadFromMemory(file:read(fn-p[n]))
      end
      break
    end
  end
  n=n+1
 else
    break
 end
end

file:close()

return pic1,pic2
end