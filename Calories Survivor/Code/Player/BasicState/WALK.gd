extends "res://Code/Player/BasicState/Basic State.gd"

func Update(delta):
	
	var dir = .CheckInput()
	
	match(dir):
		Vector2.ZERO: FSM.ChangeState("IDLE")
		_: FSM.direction = dir

func Physics(delta):
	FSM.state_machine.travel("WALK")
	FSM.AnimTree.set("parameters/WALK/blend_position", FSM.direction)
	
	var dir = FSM.direction * FSM.vel * delta
	dir.y *= -1
	FSM.Root.move_and_collide(Vector2(dir.x, dir.y), false)
