red = Color.new(255, 0, 0);
black = Color.new(0, 0, 0);
white = Color.new(255, 255, 255);

canvas = Image.createEmpty(480, 272)
canvas:clear(white)

brush = {}
eraser = {}

x0 = 0
y0 = 0
x1 = 0
y1 = 0
while true do
         pad = Controls.read()
         dx = pad:analogX()
         if math.abs(dx) > 32 then
                 x0 = x0 + dx / 64
         end
         dy = pad:analogY()
         if math.abs(dy) > 32 then
                 y0 = y0 + dy / 64
         end
         if pad:cross() then
                 canvas:drawLine(x0, y0, x1, y1, black)
         end
         x1 = x0
         y1 = y0
         screen:blit(0, 0, canvas, 0, 0, canvas:width(), canvas:height(), false)
         screen:drawLine(x1 - 5, y1, x1 + 5, y1, red)
         screen:drawLine(x1, y1 - 5, x1, y1 + 5, red)
         screen.waitVblankStart()
         screen.flip()
         if pad:start() then break end
         if pad:select() then screen:save("screenshot.tga") end
end