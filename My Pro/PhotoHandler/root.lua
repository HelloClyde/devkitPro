--ÑÕÉ«
red = Color.new(255, 0, 0);
black = Color.new(0, 0, 0);
blue = Color.new(0, 0, 255); 
yellow = Color.new(255, 255, 0); 
white = Color.new(255, 255, 255);
navy = Color.new(0, 0, 160);
green = Color.new(0, 128, 0);
lila = Color.new(255, 0, 255);
orange = Color.new(255, 128, 64);
grey = Color.new(192, 192, 192);
hellgreen = Color.new(0, 255,0);
grey2 = Color.new(50, 50, 50);
bgc = Color.new(255, 255, 255);
--Í¼Æ¬

filbrbg = Image.load(appdirectory.."img/filbrbg.png")
folder = Image.load(appdirectory.."img/folder.png")
folder_over = Image.load(appdirectory.."img/folder_over.png")
backspace = Image.load(appdirectory.."img/backspace.png")
backspace_over = Image.load(appdirectory.."img/backspace_over.png")
picsz = Image.load(appdirectory.."img/picsz.png") 

kb_bg = Image.load(appdirectory.."img/kb_bg.png")
kb_overlay = Image.load(appdirectory.."img/kb_overlay.png")
kb_overlayB = Image.load(appdirectory.."img/kb_overlay_B.png")
kb_overlayA = Image.load(appdirectory.."img/kb_overlay_A.png")
kb_highlight = Image.load(appdirectory.."img/kb_highlight.png")


--
sec1 = Color.new(0, 0, 0);
sec2 = Color.new(0, 0, 0);
sec3 = Color.new(0, 0, 0);
sec4 = Color.new(0, 0, 0);
sec5 = Color.new(0, 0, 0);
seb1 = Color.new(0, 0, 0);
seb2 = Color.new(0, 0, 0);

--ÆäËü
bgx = 480  --width of canvas 
bgy = 272  --height of canvas
sens = 64  --cursorsensitivity

linebreak = "\n"  
font=Font.load(appdirectory.."img/font.ttf") 
font:setPixelSizes(0,10) 

r = 255
g = 255
b = 255
a = 0
color = Color.new(r, g, b, a)

tra = 0
--
s = 1
k = 0
System.currentDirectory("ms0:/PSP/PHOTO")
fl=System.listDirectory()
nf=table.getn(fl) 

oldpad = Controls.read() 
selecb = 1
selecc = 1
selecd = 1
ver = "Pro"
cho = 0
nem = 0
bgstyle = 1
pname = "untitled"
bgset = "color"


text = ""
select = { }
black = Color.new(0, 0, 0)
mode = 0
--
r_sec = 0
g_sec = 0
b_sec = 0
sec_color = Color.new(r_sec,g_sec,b_sec)
brsh = 1 

menubg1 = Color.new(255, 255, 255);
menubg2 = Color.new(255, 255, 255);
menubg3 = Color.new(255, 255, 255);
menubg4 = Color.new(255, 255, 255);
cursor = Image.load(appdirectory.."img/cursor.png")
cursor_fill = Image.load(appdirectory.."img/cursor_fill.png")
cursor_eff = Image.load(appdirectory.."img/cursor_eff.png")
cursor_gra = Image.load(appdirectory.."img/cursor_brush.png")
cursor_sta = Image.load(appdirectory.."img/cursor_sta.png")
cursor_er = Image.load(appdirectory.."img/cursor_er.png")
cursor_pip = Image.load(appdirectory.."img/cursor_pip.png")
cursor_zoo = Image.load(appdirectory.."img/cursor_zoo.png")
cursor_fon = Image.load(appdirectory.."img/cursor_fon.png")
cursor_rgb = Image.load(appdirectory.."img/cursor_rgb.png")
alphabg = Image.load(appdirectory.."img/alpha.png")
brpath = "brushes/brush"
brush = Image.load(appdirectory.."brushes/1.png")
cobg = Image.load(appdirectory.."img/cobg.png") 
cobg1 = Image.load(appdirectory.."img/cobg.png") 
cobg2 = Image.load(appdirectory.."img/cobg.png") 
cobg3 = Image.load(appdirectory.."img/cobg.png") 
cobgo = Image.load(appdirectory.."img/cobgo.png") 
conf1 = Color.new(0,0,0) 
conf2 = Color.new(0,0,0)
grabru = Image.load(appdirectory.."img/graffitibrushes.png") 
txfo=Font.load(appdirectory.."fonts/1.ttf") 
txfo:setPixelSizes(0,14)  

cursor_draw = Image.load(appdirectory.."img/cursor_draw.png")
mainmenubg = Image.load(appdirectory.."img/mainmenu.png")
botmenubg = Image.load(appdirectory.."img/botmenu.png")
botfont = Image.load(appdirectory.."img/botfont.png") 
menr = Image.load(appdirectory.."img/menr.png")
menr2 = Image.load(appdirectory.."img/menr2.png")
menr3 = Image.load(appdirectory.."img/menr3.png")
menr4 = Image.load(appdirectory.."img/menr4.png")
menb = Image.load(appdirectory.."img/menb.png") 
over1 = Image.load(appdirectory.."img/over1.png")
over2 = Image.load(appdirectory.."img/over2.png")
ma1pic = Image.load(appdirectory.."img/ma1pic.png")
ma2pic = Image.load(appdirectory.."img/ma2pic.png")
ma3pic = Image.load(appdirectory.."img/ma3pic.png")
ma4pic = Image.load(appdirectory.."img/ma4pic.png")
bo1pic = Image.load(appdirectory.."img/bo1pic.png")
bo2pic = Image.load(appdirectory.."img/bo2pic.png")
bat3 = Image.load(appdirectory.."img/bat3.png")
bat2 = Image.load(appdirectory.."img/bat2.png")
bat1 = Image.load(appdirectory.."img/bat1.png")
bat0 = Image.load(appdirectory.."img/bat0.png")
palette = Image.load(appdirectory.."img/palette.png")
rgbline = Image.load(appdirectory.."img/rgbline.png")
rgbcol = Image.load(appdirectory.."img/rgbcol.png") 
cur_bru = Image.load(appdirectory.."img/cur_bru.png")  
pal_full = Image.load(appdirectory.."img/pal_full.png")
battery = System.powerGetBatteryLifePercent() 
lt = System.powerGetBatteryLifeTime()
delbg1 = Color.new(255, 255, 255);
delbg2 = Color.new(255, 255, 255);
delbg3 = Color.new(255, 255, 255);
recsetc1 = Color.new(0, 0, 0);
recsetc2 = Color.new(0, 0, 0);
recsetc3 = Color.new(0, 0, 0);
menscolor1 = Color.new(0, 0, 0);
menscolor2 = Color.new(0, 0, 0);
menscolor3 = Color.new(0, 0, 0);
savc1 = Color.new(0, 0, 0);
savc2 = Color.new(0, 0, 0);
savc3 = Color.new(0, 0, 0);
savc4 = Color.new(0, 0, 0);
savc5 = Color.new(0, 0, 0);
ccl1 = Color.new(0, 0, 0);
ccl2 = Color.new(0, 0, 0);
ccl3 = Color.new(0, 0, 0);
trcl1 = Color.new(0, 0, 0);
trcl2 = Color.new(0, 0, 0);
  
x0 = 50
y0 = 50
x1 = 0
y1 = 0
x2 = 8
y2 = 218
x3 = 0
y3 = 0
x4 = 0
y4 = 0
rx = 106
ry = 113
gx = 106
gy = 129
bx = 106
by = 145
rgbnum = 1
w = 40
h = 30
recx = 10
recy = 10
crs = cursor
sx = 431
sy = 119
selx = 1
sely = 1
brsz = 1
snap = 0.20
eff = 1
seco = 1
comode = 0
prmode = 0
opmode = 0
bronu = 1
conf = 0
wed = 0
over = over1
r = 1
ra = 10
rb = 10
nem = 0
box = 12
boy = 10
ma = 1
linfu = 0
bo = 1
cel = 1
del = 1
eel = 1
linsel = 1
grx = bgx + 100
gry = bgy + 100
umode = 0
resi = 0
restri = "Off"
forc = 0
scale = 1
recstyle = "wireframe"
recvis = 1
ac = "activated"
recset = 1
radius = 7
tx = 0
ty = 0
fosi = 14
cpuset = 2
cpu = "333"
ment = 0
text = "Your text here"
oldpad = Controls.read()
name2="ms0:/PSP/PHOTO/BermudaCS_Pic_"
endung=".png"
nummer = 0
fonu = 1
granu = 1
circlestyle="wireframed"
cs = 1
cm = 1
cangle = 360
cgac = 0
layer1 = bg
thickness = 1
hy = 10
ho = 10
trimenu = 1
polylength = 20

savepath = "ms0:/PSP/PHOTO/"

lfont = System.listDirectory(appdirectory.."fonts/")
fontlimit = table.getn(lfont)

lbrush = System.listDirectory(appdirectory.."brushes/")
brushlimit = table.getn(lbrush)
