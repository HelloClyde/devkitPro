file=io.open("ms0:/PSP/common/test/neweboot.pbp", "wb")

file:seek("set",0)
file:write(string.char(0) ..string.char(80) ..string.char(66) ..string.char(80) ..string.char(0) ..string.char(0) ..string.char(1) ..string.char(0))

for i=8,39 do
  file:seek("set",i)
  file:write(string.char(0))
end

txt=io.open("ms0:/PSP/common/test/t.txt", "wb")

file:seek("set",0)
for i=1,5 do
  fe=io.open("ms0:/PSP/common/test/" ..i, "rb")
  fn=file:seek("end")
  txt:write(fn ..",")
  file:write(fe:read("*a"))
  fe:close()
end
txt:close()
file:close()
  