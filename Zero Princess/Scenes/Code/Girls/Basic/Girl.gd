extends KinematicBody


func _ready():
	pass

func HIT():
	$FSM.ChangeState("FALL")
	$FSM/FALL.RIPCLOTHES()
