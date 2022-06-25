extends "res://Code/Player/BasicState/Basic State.gd"

func Update(delta):	
	# delaynoinputs checks for the gamepad having no inputs pressed while the delay between keypresses
	if not FSM.delaynoinput:
		if .CheckInputVector() == Vector2.ZERO:
			FSM.delaynoinput = true
	if FSM.delay:
			return
	
	match(.CheckInput()):
		Vector2.ZERO : pass
		_: FSM.ChangeState("WALK")


func Physics(delta):
	FSM.AnimTree.set("parameters/IDLE/blend_position", FSM.direction)
	FSM.state_machine.start("IDLE")
