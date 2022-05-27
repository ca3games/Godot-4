extends "res://Scenes/Code/Player/Basic State.gd"


func _ready():
	if not is_instance_valid(FSM):
		FSM = $"../"

func Update(delta):
	var dir = FSM.get_node("Input").myInput()
	if dir != Vector2.ZERO:
		FSM.direction = dir
		FSM.ChangeState("WALK")
	
func Physics(delta):
	FSM.state_machine.travel("IDLE")
