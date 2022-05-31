extends Node2D

export(Array, String) var Levels
export(Array, String) var Characters
export(Array, String) var Enemies

var Gimballs = []

var PortraitManager

var spawnedenemies = 0
var maxspawn = 1

var Player

func _ready():
	yield(get_tree(), "idle_frame")
	PortraitManager = get_tree().get_root().get_node("GUI/Portraits Manager")


func ShowGirlPortrait(id):
	PortraitManager.ShowActiveGirl(id)

func ShowSexScene(girl, animation):
	PortraitManager.ShowSexScene(girl, animation)
