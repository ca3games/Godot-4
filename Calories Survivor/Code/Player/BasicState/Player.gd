extends KinematicBody2D

export(bool) var Town = false
export (NodePath) var SceneRootPath
onready var SceneRoot = get_node(SceneRootPath)

export(NodePath) var BulletManagerPath
onready var BulletManager = get_node(BulletManagerPath)

export(NodePath) var GUIPath
onready var GUI = get_node(GUIPath)

export(NodePath) var LockPath
onready var Lock = get_node(LockPath)

#onready var OffsetBody = $SpawnBulletPos.position

export(int) var kickdamage
var meleetype = "KICK"

func _on_Melee_body_entered(body):
	if body.is_in_group("TUMBLEWEED"):
		match(meleetype):
			"KICK" : body.Melee(1)
