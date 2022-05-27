extends Spatial

onready var current = $IDLE
onready var state_machine = $"../AnimationTree".get("parameters/playback")

export(NodePath) var RootPath
onready var Root = get_node(RootPath)

func _ready():
	pass

func _process(delta):
	current.Update(delta)
	
func _physics_process(delta):
	current.Physics(delta)
	
func ChangeState(state):
	match(state):
		"IDLE" : current = $IDLE
		"FALL" : current =  $FALL
		"DIZZY" : current = $DIZZY
		"SEX STANDING" : current = $"SEX STANDING"
