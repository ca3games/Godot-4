extends "res://Scenes/Code/Player/Basic State.gd"

func _ready():
	if not is_instance_valid(FSM):
		FSM = $"../"

func Physics(delta):
	FSM.state_machine.travel("PUNCH")

func End():
	FSM.ChangeState("IDLE")
