extends Spatial

onready var current = $"IDLE"
onready var direction = Vector2.DOWN
onready var old_dir = direction

export (NodePath) var RootPath
onready var Root = get_node(RootPath)
export(float) var speed = 5
export(NodePath) var AniPath
onready var Ani = get_node(AniPath)

onready var state_machine = $"../AnimationTree".get("parameters/playback")


func _ready():
	ChangeState("IDLE")

func _process(delta):
	current.Update(delta)
	
func _physics_process(delta):
	if not Root.sexactive:
		FindTarget(delta)
		current.Physics(delta)

func ChangeState(STATE):
	match (STATE):
		"IDLE" : current = $IDLE
		"WALK" :  current = $WALK
		"PUNCH" : current =  $PUNCH
		"GIRLBALL" : current = $GIRLBALL
		"SEX STANDING" : current = $"SEX STANDING"

func FindTarget(delta):
	if direction == null:
		direction = Vector2.DOWN
	LookAtTarget(Root.global_transform.origin + Vector3(direction.x, 0, -direction.y), delta)
	#		var p1 = Root.get_parent().get_parent().fighters[Root.targetid-1].global_transform.origin
	#	var p2 = Root.global_transform.origin
	#	var center = (p2 - p1) / 2
	#	LookAtTarget(p2 + center, delta)

func LookAtTarget(target, delta):
	var old_basis = Root.transform.basis
	var pos = target
	Root.look_at(pos, Vector3.UP)
	var target_basis = Root.transform.basis.orthonormalized()
	Root.transform.basis = old_basis.slerp(target_basis, delta * 10.0)


func _on_Punch_body_entered(body):
	if body.is_in_group("GIRL"):
		body.HIT()
