--Code d'affichage du splashscreen anti iso de la ligue anti isos illégaux de PSPGEN
---------------Code par kamelancien458 commenté par maxthebest-------------------
partie1 = Image.load("SPLASHMESSAGE/messagep1.jpg")--On charge les images
partie2 = Image.load("SPLASHMESSAGE/messagep2.jpg")--
partie3 = Image.load("SPLASHMESSAGE/messagep3.jpg")--
temps = 0--Initialisation de la variable du timer

function message()--Fonction d'affichage du message
temps = temps + 1--On incrémente temps de 1
if temps < 100 then--Affichage de la 1ere image
screen:blit(0,0,partie1)
end
if temps > 100 and temps < 200 then--2eme
screen:blit(0,0,partie2)
end
if temps > 200 and temps < 300 then--3eme
screen:blit(0,0,partie3)
end
if temps > 300 then--Affichage du splash terminé, donc on lance le fichier XXX.lua qui est notre jeu/menu
dofile("Script1.lua")
end
if temps > 300 then
s.exit()
end

end

while true do--Boucle principale
screen:clear()
message()--On lance la fonction message

screen.flip()
screen.waitVblankStart()
end
