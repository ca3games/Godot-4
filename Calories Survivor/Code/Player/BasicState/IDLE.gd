extends "res://Code/Player/BasicState/Basic State.gd"

func Update(delta):	
	
	match(.CheckInput()):
		Vector2.ZERO : pass
		_: FSM.ChangeState("WALK")


func Physics(delta):
	FSM.AnimTree.set("parameters/IDLE/blend_position", FSM.direction)
	FSM.state_machine.travel("IDLE")
