extends Node2D

@onready var SmolViewport = $CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/SubViewportContainer/SmolView
#$CanvasLayer/PanelContainer/MarginContainer/CenterContainer/SubViewportContainer/SubViewport
@onready var SmolCam = $CanvasLayer/PanelContainer/MarginContainer/VBoxContainer/SubViewportContainer/SmolView/SmolCam
#$CanvasLayer/PanelContainer/MarginContainer/CenterContainer/SubViewportContainer/SubViewport/SmolCam
@onready var Nemo = preload("res://Scripts 'n Scenes/nemo.tscn")
@onready var Dori = preload("res://Scripts 'n Scenes/dori.tscn")
@onready var Tuna = preload("res://Scripts 'n Scenes/tuna.tscn")
@onready var Chromis = preload("res://Scripts 'n Scenes/chromis.tscn")
@onready var Tang = preload("res://Scripts 'n Scenes/tang.tscn")
@onready var Generic = preload("res://Scripts 'n Scenes/generic_fish.tscn")

var x = 0
var y = 0
var transition
var transitiontimer = 0
var pictimer = 0
var spawnlocations = [$BigSpawn1,$BigSpawn2,$BigSpawn3,$BigSpawn4,$BigSpawn5,$BigSpawn6,$BigSpawn7]
signal mouseL

# Called when the node enters the scene tree for the first time.
func _ready():
	#$BigSpawn1.add_child(load("res://Scripts 'n Scenes/nemo.tscn").instantiate())
	#$BigSpawn2.add_child(load("res://Scripts 'n Scenes/dori.tscn").instantiate())
	#$BigSpawn3.add_child(load("res://Scripts 'n Scenes/tuna.tscn").instantiate())
	#$BigSpawn4.add_child(load("res://Scripts 'n Scenes/chromis.tscn").instantiate())
	#$BigSpawn5.add_child(load("res://Scripts 'n Scenes/tang.tscn").instantiate())
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#var x = 0
	var fishy

	if x < 30:
		match randi_range(1,5):
			1:
				fishy = Nemo
			2:
				fishy = Dori
			3:
				fishy = Tuna
			4:
				fishy = Chromis
			5:
				fishy = Tang
		
		match randi_range(0,6):
			0: $BigSpawn1.add_child(fishy.instantiate())
			1: $BigSpawn2.add_child(fishy.instantiate())
			2: $BigSpawn3.add_child(fishy.instantiate())
			3: $BigSpawn4.add_child(fishy.instantiate())
			4: $BigSpawn5.add_child(fishy.instantiate())
			5: $BigSpawn6.add_child(fishy.instantiate())
			6: $BigSpawn7.add_child(fishy.instantiate())
			
		x += 1
		
	if y < 20:
		fishy = Generic
		match randi_range(0,6):
			0: $BigSpawn1.add_child(fishy.instantiate())
			1: $BigSpawn2.add_child(fishy.instantiate())
			2: $BigSpawn3.add_child(fishy.instantiate())
			3: $BigSpawn4.add_child(fishy.instantiate())
			4: $BigSpawn5.add_child(fishy.instantiate())
			5: $BigSpawn6.add_child(fishy.instantiate())
			6: $BigSpawn7.add_child(fishy.instantiate())
			
		y += 1
	
	# Connects cursor to camera view
	if get_global_mouse_position().x > -1440 + SmolViewport.size.x/2 and get_global_mouse_position().x < 1440 - SmolViewport.size.x/2:
		SmolCam.position.x = get_global_mouse_position().x
	if get_global_mouse_position().y > -810 + SmolViewport.size.y/2 and get_global_mouse_position().y < 810 - SmolViewport.size.y/2:
		SmolCam.position.y = get_global_mouse_position().y
	
	if transitiontimer == 0:
		if transition == "Surface":
			$Cursor.surfaced = true
		elif transition == "Dive":
			$Cursor.submerged = true
		else: pass
		
		if $Cursor.submerged:
			if Input.is_key_pressed(KEY_SPACE):
				$Cursor.submerged = false
				transition = "Surface"
				transitiontimer = 240
				
		if $Cursor.surfaced:
			if Input.is_key_pressed(KEY_SPACE):
				$Cursor.surfaced = false
				transition = "Dive"
				transitiontimer = 240
	else:
		transitiontimer -= 1
		$AnimationPlayer.play(transition)
	
	if pictimer == 0:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			pictimer = 30
			$Camera.play()
			if $Cursor.submerged:
				mouseL.emit()
	else: pictimer -= 1
	
	
	
	
	
