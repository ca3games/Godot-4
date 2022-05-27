extends "res://Scenes/Code/Player/Basic State.gd"

func _ready():
	if not is_instance_valid(FSM):
		FSM = $"../"

func Start():
	FSM.state_machine.travel("SEX STANDING")
