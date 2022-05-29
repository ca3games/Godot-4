extends Spatial

export(NodePath) var FSMPath
onready var FSM = get_node(FSMPath)


func Update(delta):
	pass

func Physics(delta):
	pass

func RotateTowardsPlayer(delta):
	var p1 = FSM.Root.Player.global_transform.origin
	var p2 = FSM.Root.global_transform.origin
	var center = (p2 - p1) / 2
	LookAtTarget(p2 + center, delta)


func LookAtTarget(target, delta):
	var old_basis = FSM.Root.transform.basis
	var pos = target
	FSM.Root.look_at(pos, Vector3.UP)
	var target_basis = FSM.Root.transform.basis.orthonormalized()
	FSM.Root.transform.basis = old_basis.slerp(target_basis, delta * 10.0)
