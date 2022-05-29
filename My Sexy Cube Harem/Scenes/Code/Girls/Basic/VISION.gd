extends Area

export(NodePath) var FSMPath
onready var FSM = get_node(FSMPath)

func _on_VISION_body_entered(body):
	if body.is_in_group("PLAYER"):
		FSM.ChangeState("WALK")
