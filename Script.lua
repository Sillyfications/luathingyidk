--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--


hasShotgun = false
ammoCount = 0
loadedAmmo = 0
healingCount = 0
numberAsString = ""
enteredTnl1 = false
enteredTnl2 = false
enteredTnl3 = false
alreadyReloaded = false
bulletChamber = 0
chambersShot = 0
gotAmmo = false

function story(aName)
	if(aName == "start") then
		setBackground("note.JPG")
		createTextfield("You find a note on the ground, not sure to pick it up or not.\n Will you pick up the note?")
		createButton("note", "Pick up the note and read it.")
		createButton("end", "Ignore the note and go further with your day.")
	end



	if(aName == "note") then
		
		CLS();
		setBackground("note.JPG");
		createTextfield("You pick up the note...\n It says that there is a treasure in an abandoned mine,\n but there is a monster guarding it.")
		createButton("mineGate", "Go to the mine.");
		createButton("theend", "Don't go to the mine and go further with your day.")
		
	end

	if(aName == "mineGate") then
		CLS();
		setBackground("mine1.jpg")
		createTextfield("You enter the mines and there are 3 tunnels\n and one door with a padlock on it.")
		createButton("mine1", "Next...");
	end

	if(aName == "mine1") then
		CLS();
		setBackground("mine1.jpg")
		createTextfield("You start to think that the key is not in this mine,\n maybe you can use something that can break padlocks...")
		createButton("tnl1", "Go to the first tunnel.")
		createButton("tnl2", "Go to the second tunnel.")
		createButton("tnl3", "Go to the third tunnel.")
		
	end

	if(aName == "tnl1") then
		CLS();
		setBackground("mine2.jpg")
		createTextfield("You see a room with storage crates,\n you see a crowbar nearby.\n You decide to pick it up.")
		createButton("tnl12", "Next...");
	end

	if(aName == "tnl12") then
		CLS();
		setBackground("mine2.jpg")
		createTextfield("Now you open the crates and you get...")
		createButton("tnl13", "Next...");
	end

	if(aName == "tnl13") then
		CLS();
		playSound("pickup.wav")
		setBackground("mine2.jpg")
		hasShotgun = true
		createTextfield("One pump action shotgun!\n This can break the lock for sure!")
		createButton("tnl14", "Next...");
	end

	if(aName == "tnl14") then
		CLS();
		setBackground("mine2.jpg")
		enteredTnl1 = true
		createTextfield("You look into the chamber of the weapon,\n it's empty!\n There must be ammo somewhere.")
		createButton("mine2", "Go back to the enterance.");
	end
	
	if(aName == "tnl2") then
		CLS();
		setBackground("mine2.jpg")
		createTextfield("You see food grade containers.")
		createButton("tnl22", "Next...");
	end

	if(aName == "tnl22") then
		CLS();
		setBackground("mine2.jpg")
		createTextfield("You decide to open the containers and you get...")
		createButton("tnl23", "Next...");
	end

	if(aName == "tnl23") then
		CLS();
		playSound("pickuplegendary.wav")
		setBackground("mine2.jpg")
		healingCount = 3
		enteredTnl2 = true
		if (hasShotgun == true) then
			createTextfield("3 medkits and a broken key.\n So the key was there, but it's unusable...\n Good thing we found the shotgun.")
		else
			createTextfield("3 medkits and a broken key.\n So the key was there, but it's unusable...")
		end
		createButton("mine2", "Next...");
	end

	if(aName == "tnl3") then
		CLS();
		setBackground("mine3.jpg")
		createTextfield("You see a room filled with ammo.")
		createButton("tnl32", "Next...");
	end

	if(aName == "tnl32") then
		CLS();
		setBackground("mine3.jpg")
		createTextfield("You decide get the buckshot and you get...")
		createButton("tnl33", "Next...");
	end

	if(aName == "tnl33") then
		CLS();
		playSound("stw sound.wav")
		setBackground("mine3.jpg")
		
		enteredTnl3 = true
		if (hasShotgun == true) then
			createTextfield("24 rounds of 12 gauge buckshot!")
			gotAmmo = true
			alreadyReloaded = false
		else
			createTextfield("24 rounds of 12 gauge buckshot!\n There must be a shotgun nearby.")
		end
		createButton("mine2", "Go back to the enterance");
	end

	if(aName == "mine2") then
		CLS();
		setBackground("mine1.jpg")
		
		if (hasShotgun == true and alreadyReloaded == false and ammoCount == 0 and gotAmmo == true) then
			playSound("shotgunreload.wav")
			createTextfield("At the enterance you load 6 shells into the shotgun...")
			alreadyReloaded = true
		else
			createTextfield("You look around which tunnels you haven't been into.")
		end
		if (enteredTnl1 == false) then
			createButton("tnl1", "Go in tunnel 1")
		end
		if (enteredTnl2 == false) then
			createButton("tnl2", "Go in tunnel 2")
		end
		if (enteredTnl3 == false) then
			createButton("tnl3", "Go in tunnel 3")
		end
		if (enteredTnl1 == true and enteredTnl2 == true and enteredTnl3 == true) then
			createButton("door1", "Shoot the lock off the door.")
		end
	end

	if(aName == "door1") then
		CLS();
		setBackground("mine1.jpg")
		playSound("shotguncock.wav")
		createTextfield("You chamber the shotgun and aim the barrel towards the lock.")
		createButton("door2", "Next....")
	end

	if(aName == "door2") then
		CLS();
		setBackground("mine1.jpg")
		createTextfield("You slowly pull the trigger and...")
		createButton("door3", "Next....")
	end

	if(aName == "door3") then
		CLS();
		setBackground("mine1.jpg")
		playSound("shotgunshoot.wav")
		createTextfield("...the lock was destroyed!")
		loadedAmmo = loadedAmmo - 1
		createButton("door4", "Next....")
	end

	if(aName == "door4") then
		CLS();
		setBackground("mine1.jpg")
		playSound("shotguncock.wav")
		playSound("shell.wav")
		createTextfield("You eject the spent shell out and enter the door.")
		createButton("door5", "Next....")
	end

	if(aName == "door5") then
		CLS();
		setBackground("shaft1.jpg")
		createTextfield("You see the so called monster that the note was mentioning.")
		createButton("door6", "Next....")
	end

	if(aName == "door6") then
		CLS();
		setBackground("shaft1.jpg")
		createTextfield("It's a person that went also in the mine,\n because of the note.")
		createButton("door7", "Next....")
	end

	if(aName == "door7") then
		CLS();
		setBackground("shaft1.jpg")
		createTextfield("He dares you to play Russian Roulette \nwith him, do you want to play?")
		createButton("rev", "Play roulette.")
	end

	if(aName == "rev") then
		CLS();
		setBackground("shaft1.jpg")
		createTextfield("The winner gets all the treasure!\n says the person and starts to load all \nthe chambers of his revolver")
		--bulletChamber = 0 + random(1,6)
		createButton("rev1", "Next...")
	end

	if(aName == "rev1") then
		CLS();
		setBackground("shaft1.jpg")
		createTextfield("He hands you the revolver.")
		createButton("rev2", "Aim the barrel towards your head.")
		
	end

	if(aName == "rev2") then
		CLS();
		setBackground("shaft1.jpg")
		playSound("revolvercock.wav")
		chambersShot = chambersShot + 1
		createTextfield("You slowly pull the trigger and...")
		createButton("rev3", "Pull the trigger.")
		createButton("atk", "Attack the person.")
		
	end

	if(aName == "rev3") then
		CLS();
		setBackground("death.jpg")
		playSound("revolvershoot.wav")
		createTextfield("Should have read! You died! The end!")
		createButton("exit", "Close the game")
	end
		
	
	
	if(aName == "atk") then
		CLS();
		setBackground("shaft1.jpg")
		createTextfield("You drop the revolver...")
		createButton("atk2", "Next....")
	end

	if(aName == "atk2") then
		CLS();
		setBackground("shaft1.jpg")
		playSound("shotgunshoot.wav")
		createTextfield("And you blow his head off.")
		createButton("atk3", "Next....")
	end

	if(aName == "atk3") then
		CLS();
		setBackground("shaft2.jpg")
		playSound("pickup.wav")
		createTextfield("You take all of the treasure and go home.")
		createButton("winner", "Next....")
	end


	if(aName == "winner") then
		CLS();
		createTextfield("You win!")
		createButton("exit", "Close game")
	end
	
	if(aName == "end") then
		CLS();
		createTextfield("You win I guess?")
		createButton("exit", "Close game")
	end


	
	if(aName == "exit") then
		exitGame();
	end
end

