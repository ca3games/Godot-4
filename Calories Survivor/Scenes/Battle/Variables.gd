extends Node2D

var calories_score = 0
var steps = 0

onready var GUI = get_tree().get_root().get_node("Battle/GUI")

func AddStep():
	GUI.AddStep()
