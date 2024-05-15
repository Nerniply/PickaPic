extends Node2D

var divetimer = 0
@onready var SmolViewport = $PanelContainer/CenterContainer/SubViewportContainer/SubViewport
@onready var SmolCam = $PanelContainer/CenterContainer/SubViewportContainer/SubViewport/Camera2D
@onready var CamGridN = $PanelContainer/CenterContainer/SubViewportContainer/SubViewport/CamGridN
# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer.position.x = get_viewport().size.x - $PanelContainer.size.x
	$PanelContainer.position.y = get_viewport().size.y - $PanelContainer.size.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	SmolCam.position = get_global_mouse_position()
	CamGridN.position = get_global_mouse_position() + Vector2(-SmolViewport.size.x/2,-SmolViewport.size.y/6)
	if divetimer == 0:
		if Input.is_key_pressed(KEY_SPACE):
			if $Cursor.submerged:
				$Cursor.submerged = false
			else:
				$Cursor.submerged = true
			divetimer = 30
	else: divetimer -= 1

