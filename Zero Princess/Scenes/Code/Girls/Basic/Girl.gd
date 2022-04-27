extends KinematicBody


func _ready():
	pass

func HIT():
	print("HIT")
	$FSM.ChangeState("FALL")
