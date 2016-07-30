white = Color.new(255,255,255)

counter = Timer.new() 

counter:start()  

while true do
	screen:clear() 

	currentTime = counter:time()

	screen:print(10,10,"Counter Time: " .. currentTime,white) 

	if currentTime < 1000 then
		screen:print(100,100,"Less than 1000",white)
	end 

	if currentTime > 1000 and currentTime < 2000 then
		screen:print(100,100,"Greater than 1000",white)
	end

	if currentTime > 2000 then
		counter:reset(0)
		counter:start()
	end 

	screen.waitVblankStart()
	screen.flip() 
end 
