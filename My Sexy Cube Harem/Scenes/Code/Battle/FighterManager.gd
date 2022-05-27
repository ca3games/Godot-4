extends Spatial

export (float) var offset
var fighters = []

export(int) var enemiesmax

func AddFighter(id, targetid, chara):
	var fighter
	fighter = load(Variables.Enemies[chara-1]).instance()
	var positionnode = Position3D.new()
	var pos = Vector2(id % 3, id / 3) * offset
	positionnode.global_transform.origin += Vector3(pos.x, 0, -pos.y)
	positionnode.name = str(id)
	add_child(positionnode)
	var parent = get_node(str(id))
	if chara == 0:
		fighter.id = id
		fighter.targetid = targetid
	fighter.look_at(parent.global_transform.origin, Vector3.UP)
	fighters.append(fighter)
	parent.add_child(fighters[len(fighters)-1])

func _ready():
	for i in enemiesmax:
		AddFighter(i, 1, 1)
