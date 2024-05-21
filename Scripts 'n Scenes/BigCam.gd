extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#print(get_viewport().size)
	if position.x < 1440 - get_viewport().size.x/2:
		if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
			position.x += 4
		else:
			position.x += 0
	if position.x > -1440 + get_viewport().size.x/2:
		if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
			position.x -= 4
		else:
			position.x -= 0
	if position.y < 810 - get_viewport().size.y/2:
		if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
			position.y += 4
		else:
			position.y += 0
	if position.y > -810 + get_viewport().size.y/2:
		if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
			position.y -= 4
		else:
			position.y -= 0
