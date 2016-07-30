--创世纪电玩
--店主信息软件
--作者：kydkong

function logo()
	logo=Image.load("Img/logo.png")
	oldpad=Controls.read()
	while true do
		pad=Controls.read()
		screen:blit(0,0,logo)
		screen.flip()
		screen.waitVblankStart()
		if pad:circle()==false and oldpad:circle()==true then
			break
		end
		oldpad=pad
	end
end

function main()
	bg=Image.load("Img/bg.png")
	icon1=Image.load("Img/icon1.png")
	icon2=Image.load("Img/icon2.png")
	icon3=Image.load("Img/icon3.png")
	oldpad=Controls.read()
	while true do
		pad=Controls.read()
		screen:blit(0,0,bg)
		screen:blit(
		screen.flip()
		screen.waitVblankStart()
		if pad:circle()==false and oldpad:circle()==true then
			break
		end
		oldpad=pad
	end
end