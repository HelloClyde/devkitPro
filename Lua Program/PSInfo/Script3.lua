fond = Image.load("Images/fond d'ecran3.png")
souris = Image.load("Images/souris.png")
bleu = Color.new(0,17,55)
violet = Color.new(106,48,255)

x = 240
y = 136 

adresse_mac = Adhoc.getMac()
firmware = System.cfwVersion()
pseudo = System.nickName()
ms = System.getFreeSpace("ms0:/")
modele = System.getModel(1)

ms = ms / 1024/1024

degre_de_batterie = System.powerGetBatteryTemp()
temps_restant = System.powerGetBatteryLifeTime()
pourcent = System.powerGetBatteryLifePercent()
batterieexist = System.powerIsBatteryExist()
volt_batterie = System.powerGetBatteryVolt()


while true do 
pad = Controls.read() 
screen:clear()
screen:blit(0,0,fond)
screen:blit(x,y,souris)

heure = System.getTime(1)
mins = System.getTime(2)
secs = System.getTime(3) 

jour = System.getDate(1) 
moi = System.getDate(2)
annee = System.getDate(5)


screen:print(20,20,"Informations Systeme: ",bleu)
screen:print(20,40,"Pseudo: "..pseudo,violet)
screen:print(20,50,"Firmware: "..firmware,violet)
screen:print(20,60,"Modele PSP: "..modele,violet)
screen:print(20,70,"Il est "..heure..":"..mins..":"..secs,violet)
screen:print(20,80,"Nous sommes le "..jour.."/"..moi.."/"..annee,violet)
screen:print(20,90,"Taille restante sur le Memory Stick: "..ms.." mo",violet)
screen:print(20,100,"Adresse Mac: "..adresse_mac,violet)
screen:print(20,140,"Informations sur la batterie: ",bleu)
screen:print(20,160,"Pourcentage de la batterie: "..pourcent.."%",violet)
screen:print(20,170,"Temps Restant: "..temps_restant.." minutes",violet)
screen:print(20,180,"Temperature de la batterie: "..degre_de_batterie.."C",violet)
screen:print(20,190, "Tension de la batterie: "..volt_batterie.." mV",violet)

if pad:cross() and x >= 143 and x <= 358  and y >= 232 and y <= 261 then
dofile ("Script1.lua")
end


if math.abs(pad:analogY()) > 32 then
y = y + pad:analogY() / 32;
end

if math.abs(pad:analogX()) > 32 then
x = x + pad:analogX() / 32;
end

if x < 0 then x = 0 elseif x + souris:width() > 480 then x = 480 -  souris:width() end
if y < 0 then y = 0 elseif y + souris:height() > 272 then y = 272 -  souris:width() end

screen.flip()
screen.waitVblankStart()
end
