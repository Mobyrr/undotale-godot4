Complete port of undotale for Godot 4.4 with small improvements, fixes and more features like :
- damage calculation (with defense)
- attack damage intensity (probably bad formula)
- hud updating (hp, level, character name ...)
- items (healing items)
- acting

Thanks to :
- SamuelWolfang for creating undotale for godot 3
- etherealxx for partially porting undotale to godot 4

##### About the repo creator
The creator of this repo lost interest, don't really want to work on this anymore, busy with his work. If you wish to contribute, feel free to contact me (the current fork owner). It's highly encouraged! <3

Previous readme file are down below:

---

# _UNDOTALE_
An UNDERTALE Engine recreated inside of Godot!

[![UNDOTALE Icon](https://i.imgur.com/QO3vGGK.png)](https://i.imgur.com/QO3vGGK.png)

## What is UNDOTALE?
The main plan for this engine is to make it as accessible as possible in terms of modding.
The end result should allow anyone to modify a pre-made template (or create their own) for cutscenes, attacks and dialouge.
Basically Unitale, but with Godot and GDScript. You'll be able to make your own mods with the help of a GUI for development (contrary to Lua) and a plain simple simil-python programming language, very easy to understand and manipulate.

## What works at the moment?
As you may have guessed, the engine is not finished yet.
I semi-finished it a few months ago before deciding to abandon it and move on to other things.
I've started rewriting it from scratch a few weeks ago, and this is where we stand now:

| Mechanic | Status |
| ------ | ------ |
| FIGHT | The basis for the turn-based system is there and it basically done. Cutscenes and Attacks need to be implemented, but those are for the user to decide. So the modding system needs to be finished for those to be working. |
| ACT | Same as for FIGHT, but the actual behaviour needs to be implemented as well. |
| ITEMs | The base for it is finished! They still need personalization, a stock list of items where to look from with relative sounds, and it should be done!|
| MERCY | Finished except for sound and animation. |
| OVERWORLD | Currently not in the works. I'm planning to start working on it once the battle engine is done.|

## Miscellaneous
| Feature | Status |
| ------ | ------ |
| SOULs | Blue and Red souls are implemented by default. The user will be able to add more! Blue soul needs to be patched up a little. |
| BOX and COLLISIONS | Both masking and collisions work pretty well! Without any shader of any kind. They're surely not 1:1 with UNDERTALE, since those used clamping and mine use actual collision shapes. Still, they work fine! |
| BOX RESIZING | Primal support was added! Can be resized only from the middle and the top left at the moment. Further directions will be added later. |

## Usage
Requirements:
- Godot version 3.3 or higher (No guarantee for the future 4.0, for previous versions or for betas/alphas)
- That's it!

1. Download this repository
2. Place the folder containing the project somewhere you like
3. Open Godot
4. Click on "Import" from the menu on the right
5. Select the .godot project file inside of the folder you downloaded
6. Have fun messing around!

## License
The project is free and falls under the MIT license.
Selling a compiled version of this project as is without removing UNDERTALE assets, however, will result in copyright infringement torwards the current UNDERTALE owner.
*UNDERTALE is a creation of Toby Fox.*
Most of the assets were taken or copied from them and are therefore not mine.
Only thing I have to take credit for is the code I wrote and nothing else.
[Where I got the sprites.](https://www.spriters-resource.com/pc_computer/undertale/)

Same goes for the fonts included:
| Font | Author |
| ------ | ------ |
| DETERMINATION | by [Haley Wakamatsu](https://www.behance.net/gallery/31268855/Determination-Better-Undertale-Font) |
| hachiro | by [Flucky Frog](https://www.dafont.com/hachicro.font) |
| Mars Needs Cunnilingus | by [Unknown](https://fonts2u.com/mars-needs-cunnilingus.font) |
| Pixel Comic Sans | by [ColorSwitchFan25](https://fontstruct.com/fontstructions/show/1534860/pixel-comic-sans-undertale-sans-font) |
| UT HP Font | by [SevenC](is.gd/uthpfont) |

## CONTACTS (original repo owner)
In case you have any issue you would like to disclose, down here you can find several contact info.

_Discord tag:_ **samuelwolfang**
_Email:_ [soupsam02@gmail.com](mailto:soupsam02@gmail.com)
