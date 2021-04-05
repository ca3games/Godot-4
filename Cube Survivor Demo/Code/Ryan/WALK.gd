extends Spatial

export(float) var speed

func _ready():
	pass

func Update(delta):
	
	var direction = Vector2.ZERO
	
	var left = false
	var right = false
	var top = false
	var bottom = false
	
	if Input.is_action_pressed("LEFT"):
		left = true
	if Input.is_action_pressed("RIGHT"):
		right = true
	if Input.is_action_pressed("BOTTOM"):
		bottom = true
	if Input.is_action_pressed("TOP"):
		top = true
		
	if left and !right:
		direction.x = -1
	if right and !left:
		direction.x = 1
	if top and !bottom:
		direction.y = -1
	if bottom and !top:
		direction.y = 1
	
	if direction != Vector2.ZERO:
		$"../".direction = direction
	else:
		$"../".ChangeState("IDLE")
	
func Physics(delta):
	
	var tmp = $"../".direction * speed * delta
	var move = Vector3(tmp.x, 0, tmp.y)
	$"../../".move_and_collide(move)
	
	var angle = 0
	
	match ($"../".direction):
		Vector2(-1, 0) : angle = 270
		Vector2(1, 0) : angle = 80
		Vector2(0, 1) : angle = 0
		Vector2(0, -1) : angle = 180
		Vector2(-1,-1) : angle = 209
		Vector2(1, -1) : angle = 135
		Vector2(-1, 1) : angle = -60
		Vector2(1, 1) : angle = 45
		
	$"../../".rotation_degrees.y = angle
