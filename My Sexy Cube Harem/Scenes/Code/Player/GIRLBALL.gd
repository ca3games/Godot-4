extends "res://Scenes/Code/Player/Basic State.gd"

export(PackedScene) var GirlBall
export(float) var force
export(float) var forceY

func _ready():
	if not is_instance_valid(FSM):
		FSM = $"../"

func ThrowGirlBall():
	FSM.state_machine.travel("PUNCH")
	var ball = GirlBall.instance()
	ball.global_transform.origin = FSM.Root.global_transform.origin
	ball.girl = Variables.Characters[Variables.Gimballs[0]]
	FSM.Root.Items.add_child(ball)
	ball.add_force(Vector3(-FSM.direction.x, forceY, FSM.direction.y) * force, Vector3.UP)

func End():
	FSM.ChangeState("IDLE")
