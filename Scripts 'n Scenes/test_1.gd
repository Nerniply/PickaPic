extends Node2D

var divetimer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$PanelContainer/CenterContainer/SubViewportContainer/SubViewport/Camera2D.position = get_global_mouse_position()
	if divetimer == 0:
		if Input.is_key_pressed(KEY_SPACE):
			if $Cursor.submerged:
				$Cursor.submerged = false
			else:
				$Cursor.submerged = true
			divetimer = 30
	else:
		divetimer -= 1
