extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_target():
	var newtarget = Vector2()
	newtarget.x = randi_range(-248,248)
	newtarget.y = randi_range(-248,248)
	return newtarget
