# Space Invader Game
This repository hosts the Space Invader Game, an educational “project” designed to teach key computer science concepts through game development using Squeak/Smalltalk. The project follows a “trojan horse” mindset, embedding core IT learning objectives such as object-oriented programming, event-driven mechanics and UI/UX design in an engaging and interactive game format.

The implementation is organized in a step-by-step structure with five parts, ranging from basic game environment and spaceship creation to more advanced features and customizations. Each part contains clear context, prerequisites, detailed workflow and challenges to encourage creative extensions and further understanding.

Additional and more thorough educational content and explanation, including release versions containing base and extended code are available via the [Wiki](https://github.com/IKaramitsos/SpaceInvaderGame/wiki) and [Releases](https://github.com/IKaramitsos/SpaceInvaderGame/releases) sections. 

## Table of Contents

- [Part 1: Introduction to the space environment and spaceship](#part-1-introduction-to-the-space-environment-and-spaceship)
- [Part 2: Enemies and mechanics](#part-2-enemies-and-mechanics)
- [Part 3: Introduction to collision and shooting mechanism](#part-3-introduction-to-collision-and-shooting-mechanism)
- [Part 4: UI creation and enhancements](#part-4-ui-creation-and-enhancements)
- [Part 5: Extra features and customizations](#part-5-extra-features-and-customizations)

> [!TIP]
> Make sure that the Squeak Environment  is set up and running correctly before starting the exercise.

---

# Part 1: Introduction to the space environment and spaceship

### Context and motivation:

This part of the exercise introduces a first look at the game and environment. Users engaging the step-by-step process will create classes for the game to start, the background of the game and environment to have a visual representation to work on and add a spaceship which will be the player’s interaction object for the whole game. Post-completion there will be presented with a set of challenges to enrich the game and provide a personal touch on those fundamental steps.

### Prerequisites and learning objectives:

Prerequisites include basic familiarity with the Squeak environment (morphs, coding tools, categories/classes) and theoretical approach of the fundamental object-oriented concepts. Post completion, users will:
* Initialize a project structure/setup using categories and classes in Squeak.
* Implement the main game class with an initialize method to render the basic game environment.
* Define a Ship class and correct its position within the game environment.

### Exercise Workflow:

Having the first interaction with the Squeak environment to create a game can be challenging. Creating any type of project in Squeak that will use Morphs, probably Morphic UI and other squeak’s features need to be established in a Project. That way it can be saved and transferred at ease, renamed and published.

To achieve that after the launch of the Squeak environment at the top left corner select `Projects -> Create MorphicProject`. In this new window a rename is available and a lot of options to navigate to.

In this part a browser is needed and will be used which is essential in the categorization of the project. To do so, `System Browser` will be used. Navigating to the menu at the top bar and selecting `tools -> Browser` or by clicking in World and selecting browser from the drop down list the System Browser a pop up window will be presented. The system browser is used to create the project category, in the first column we create a project called SpaceInvader, which will be the name of the game.

<p align="center">
<img width="480" alt="System Browser(creating the SpaceInvader Category)" src="https://github.com/user-attachments/assets/949d02d2-e6c7-481f-a197-9d6cb20e7608" />
<br>
Figure 1: Creating the SpaceInvader category in the System Browser
</p>

Category’s functionality is to group the code together as well as provide assistance that will be visible on later parts. As it can be noticed in the lowest part of the system browser(image) there is a comment about the Space Invader class.
> [!TIP]
> While building/programming anything in the Squeak environment, using comments will assist both the programmer as well as the people that will be sharing or presenting the code so it can be understandable even if a long time has passed.

An initialize method must be created to implement the game’s background. By clicking the all option at the third column write the following code:

```smalltalk
initialize
super initialize.
self position: 100@100.
self extent: 640@480.
self color: Color black.
self setNameTo: 'Space Invader'
```

Save and run the code to get the first visual representation of the game. The position and extent are not mandatory numbers, so it can be possible to change accordingly.

Provided with an environment, now it is time to work on the main object the player will use, the spaceship. A basic approach will be followed. A Ship class will be created and shown in the second column using the RectangleMorph.

<p align="center">
<img width="480" alt="Ship initialization" src="https://github.com/user-attachments/assets/eed720d2-7b8f-42bd-b87d-8c0152275420" />
<br>
Figure 2: Ship>>initialize
</p>

As in the SpaceInvader class, the main class of the game, an initialize method is needed to be created in the Ship class as well. Provide a color, borderColor and an “extent:32@32”. Even after the creation of the initialize method a visual representation of the ship is nowhere to be found. That is why there isn't any initialization in the main game class SpaceInvader.

Creating a new initialization method called initializeShip in SpaceInvader class and calling it in the initialization of SpaceInvader class as follows we get the first look at our ship in the game.

SpaceInvader>>initializeShip
```smalltalk
initializeShip
ship := Ship new.
self addMorph: ship
```
SpaceInvader>>initialize
```smalltalk
initialize
super initialize.
self position: 100@100.
self extent: 640@480.
self color: Color black.
self setNameTo: 'Space Invader'.
self initializeShip.
```

As can be spotted, the basic look of a spaceship is outside of the game environment. A declaration of a temporary variable called myBottomCenter
(naming methods and variables with names that are easy to remember or understand what they are used for helps while programming) is needed. This temporary variable is only visible and known in the method that is being called and it will help position the ship to the environment. By following the code provided and run the code, a first look of the game is presented:

```smalltalk
initializeShip
| myBottomCenter |
ship := Ship new.
myBottomCenter := self bottomCenter.
ship center: myBottomCenter x @ (myBottomCenter y - (ship height * 2)).
self addMorph: ship
```

<p align="center">
<img width="480" alt="First Look" src="https://github.com/user-attachments/assets/306fdb4a-975e-4364-897f-ac74501af344" />
<br>
Figure 3: SpaceInvader Final Part 1 Look
</p>

### Proggression-Extensions:

- [ ] **Challenge 1:** An extended look of the spaceship is needed. Replace the spaceship with a different shape/color or image from the web. Spaceship size must be based on a logical ratio with the game environment.
- [ ] **Challenge 2:** The environment at the current state is really plain and simple. Enrich the environment by changing the background, adding borders, or anything providing a clean look of a SpaceInvader game.

# Part 2: Enemies and mechanics

### Context and motivation:

This part of the exercise introduces the creation of enemies and the mechanics needed for the game to be functional that will be implemented to the ships. Those functionalities are the movement and the logic behind it. Users will create the enemy and their class, initialize enemies in certain positions and implement the logic of movement using the step method. Also the mechanics of the main ship which the player will use will be created. A set of challenges will be available after completion.

### Prerequisites and learning objectives:

Prerequisites for this part is the successful completion of the previous part, basic familiarity with the Squeak environment and understanding of methods.
Post completion, users will:
* Initialize enemies at a certain position and their mechanisms.
* Implement keystrokes and the movement logic for the player’s spaceship using event methods and handlers.
* Grasp the inheritance logic in OOP.

### Exercise Workflow:

After the initialization of the environment and the player’s ship, it is time to give life and purpose to the game by adding moving mechanisms.
The first step to implement that, is to introduce four new methods which will help with the focus in our game window. Those methods are the following:

1. **handlesMouseDown:** Provide the Morphic framework how to handle pressed mouse down events.
2. **handlesMouseOver:** Provide the Morphic framework how to handle events when the mouse cursor is over the game screen.
3. **mouseEnter/mouseLeave:** Provide the Morphic framework on what to do when the mouse is over/not over the game screen.

> [!TIP]
> Names should convey the purpose or role of the Methods/Variables/Function/etc. Avoid cryptic abbreviations that might be hard for other devs to understand (or even your future self).

Those methods, which are really easy to understand based on their name, need to be initialized in our main game’s class to be used properly, which is the SpaceInvader class. Initialize all four methods one by one:

```smalltalk
handlesMouseDown: anEvent
^false
```
```smalltalk
handlesMouseOver: anEvent
^true
```
```smalltalk
MouseEnter: anEvent
anEvent hand newKeyboardFocus: self
```
```smalltalk
MouseLeave: anEvent
anEvent hand releaseKeyboardFocus: self
```

After successfully creating those methods, keystrokes must be assigned, so the player can move the spaceship. To achieve that a method handling the keystrokes and the keystrokes themselves must be created. Only the method is mandatory to follow, keystrokes can be different. Handlekeystroke method will be initialized in the main game class and the keystrokes will be handled in the ship class.
```smalltalk
handleKeystroke: anEvent
| keyString |
keyString := anEvent keyString asLowercase.
ship keystroke: keyString.
```
The keystrokes as stated, can be different in each game version, a classic arrow keys movement will be presented below that is not mandatory to follow.
```smalltalk
keystroke: keyString
keyString = '<left>' ifTrue: [self moveLeft].
keyString = '<right>' ifTrue: [self moveRight].
keyString = '<up>' ifTrue: [self moveUp].
keyString = '<down>' ifTrue: [self moveDown]
```

After saving and running the code, a pop up window is visible. This window is called a pre-debugger window that helps by showcasing errors, debugging the game, testing the code and running it. The reason we get an error is the methods stated, “self moveLeft,moveRight,moveUp,moveDown”, are nowhere to be found.

Moving methods for objects can be stated in many ways. For this exercise we will follow a simple “self axis movement”.
```smalltalk
moveUp
self y: self y + 5.
owner changed
```
```smalltalk
moveDown
self y: self y - 5.
owner changed
```
```smalltalk
moveLeft
self x: self x - 5.
owner changed
```
```smalltalk
moveRight
self x: self x + 5.
owner changed
```
Enemies implementation to game follows the same class and initialization method with our Ship, by using RectangleMorph and color, borderColor and extend. After each new class insertion to game it is needed to call it and initialize it to the main class as follows so it can be visible to the game:

SpaceInvader>>InitializeEnemies
```smalltalk
initializeEnemies
|enemy|
enemy := Enemy new.
enemy position: self position + (100@100).
self addMorph: enemy
```
After creating the initializeEnemies implement it to the already created initialize of the SpaceInvader class.

There is no need to run the code each time. Squeak provides a way to add the enemy class to “Exploring the morph" by “middle clicking” the game, selecting the tool icon and selecting the option “explore morph”.
In this new window there are available all the game’s assets, morphs, colors and information. In the text field available write “self initializeEnemies” and “do it”.

The final step to give life to the enemy object is to add movement. To do so, a step, stepTime and move method will be implemented. All three give out their possible functionality.
```smalltalk
step
self move
```
```smalltalk
stepTime
^ 1500
```
```smalltalk
move
self right: self right + 10.
(self right > owner right)
  ifTrue: [self left: self left - 10]
```

### Proggression-Extensions:

- [ ] **Challenge 1:** After the movement methods initialization in the Player’s Ship, and testing it out, the ship can move outside of the game environment boundaries. Fix that problem and keep only the movement method mandatory to the personal game version chosen. 
- [ ] **Challenge 2:** Movement methods for the Enemy are having an issue as well. After reaching the right border, the enemy stops moving. (Tip: A good technique is to set an instance variable in the Enemy class and implement it in the already created methods.)
- [ ] **Challenge 3:** In this part only one enemy is visible. Change the number of enemies and their movement logic as it seems fit for your personal version of the game. (It can be anything from different stepping for increased difficulty, to zig zag movement logic or axis)
- [ ] **Challenge 4:** An extended look of the enemies is needed. Replace the enemies with a different shape/color or image from the web. Enemies' size must be based on a logical ratio with the game environment.











# Part 3: Introduction to collision and shooting mechanism

# Part 4: UI creation and enhancements

# Part 5: Extra features and customizations
