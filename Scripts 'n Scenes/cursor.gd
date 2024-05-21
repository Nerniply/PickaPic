extends Node2D

@onready var worldtimer = $"../CanvasLayer/WorldTimer"
var submerged = false
var surfaced = true
# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_global_mouse_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position = get_global_mouse_position()
	if submerged:
		worldtimer.begin()
		$O2Bar.value -= 1
		$AnimationPlayer.play("Below")
	if surfaced:
		$O2Bar.value += 6
		
	if $O2Bar.value == 0:
		get_tree().change_scene_to_file("res://Scripts 'n Scenes/death.tscn")
	
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#pictimer = 30
			#$Camera.play()
			#if $Cursor.submerged:
				#mouseL.emit()
	
