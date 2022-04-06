extends "res://Scenes/Code/Player/Basic State.gd"

func Update(delta):
	if is_instance_valid(FSM):
		var dir = FSM.get_node("Input").myInput(FSM.Root.id)
		if dir != Vector2.ZERO:
			FSM.direction = dir
		else:
			FSM.ChangeState("IDLE")
	else:
		FSM = $"../"


func Physics(delta):
	if not is_instance_valid(FSM):
		FSM = $"../"
		
	var d = Vector2.ZERO
	if FSM.direction != null:
		d = FSM.direction
	var dir = d * FSM.speed * delta
	var vel = Vector3(dir.x * -1, 0, dir.y)
	FSM.Root.move_and_collide(vel, false)
