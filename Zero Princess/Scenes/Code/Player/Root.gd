extends KinematicBody

var id = 0
var targetid = 0
onready var lock = false
var lasttargetid

export(NodePath) var ItemsManagerPath
onready var Items = get_node(ItemsManagerPath)


func _ready():
	yield(get_tree(), "idle_frame")
	lasttargetid = targetid
	targetid = 0
	
	Variables.Gimballs.append(1)
