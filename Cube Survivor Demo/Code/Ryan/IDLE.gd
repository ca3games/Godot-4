extends Spatial


func _ready():
	pass

func Update(delta):
	
	var pressed = false
	if Input.is_action_pressed("LEFT"):
		pressed = true
	if Input.is_action_pressed("RIGHT"):
		pressed = true
	if Input.is_action_pressed("BOTTOM"):
		pressed = true
	if Input.is_action_pressed("TOP"):
		pressed = true
	
	if pressed:
		$"../".ChangeState("WALK")
	
func Physics(delta):
	pass
