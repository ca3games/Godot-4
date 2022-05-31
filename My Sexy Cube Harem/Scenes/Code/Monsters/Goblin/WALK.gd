extends "res://Scenes/Code/Girls/Basic/basic state.gd"

export(float) var walk_speed

func Update(delta):
	RotateTowardsPlayer(delta)

func Physics(delta):
	FSM.state_machine.travel("WALK")
	var p1 = Variables.Player.global_transform.origin
	var p2 = FSM.Root.global_transform.origin
	var a = (p1 - p2).normalized() * delta * walk_speed
	FSM.Root.move_and_collide(a)

func Start():
	pass