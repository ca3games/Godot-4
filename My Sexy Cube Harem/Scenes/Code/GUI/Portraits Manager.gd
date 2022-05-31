extends Node2D

func _ready():
	$Portraits.hide()
	$"Sex Scenes".hide()


func ShowActiveGirl(id):
	$Portraits.show()
	$"Sex Scenes".hide()
	
func ShowSexScene(girl, animation):
	$Portraits.hide()
	$"Sex Scenes".show()
