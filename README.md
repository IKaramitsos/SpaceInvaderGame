# Alternative Space Invader Game

The alternative space invader game repository contains the code and runnable files for the exercise developed as part of the MSc Thesis: "Interactive Learning in IT: Using Alternative Object-oriented Language" at the University  of Patras. 

It is used as a scaffolded, interactive game-based programming exercise built with Squeak/Smalltalk, designed to teach fundamental IT concepts and object-oriented programming through the development of the game and was inspired by the classic Space Invaders and the MIT Licensed development of Scott Gibson's implementation.

The exercise is aligned with a holistic educational framework and includes structured challenges for students. The repository comes with alignment with the MSc Thesis, which enables researches, students and educators to explore, run, extend the exercise. 

Detailed description and context about the implementation of the exercise is available in  the linked thesis at:
[Provided in the near future](https://github.com/IKaramitsos/Alternative-Space-Invader-Game) 

## Files

`AlternativeSpaceInvader.st`, this file contains the Smalltalk source code for the Space Invader game exercise, it can be used to review the code as a more readable option before launching it in a Squeak environment.

`SpaceInvader.rar`, this compressed file contains the Squeak image (`.image`) and changes file (`.changes`) necessary to run the exercise.

### Game Structure

| Class | Description |
| --- | --- |
| `SpaceInvader` | Main game window & controller |
| `Ship` | Player sprite (controls/shoot) |
| `Enemy` | Enemy sprite (moves back and forth) |
| `Shot` | Bullet morph (detects collision) |
| `Score` | Points tracker (updates display) |

## Download and Run

1. To download and run the exercise, first it is needed to download the latest zip file via github or clone the repository.
`git clone https://github.com/IKaramitsos/Alternative-Space-Invader-Game.git`

2. Install the [Squeak Smalltalk VM](https://squeak.org/downloads/) suitable for the platform/OS in use.

3. To run the exercise:
- Extract the `SpaceInvader.rar`.
- Launch the Squeak VM and open the `SpaceInvader.image` file.
- If the game isn't prelaunched, open a workspace, if it isn't as well available when launched, and run the following code to start:

`SpaceInvader new openInWorld` and run the code (select the code and `ctrl+d` or use the Squeak's dropdown menu)
- Spaceship can be be controlled with `arrow keys`, with `spacebar` spaceship shoots, `r` is set to restart enemies entities.

All of those mechanics, keystrokes, look of the game can be changed based on the structured challenges set for university students.

## Helpful Resources

- [Squeak Documentation](https://squeak.org/documentation/)
- [Smalltalk tutorial](https://learnxinyminutes.com/smalltalk/)

## Cheatsheet

The "Smalltalk Syntax Cheat Sheet" contains a grasp of all the fundamental syntax and knowledge of Smalltalk object-oriented language. It also contains parts of code used in the Space Invader game. A more extended version can be found in the Helpful Resource section above or using the following [Smalltalk Language Notes Cheatsheet](https://www.angelfire.com/tx4/cus/notes/smalltalk.html)

<img width="1067" height="707" alt="Frame 1" src="https://github.com/user-attachments/assets/81044f77-faa7-44b7-818e-c29e403eb6f8" />
