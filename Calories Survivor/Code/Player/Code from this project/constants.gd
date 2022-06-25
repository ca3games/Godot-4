class_name Constants
extends Reference

# Here we define our button constants to be used by the player's input detector button history display

enum Btn {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	
	# These are used for combunation inputs
	# This will be used for detecting motion inputs
	UP_LEFT,
	UP_RIGHT,
	DOWN_LEFT,
	DOWN_RIGHT,

	# Names like 'Kick', and 'Punch' are borrowed from Guilty Gear. 
	# They just platform independent names corresponding to some button on the controller and not necessarily 
	# an actual in game action though in that game there is correlation between the button and action type for many characters.
	KICK,
	PUNCH,
	SLASH,
	HEAVY_SLASH,

	# These are used for conditional inputs
	# This lets us change motion inputs based on a combatant's relative position
	FORWARD,
	UP_FORWARD,
	DOWN_FORWARD,
	BACKWARD,
	UP_BACKWARD,
	DOWN_BACKWARD,
}
