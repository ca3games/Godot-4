extends RigidBody

var girl = "NULL"
export(int) var hatchedtime = 3
export (float) var Yoffset

func _ready():
	$Timer.start(hatchedtime)

func _on_Timer_timeout():
	if girl == "NULL":
		return
	else:
		var g = load(girl)
		var tmp = g.instance()
		tmp.global_transform.origin = self.global_transform.origin + Vector3(0, Yoffset, 0)
		$"../".add_child(tmp)
		self.queue_free()
