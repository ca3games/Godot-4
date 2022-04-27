extends "res://Scenes/Code/Player/Basic State.gd"


func _ready():
	if not is_instance_valid(FSM):
		FSM = $"../"

func Update(delta):
	if is_instance_valid(FSM):
		var dir = FSM.get_node("Input").myInput(FSM.Root.id)
		if dir != Vector2.ZERO:
			FSM.direction = dir
			FSM.ChangeState("WALK")
	else:
		FSM = $"../"

func Physics(delta):
	FSM.state_machine.travel("IDLE")
