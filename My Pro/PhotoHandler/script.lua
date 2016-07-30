appdir = System.currentDirectory().."/"
bcs = Image.load(appdirectory.."img/bcs.png")
screen:blit(0, 0, bcs, 0, 0, bcs:width(), bcs:height(), false)
screen.flip()
screen:clear() 
screen.waitVblankStart(120)

--load root
dofile(apdir .."root.lua")

--load config
dofile(apdir .."config.lua")

--load function
dofile(apdir .."function.lua")

--