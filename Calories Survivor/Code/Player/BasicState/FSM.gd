extends Node2D

onready var current = $IDLE

export(NodePath) var RootPath
onready var Root = get_node(RootPath)
export(NodePath) var AnimTreePath
onready var AnimTree = get_node(AnimTreePath)

onready var direction = Vector2.DOWN
export (float) var vel
onready var state_machine = AnimTree.get("parameters/playback")

export(int) var HP 

export(PackedScene) var Bullet

func _ready():
	yield(get_tree(), "idle_frame")

func _process(delta):
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)

func ChangeState(state):
	match (state):
		"IDLE" : current = $IDLE
		"WALK" : current = $WALK

