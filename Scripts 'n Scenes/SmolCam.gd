extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Rule of Thirds Grid:
	$ThirdsGridN.set_point_position (0, Vector2(get_viewport().size.x/-2,get_viewport().size.y/-12))
	$ThirdsGridN.set_point_position (1, Vector2(get_viewport().size.x/2,get_viewport().size.y/-12))
	$ThirdsGridN/Area2D/CollisionShape2D.shape.a = Vector2(get_viewport().size.x/-2,get_viewport().size.y/-12)
	$ThirdsGridN/Area2D/CollisionShape2D.shape.b = Vector2(get_viewport().size.x/2,get_viewport().size.y/-12)
	
	$ThirdsGridE.set_point_position (0, Vector2(get_viewport().size.x/-12,get_viewport().size.y/-2))
	$ThirdsGridE.set_point_position (1, Vector2(get_viewport().size.x/-12,get_viewport().size.y/2))
	$ThirdsGridE/Area2D/CollisionShape2D.shape.a = Vector2(get_viewport().size.x/-12,get_viewport().size.y/-2)
	$ThirdsGridE/Area2D/CollisionShape2D.shape.b = Vector2(get_viewport().size.x/-12,get_viewport().size.y/2)
	
	$ThirdsGridS.set_point_position (0, Vector2(get_viewport().size.x/-2,get_viewport().size.y/12))
	$ThirdsGridS.set_point_position (1, Vector2(get_viewport().size.x/2,get_viewport().size.y/12))
	$ThirdsGridS/Area2D/CollisionShape2D.shape.a = Vector2(get_viewport().size.x/-2,get_viewport().size.y/12)
	$ThirdsGridS/Area2D/CollisionShape2D.shape.b = Vector2(get_viewport().size.x/2,get_viewport().size.y/12)
	
	$ThirdsGridW.set_point_position (0, Vector2(get_viewport().size.x/12,get_viewport().size.y/-2))
	$ThirdsGridW.set_point_position (1, Vector2(get_viewport().size.x/12,get_viewport().size.y/2))
	$ThirdsGridW/Area2D/CollisionShape2D.shape.a = Vector2(get_viewport().size.x/12,get_viewport().size.y/-2)
	$ThirdsGridW/Area2D/CollisionShape2D.shape.b = Vector2(get_viewport().size.x/12,get_viewport().size.y/2)
	
	# Golden Ratio Points
	$NWGoldP.position = Vector2(-get_viewport().size.x/10 - 6,-get_viewport().size.y/10 - 6)
	$NWGold.position = Vector2(-get_viewport().size.x/10 - 6,-get_viewport().size.y/10 - 6)
	
	$NEGoldP.position = Vector2(get_viewport().size.x/10 + 6,-get_viewport().size.y/10 - 6)
	$NEGold.position = Vector2(get_viewport().size.x/10 + 6,-get_viewport().size.y/10 - 6)
	
	$SWGoldP.position = Vector2(-get_viewport().size.x/10 - 6,get_viewport().size.y/10 + 6)
	$SWGold.position = Vector2(-get_viewport().size.x/10 - 6,get_viewport().size.y/10 + 6)
	
	$SEGoldP.position = Vector2(get_viewport().size.x/10 + 6,get_viewport().size.y/10 + 6)
	$SEGold.position = Vector2(get_viewport().size.x/10 + 6,get_viewport().size.y/10 + 6)


#func _input(event):
	##if event is InputEventMouseButton:
		##if event.is_pressed():
			#if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				#if $SmolCam.zoom > Vector2(0.1,0.1):
					#Camera2D.zoom = Camera2D.zoom-Vector2(0.05,0.05)
			#elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
				#if $SmolCam.zoom > Vector2(0.1,0.1):
					#Camera2D.zoom = Camera2D.zoom-Vector2(0.05,0.05)
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
