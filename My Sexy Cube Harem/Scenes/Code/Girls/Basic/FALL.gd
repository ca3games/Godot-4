extends "res://Scenes/Code/Girls/Basic/basic state.gd"

export(NodePath) var ClothesPath
onready var Clothes = get_node(ClothesPath)
onready var ripped = false
export(float) var rip_timer

func Physics(delta):
	FSM.state_machine.travel("HIT FALL")
	
	if ripped:
		Clothes.get_surface_material(0).set("shader_param/dissolveAmount", rip_timer - $RIPCLOTHE.time_left)
	
func End():
	$"../DIZZY".Begin()
	FSM.ChangeState("DIZZY")

func RIPCLOTHES():
	$RIPCLOTHE.start(rip_timer)
	ripped = true
