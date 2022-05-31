extends KinematicBody

var dizzyactive = false
var sexactive = false

export(NodePath) var Player
export(int) var enemycaptured

func TakePlayer(p):
	Player = p
	print(Player)

func _ready():
	pass

func HIT():
	dizzyactive = false
	sexactive = true
	$FSM.ChangeState("SEX STANDING")
	$FSM.current.Begin()
	Variables.Player.SEX("STANDING")
	Variables.ShowSexScene(1, 1)
	var p_pos = Variables.Player.global_transform.origin
	self.global_transform.origin = Variables.Player.GetSexPegPos()
	self.global_transform.basis = Variables.Player.get_node("SexPeg").global_transform.basis
	$FSM/DIZZY/Timer.stop()
