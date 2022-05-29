extends "res://Scenes/Code/Girls/Basic/basic state.gd"


func Physics(delta):
	FSM.state_machine.travel("IDLE")
