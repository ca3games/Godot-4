extends Spatial

export(NodePath) var PlayerPath
onready var Player = get_node(PlayerPath)

func _ready():
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	Variables.Player = Player
