extends KinematicBody

var dizzyactive = false
var sexactive = false

export(NodePath) var Player
export(int) var enemycaptured



func TakePlayer(p):
	Player = p
	print(Player)

func HIT():
	if not dizzyactive:
		$FSM.ChangeState("FALL")
		$FSM/FALL.RIPCLOTHES()
		dizzyactive = true
	else:
		if not sexactive:
			dizzyactive = false
			sexactive = true
			$FSM.ChangeState("SEX STANDING")
			$FSM.current.Begin()
			Player.SEX("STANDING")
			Variables.ShowSexScene(1, 1)
			var p_pos = Player.global_transform.origin
			self.global_transform.origin = Player.GetSexPegPos()
			self.global_transform.basis = Player.get_node("SexPeg").global_transform.basis
			$FSM/DIZZY/Timer.stop()
