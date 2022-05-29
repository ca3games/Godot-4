extends "res://Scenes/Code/Girls/Basic/basic state.gd"

func Throw():
	FSM.state_machine.travel("THROWBALL")
	var ball = GirlBall.instance()
	ball.global_transform.origin = FSM.Root.global_transform.origin
	ball.girl = Variables.Enemies[FSM.Root.enemycaptured]
	ball.Player = FSM.Root.Player
	FSM.Root.get_parent().get_parent().add_child(ball)
	var p1 = FSM.Root.Player.global_transform.origin
	var p2 = FSM.Root.global_transform.origin
	var a = (p1 - p2).normalized()
	ball.add_force(a * force, Vector3.UP)

func Stop():
	FSM.ChangeState("IDLE")

export(PackedScene) var GirlBall
export(float) var force
export(float) var forceY
