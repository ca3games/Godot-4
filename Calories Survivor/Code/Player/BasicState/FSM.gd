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
var delay = false
var delaynoinput = true

func _ready():
	yield(get_tree(), "idle_frame")

func _process(delta):
	current.Update(delta)

func _physics_process(delta):
	current.Physics(delta)

func ChangeState(state, idle = false):
	if current == $WALK and idle == false:
		return
	if delay or not delaynoinput:
		return
	
	match (state):
		"IDLE" : current = $IDLE
		"WALK" : 
			$WALK/Stop.start(1)
			current = $WALK
			current.Start()



func _on_Timer_timeout():
	ChangeState("IDLE", true)
	delay = true
	delaynoinput = false
	$WALK/Delay.start(0.3)


func _on_Delay_timeout():
	delay = false
