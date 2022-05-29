extends "res://Scenes/Code/Girls/Basic/basic state.gd"

func Begin():
	FSM.state_machine.travel("DIZZY")
	$Timer.start(10)


func _on_Timer_timeout():
	FSM.ChangeState("IDLE")
	FSM.Root.Player.StopSEX()
