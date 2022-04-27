extends "res://Scenes/Code/Player/Basic State.gd"

func _ready():
	if not is_instance_valid(FSM):
		FSM = $"../"


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
	var d = Vector2.ZERO
	if FSM.direction != null:
		d = FSM.direction
	var dir = d * FSM.speed * delta
	var vel = Vector3(dir.x * -1, 0, dir.y)
	FSM.Root.move_and_collide(vel, false)
	
	FSM.state_machine.travel("WALK")
