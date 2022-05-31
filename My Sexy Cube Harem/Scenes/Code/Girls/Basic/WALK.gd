extends "res://Scenes/Code/Girls/Basic/basic state.gd"

export(float) var walk_speed

func Update(delta):
	RotateTowardsPlayer(delta)

func Physics(delta):
	FSM.state_machine.travel("WALK")
	var p1 = FSM.Root.Player.global_transform.origin
	var p2 = FSM.Root.global_transform.origin
	var a = (p1 - p2).normalized() * delta * walk_speed
	FSM.Root.move_and_collide(a)

func Start():
	$Timer.start(3)


func _on_Timer_timeout():
	if Variables.spawnedenemies < Variables.maxspawn:
		FSM.ChangeState("THROWBALL")
		Variables.spawnedenemies += 1
	else:
		FSM.ChangeState("IDLE")
