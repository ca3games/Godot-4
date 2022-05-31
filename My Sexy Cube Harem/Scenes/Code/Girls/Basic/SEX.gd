extends "res://Scenes/Code/Girls/Basic/basic state.gd"

var minimalsex = false

func Begin():
	FSM.state_machine.travel("SEX STANDING")
	$Timer.start(2)

func Update(delta):
	if Input.is_action_just_released("PUNCH"):
		if minimalsex:
			minimalsex = false
			Variables.Player.StopSEX()
			FSM.ChangeState("IDLE")

func Stop():
	FSM.ChangeState("IDLE")


func _on_Timer_timeout():
	minimalsex = true
