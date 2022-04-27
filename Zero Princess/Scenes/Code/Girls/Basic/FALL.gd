extends "res://Scenes/Code/Girls/Basic/basic state.gd"

func Physics(delta):
	FSM.state_machine.travel("HIT FALL")
	
func End():
	$"../DIZZY".Begin()
	FSM.ChangeState("DIZZY")
