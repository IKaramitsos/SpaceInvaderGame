"This code is used to create the Space Invader Menu providing the title of the game, a small description for the Goal of this space invader's game version, 
and a clickable button to launch the game. To use this code open a workspace and ctrl+d(run) the code! The size and position of the Menu is well suited
/designed for a fullscreen use of the Squeak Environment. If the Squeak environment isn't extented/maximized edit the position of all container, title, goal, button 
position as well as the launchable Space Invader code. Game can be draggable to be suited easily in smaller dimensions."

| centerPoint container title goal button |

container := RectangleMorph new.
container color: Color black.
container borderColor: Color green.
container borderWidth: 4.
container extent: 350 @ 250.

centerPoint := 960@500.
container position: centerPoint - (container extent // 2).

title := StringMorph contents: 'Space Invader Game'.
title font: (StrikeFont familyName: #Atlanta size: 32).
title color: Color green.
title position: 850 @ 420.
container addMorph: title.

goal := StringMorph contents: 'Goal: Destroy as many aliens you can in 120 seconds!'.
goal font: (StrikeFont familyName: #Atlanta size: 18).
goal color: Color green.
goal extent: 310 @ 40.
goal position: 805 @ (title position y + 60).
container addMorph: goal.

button := StringMorph contents: 'Start!'.
button font: (StrikeFont familyName: #Atlanta size: 28).
button color: Color green.
button borderWidth: 3.
button borderColor: Color green.
button extent: 200 @ 60.
button position: 925 @ (container extent y + 300).

button on: #mouseDown send: #value to: [
    | game |
    game := SpaceInvader new.
    game openInWorld.
].
container addMorph: button.

container openInWorld.
