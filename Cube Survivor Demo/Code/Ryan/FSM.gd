extends Spatial

onready var current = $IDLE

onready var direction = Vector2.DOWN


func _ready():
	pass

func _process(delta):
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)


func ChangeState(state):
	match (state):
		"IDLE" : current = $IDLE
		"WALK" :  current = $WALK
