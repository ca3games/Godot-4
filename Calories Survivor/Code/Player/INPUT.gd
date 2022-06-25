extends Node2D

onready var Btn = preload("res://Code/Player/Code from this project/constants.gd")
const CombiType = FrayInputNS.CombinationInput.Type
var _sequence_analyzer := FrayInputNS.SequenceAnalyzerTree.new()
onready var _combat_graph: FrayCombatState.CombatGraph = $CombatGraph

func _ready():
	FrayInput.connect("input_detected", self, "_on_FrayInput_input_detected")
	_sequence_analyzer.connect("match_found", self, "_on_SequenceAnalyzerTree_match_found")
	SetupInput()

func SetupInput():
	var input_map := FrayInput.get_input_map()
	input_map.add_action_input(Btn.Btn.LEFT, "LEFT")
	input_map.add_action_input(Btn.Btn.RIGHT, "RIGHT")
	input_map.add_action_input(Btn.Btn.UP, "UP")
	input_map.add_action_input(Btn.Btn.DOWN, "DOWN")
	input_map.add_combination_input(Btn.Btn.UP_LEFT, [Btn.Btn.UP, Btn.Btn.LEFT], true, CombiType.ASYNC)
	input_map.add_combination_input(Btn.Btn.UP_RIGHT, [Btn.Btn.UP, Btn.Btn.RIGHT], true, CombiType.ASYNC)
	input_map.add_combination_input(Btn.Btn.DOWN_LEFT, [Btn.Btn.DOWN, Btn.Btn.LEFT], true, CombiType.ASYNC)
	input_map.add_combination_input(Btn.Btn.DOWN_RIGHT, [Btn.Btn.DOWN, Btn.Btn.RIGHT], true, CombiType.ASYNC)

func _on_FrayInput_input_detected(input_event: FrayInputNS.FrayInputEvent):
	_sequence_analyzer.read(input_event)
	
	if input_event.is_just_pressed(true):
		_combat_graph.buffer_button(input_event.id, input_event.pressed)

func _on_SequenceAnalyzerTree_match_found(sequence_name: String, inputs: PoolIntArray):
	_combat_graph.buffer_sequence(sequence_name)


func _process(delta):
	var current_situation := _combat_graph.combat_situation
	
	if FrayInput.is_just_released(Btn.Btn.LEFT):
		print ("FRAY LEFT")
