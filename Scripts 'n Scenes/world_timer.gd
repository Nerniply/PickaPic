extends ColorRect

var minute = 5
var second = 0
var smolsecond = 0
var start = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if start:
		if smolsecond > 0:
			smolsecond -= 1
		elif smolsecond == 0:
			smolsecond = 60
			if second > 0:
				second -= 1
			elif second == 0:
				second = 60
				if minute > 0:
					minute -= 1
				elif minute == 0:
					get_tree().change_scene_to_file("res://Scripts 'n Scenes/credits.tscn")
				
			
	
	if second >= 10:
		$MarginContainer/Label.text = str(minute) + ":" + str(second)
	if second < 10:
		$MarginContainer/Label.text = str(minute) + ":0" + str(second)

func begin():
	start = true
