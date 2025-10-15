"SpaceInvader Category"

Object subclass: #NameOfSubclass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"Enemy Class"

ImageMorph subclass: #Enemy
	instanceVariableNames: 'direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"Enemy>>initialize"

initialize
"Enemy initialization. Using self image for a different look for the enemies."
super initialize.
self image: (ImageReadWriter formFromFileNamed: 'alienspaceshipp.png').
    direction := 10

"Enemy>>move"

move
"Creating the logic for the borders and opposite direction when hitting left or right border of the
game. Also a logic when hitting the bottom so the enemies are being deleted. No one will ever let
those enemies get to the bottom but it is a nice addition to have in game if enemies move faster."
self x: self x + direction.
(self right > owner right)
	ifTrue: [direction := -10.
		self x: self x + direction].
(self left < owner left)
	ifTrue: [direction := 10.
		self x: self x + direction].
(self bottom >= owner bottom)
	ifTrue: [self delete].
owner changed

"Enemy>>step"

step
self move

"Enemy>>stepTime"

stepTime
"Change it for the enemies to move faster or slower."
^ 350

"Score Class"

TextMorph subclass: #Score
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"Score>>displayPoints"

displayPoints
"Score layout"
self
string: points printString
fontName: #Atlanta
size: 22

"Score>>initialize"

initialize
"Lock logic so it can't be edited"
super initialize.
points := 0.
self lock.
self textColor: Color green.
self displayPoints.
self extent: 90 @ 0.

"Score>>points"

points

^ points

"Score>>points:"

points: anInteger

points := points + anInteger.
self displayPoints

"Ship Class"

ImageMorph subclass: #Ship
	instanceVariableNames: 'canShoot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"Ship>>checkContact"

checkContact
"A logic for when the ship contacts an enemy, the game ends."
owner enemies do: [:enemy |
	(self bounds intersects: enemy bounds) ifTrue: [
		owner delete.
		owner endGame.
		].
	].

"Ship>>initialize"

initialize
"Changing the ship look, as well as adding a delay logic when shooting, to make it more realistic
and add a difficulty factor to the game so players won't shoot non stop. Also it bugs the sound effect while shooting so another fix there."

super initialize.
self image: (ImageReadWriter formFromFileNamed: 'spaceshipp.png').
canShoot := true.
[
	[true] whileTrue: [
	canShoot := true. 
	(Delay forMilliseconds: 1000) wait.
	]] fork.

"Ship>>keystroke:"

keystroke: keyString
"Keystrokes for  the ship to move. Don't really neep up and down, but it helps while testing and making sure everything works!"

keyString = '<left>'ifTrue: [self moveLeft].
keyString = '<right>'ifTrue: [self moveRight].
keyString = '<up>'ifTrue: [self moveUp].
keyString = '<down>'ifTrue: [self moveDown].
keyString = ' ' ifTrue: [self shoot].

"Ship>>moveDown"

moveDown
self y: self y-5.
(self bottom > owner bottom)
	ifTrue: [self bottom: owner bottom - self borderWidth].
owner changed

"Ship>>moveLeft"

moveLeft
self x: self x-5.
(self left < owner left)
	ifTrue: [self left: owner left + self borderWidth].
owner changed

"Ship>>moveRight"

moveRight
self x: self x + 5.
(self right > owner right)
	ifTrue: [self right: owner right - self borderWidth].
owner changed

"Ship>>moveUp"

moveUp
self y: self y + 5.
(self top < owner top)
	ifTrue: [self top: owner top + self borderWidth].
owner changed

"Ship>>shoot"

shoot
"Adding some sound for every shot as well as the shooting logic."
canShoot ifTrue: [
|shot|
shot := Shot new.
shot position: self topCenter - shot bottomCenter.
owner addMorph: shot.
(SampledSound fromWaveFileNamed: 'lasergun.wav') play.
canShoot := false.
].

"Ship>>step"

step
self checkContact.

"Shot Class"

EllipseMorph subclass: #Shot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"Shot>>checkContact"

checkContact
"Shot - Enemy contact"
self top < owner top ifTrue: [  ^self delete ].
owner enemies do: [:enemy | (self bounds intersects: enemy bounds)
				ifTrue: [self hitEnemy: enemy.
					^ self]]

"Shot>>hitEnemy:"

hitEnemy: enemy
owner points: 100.
self delete.
enemy delete.
(SampledSound fromWaveFileNamed: 'destroy.wav') play

"Points per enemy is situational as the sound."

"Shot>>initialize"

initialize
super initialize.
self color: Color green.
self extent: 10 @ 10

"Shot>>move"

move
self position: (self position) - (0@5).
self checkContact.

"Shot>>step"

step
self move

"Shot>>stepTime"

stepTime 
^ 30

"SpaceInvader Class"

Morph subclass: #SpaceInvader
	instanceVariableNames: 'ship score timer timerStarted'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"SpaceInvader>>endGame"

endGame
"The end game pop up window. Chose of UIManager, even if it is not editable enough, helps a lot as it keeps the focus after the end of the Game. It also pops up in the position of the mouse in the Squeak Environment so it makes sure of not missing it out!"
UIManager default inform: 
        'Times Up!. Score: ', score points printString, ', Try Again! '.
    self delete.

"SpaceInvader>>enemies"

enemies
^self submorphs select: [:morph | morph isMemberOf: Enemy]

"SpaceInvader>>handleKeystroke:"

handleKeystroke: anEvent
"the use of R key is for testing, not for ingame use."
|keyString|
keyString := anEvent keyString asLowercase.
keyString = 'r' ifTrue: [self initializeEnemies].
ship keystroke: keyString.

"SpaceInvader>>handlesMouseDown:"

handlesMouseDown: anEvent
^ false

"SpaceInvader>>handlesMouseOver:"

handlesMouseOver: anEvent
^ true

"SpaceInvader>>initialize"

initialize

super initialize.
self position: 591 @ 226.
self extent: 640 @ 480.
self setNameTo: 'Space Invader'.
self color: Color black.
self borderWidth: 4.
self borderColor: Color green.
self initializeShip.
self initializeScore.
self initializeEnemies.
self initializeTimer.
self startTimer.

"SpaceInvader>>initializeEnemies"

initializeEnemies
"Row - Column, Position, Moving of Enemies. Those settings, combining the movement and shooting is challenging for a non Gamer user, so edit them accordingly!"
    1 to: 4 do: [:row |
        1 to: 7 do: [:col |
            | enemy x y |
            x := 30 + ((col - 1) * 75).
            y := 60 + ((row - 1) * 60).
            enemy := Enemy new.
            enemy position: self position + (x @ y).
            self addMorph: enemy.
[
    [true] whileTrue: [
        (Delay forMilliseconds: 5000) wait.
        enemy position: enemy position + (20 @ 20).
    ].
] fork.
]].

"SpaceInvader>>initializeScore"

initializeScore
score := Score new.
score position: self position + (15 @ 10).
self addMorph: score

"SpaceInvader>>initializeShip"

initializeShip

    | myBottomCenter |
    ship := Ship new.
    myBottomCenter := self bottomCenter.
    ship center: myBottomCenter x @ (myBottomCenter y - (ship height * 0.5)).
    self addMorph: ship.

"SpaceInvader>>initializeTimer"

initializeTimer

timer := Timer new.
timer position: self position + (510 @ 10).
self addMorph: timer.

"SpaceInvader>>mouseEnter:"

mouseEnter: anEvent
anEvent hand newKeyboardFocus: self

"SpaceInvader>>mouseLeave:"

mouseLeave: anEvent
anEvent hand releaseKeyboardFocus: self

"SpaceInvader>>points:"

points: anInteger
score points: anInteger

"SpaceInvader>>startTimer"

startTimer
| timer |
timer := self timer.
timer step.

"SpaceInvader>>step"

step

    self enemies isEmpty
        ifTrue: [self initializeEnemies]

"SpaceInvader>>timer"

timer
^ timer

"Timer Class"

TextMorph subclass: #Timer
	instanceVariableNames: 'seconds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

"Timer>>displaySeconds"

displaySeconds

self contents: 'Time: ' , seconds printString.
self fontName: 'Atlanta' size: 22.

"Timer>>initialize"

initialize

super initialize.
seconds := 122.
self lock.
self textColor: Color green.
self displaySeconds.
self extent: 90 @ 30.

"Timer>>seconds"

seconds
^ seconds

"Timer>>step"

step

seconds := seconds - 1.
self displaySeconds.
(seconds = 0) ifTrue: [owner endGame].
