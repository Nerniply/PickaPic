extends Node2D

var submerged = false
# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_global_mouse_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position = get_global_mouse_position()
	if submerged:
		$O2Bar.value -= 1
	else: $O2Bar.value += 2
