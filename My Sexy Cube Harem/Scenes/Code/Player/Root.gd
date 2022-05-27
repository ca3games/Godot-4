extends KinematicBody

var id = 0
var targetid = 0
onready var lock = false
var lasttargetid
var sexactive = false

export(NodePath) var ItemsManagerPath
onready var Items = get_node(ItemsManagerPath)


func _ready():
	yield(get_tree(), "idle_frame")
	lasttargetid = targetid
	targetid = 0
	
	Variables.Gimballs.append(1)

func SEX(state):
	sexactive = true
	match(state):
		"STANDING" : $FSM.ChangeState("SEX STANDING")
	
	$FSM.current.Start()

func StopSEX():
	$FSM.ChangeState("IDLE")
	sexactive = false

func GetSexPegPos():
	return $SexPeg.global_transform.origin

func GetSexPegRot():
	return $SexPeg.rotation_degrees
