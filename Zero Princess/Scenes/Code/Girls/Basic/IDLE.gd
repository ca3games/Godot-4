extends "res://Scenes/Code/Girls/Basic/basic state.gd"

func Update(delta):
	RotateTowardsPlayer(delta)


func Physics(delta):
	FSM.state_machine.travel("IDLE")
