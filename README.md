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

- [ ] Challenge 1: An extended look of the spaceship is needed. Replace the spaceship with a different shape/color or image from the web. Spaceship size must be based on a logical ratio with the game environment.
- [ ] Challenge 2: The environment at the current state is really plain and simple. Enrich the environment by changing the background, adding borders, or anything providing a clean look of a SpaceInvader game.



# Part 2: Enemies and mechanics

# Part 3: Introduction to collision and shooting mechanism

# Part 4: UI creation and enhancements

# Part 5: Extra features and customizations
