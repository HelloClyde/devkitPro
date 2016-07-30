green=Color.new(0,255,0)
white = Color.new(255,255,255) 
player = Image.createEmpty(32,32)
player:clear(white)
block = Image.createEmpty(32,32)
block:clear(green) 
Player = { x = 30, y = 100 } 
playerHeight = 32
playerWidth = 32 
Block = {}
Block[1] = { x = 100, y = 80, height = block:height(), width = block:width() }
Block[2] = { x = 300, y = 30, height = block:height(), width = block:width() }
Block[3] = { x = 200, y = 58, height = block:height(), width = block:width() }
 
function movePlayer()
	pad = Controls.read()
	if pad:left() then
		Player.x = Player.x - 1
	end
	if pad:right() then
		Player.x = Player.x + 1
	end
	if pad:up() then
		Player.y = Player.y - 1
	end
	if pad:down() then
		Player.y = Player.y + 1
	end
end 

function collisionCheck(object)
	if (Player.x + playerWidth > object.x) and (Player.x < object.x + object.width) and (Player.y + playerHeight > object.y) and (Player.y < object.y + object.height) then
		Player.x = oldx
		Player.y = oldy
	end
end 

while true do

	-- store player's position at beginning of each loop
	oldx = Player.x
	oldy = Player.y
	screen:clear()

	movePlayer()

	--check collision for each block
	collisionCheck(Block[1])
	collisionCheck(Block[2])
	collisionCheck(Block[3])

	--paste player to screen
	screen:blit(Player.x,Player.y,player)

	--paste all 3 blocks to screen
	for a = 1,3 do
		screen:blit(Block[a].x,Block[a].y,block)
	end

	screen.waitVblankStart()
	screen.flip()
end
