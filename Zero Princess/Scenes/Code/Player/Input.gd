extends Spatial

export(NodePath) var FSMPath
onready var FSM = get_node(FSMPath)

func P1Move():
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("P1LEFT"):
		dir.x = 1
	if Input.is_action_pressed("P1RIGHT"):
		dir.x = -1
	if Input.is_action_pressed("P1DOWN"):
		dir.y = 1
	if Input.is_action_pressed("P1UP"):
		dir.y = -1
	
	return dir

func P1Buttons():
	if Input.is_action_just_released("P1LOCK"):
		if FSM.Root.targetid != 0:
			FSM.Root.lasttargetid = FSM.Root.targetid
			FSM.Root.targetid = 0
		else:
			FSM.Root.targetid = FSM.Root.lasttargetid
	if Input.is_action_just_released("PUNCH"):
		FSM.ChangeState("PUNCH")


func myInput(player):
	match(player):
		1: 
			P1Buttons()
			return P1Move()
