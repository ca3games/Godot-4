extends Node2D

var words = []
var id = 0
var time = 3

func _ready():
	LoadCSV()

func LoadCSV():
	var file = File.new()
	file.open("res://CSV/Japanese vocabulary 6000 - Sheet1.csv", File.READ)
	
	while !file.eof_reached():
		var csv = file.get_csv_line()
		if (csv.size() > 2):
			words.append(csv)
	
	file.close()
	

func _on_Change_timeout():
	id += 1
	$Kanji.text = str(words[id][7])
	$kana.text = str(words[id][8])
	$English.text = str(words[id][9])
	$id.text = str(id)


func _on_Button_button_up():
	var time = $HBoxContainer/Time.text
	if time.is_valid_integer():
		if int(time) >= 1 and int(time) <= 10:
			$Change.start(int(time))
			$Info.text = "Press stop to pause"
		else:
			$Info.text = "Press input between 1 and 10"
	else:
		$Info.text = "Press input a valid integer"


func _on_Stop_button_up():
	$Change.stop()
	$Info.text = "Press start to resume or set the change id to 0 to reset the game"


func _on_Change_ID_button_up():
	var i = $HBoxContainer/ID.text
	if i.is_valid_integer():
		if int(i) >= 0 and int(i) <= len(words)-1:
			id = int(i)
		else:
			$Info.text = "Not a valid vocab id"
	else:
		$Info.text = "Press input a valid integer for the change id"
