SpaceInvader:

Object subclass: #NameOfSubclass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

Enemy:

RectangleMorph subclass: #Enemy
	instanceVariableNames: 'direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

Enemy>>initialize

initialize
super initialize.
self color: Color green.
self borderColor: Color honeydew.
self extent: 32 @ 32.
direction := 10

Enemy>>move

move
self x: self x + direction.
(self right > owner right)
	ifTrue: [direction := -10.
		self x: self x + direction].
(self left < owner left)
	ifTrue: [direction := 10.
		self x: self x + direction].
owner changed

Enemy>>step

step 
self move

Enemy>>stepTime

stepTime
^ 1500

Score:

TextMorph subclass: #Score
	instanceVariableNames: 'points'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'

Score>>displayPoints

displayPoints
self
string: points printString
fontName: #Atlanta
size: 22

Score>>initialize

initialize

super initialize.
points := 0.
self lock.
self textColor: Color green.
self displayPoints.
self extent: 90 @ 0.


Score>>points

points

^ points


Score>>points:

points: anInteger

points := points + anInteger.
self displayPoints

Shot:

EllipseMorph subclass: #Shot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'


Shot>>checkContact

checkContact
self top < owner top ifTrue: [  ^self delete ].
owner enemies do: [:enemy | (self bounds intersects: enemy bounds)
				ifTrue: [self hitEnemy: enemy.
					^ self]]

Shot>>hitEnemy:

hitEnemy: enemy
owner points: 100.
self delete.
enemy delete

Shot>>initialize

initialize
super initialize.
self color: Color red.
self extent: 10 @ 10

Shot>>move

move
self position: (self position) - (0@5).
self checkContact.

Shot>>step

step
self move

Shot>>stepTime

stepTime 
^ 33

Ship:

RectangleMorph subclass: #Ship
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'


Ship>>initialize

initialize

super initialize.
self color: Color silver.
self borderColor: Color  lightOrange.
self extent: 32 @ 32

Ship>>keystroke:

keystroke: keyString

keyString = '<left>'ifTrue: [self moveLeft].
keyString = '<right>'ifTrue: [self moveRight].
keyString = '<up>'ifTrue: [self moveUp].
keyString = '<down>'ifTrue: [self moveDown].
keyString = ' ' ifTrue: [self shoot]

Ship>>moveDown

moveDown
self y: self y-5.
(self bottom > owner bottom)
	ifTrue: [self bottom: owner bottom - self borderWidth].
owner changed

Ship>>moveLeft

moveLeft
self x: self x-5.
(self left < owner left)
	ifTrue: [self left: owner left + self borderWidth].
owner changed

Ship>>moveRight

moveRight
self x: self x + 5.
(self right > owner right)
	ifTrue: [self right: owner right - self borderWidth].
owner changed

Ship>>moveUp

moveUp

moveUp
self y: self y + 5.
(self top < owner top)
	ifTrue: [self top: owner top + self borderWidth].
owner changed

Ship>>shoot

shoot
|shot|
shot := Shot new.
shot position: self topCenter - shot bottomCenter.
owner addMorph: shot

SpaceInvader:

Morph subclass: #SpaceInvader
	instanceVariableNames: 'ship score'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SpaceInvader'


SpaceInvader>>enemies

enemies
^self submorphs select: [:morph | morph isMemberOf: Enemy]

SpaceInvader>>handleKeystroke:

handleKeystroke: anEvent
|keyString|
keyString := anEvent keyString asLowercase.
keyString = 'r' ifTrue: [self initializeEnemies].
ship keystroke: keyString.

SpaceInvader>>handlesMouseDown:

handlesMouseDown: anEvent
^ false

SpaceInvader>>handlesMouseOver:

handlesMouseOver: anEvent
^ true

SpaceInvader>>initialize

initialize

super initialize.
self position: 100 @ 100.
self extent: 640 @ 480.
self color: Color black.
self setNameTo: 'Space Invader'.
self initializeShip.
self initializeScore.
self initializeEnemies

SpaceInvader>>initializeEnemies

initializeEnemies
|enemy|
enemy := Enemy new.
enemy position:  self position + (100@100).
self addMorph: enemy

SpaceInvader>>initializeScore

initializeScore
score := Score new.
score position: self position + (10 @ 10).
self addMorph: score


SpaceInvader>>initializeShip

initializeShip

    | myBottomCenter |
    ship := Ship new.
    myBottomCenter := self bottomCenter.
    ship center: myBottomCenter x @ (myBottomCenter y - (ship height * 2)).
    self addMorph: ship.

SpaceInvader>>mouseEnter:

mouseEnter: anEvent
anEvent hand newKeyboardFocus: self


SpaceInvader>>mouseLeave:

mouseLeave: anEvent
anEvent hand releaseKeyboardFocus: self

SpaceInvader>>points:

points: anInteger
score points: anInteger







