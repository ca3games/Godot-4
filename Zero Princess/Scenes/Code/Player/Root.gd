extends KinematicBody

var id = 0
var targetid = 0
onready var lock = false
var lasttargetid

func _ready():
	yield(get_tree(), "idle_frame")
	lasttargetid = targetid
