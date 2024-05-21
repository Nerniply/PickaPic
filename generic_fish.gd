extends AnimatedSprite2D

@onready var spawnpoint = Vector2(0,0)
var target
var isSmol
var bigVersion
var pathtobig
var spd
var traveldist
var currState: int = behavior.PAUSE
var relativeposition = Vector2()
var statetimer = 0
var fish = "Generic"
var motion = "swim_L"

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(randf_range(0,1),randf_range(0,1),randf_range(0,1))
	position = spawnpoint
	if get_parent().is_in_group("SMOL"):
		isSmol = true
		
		#bigVersion = get_parent().BigVersion.find_child(self.name)
		#print(bigVersion)
		#bigVersion = get_parent().BigVersion.find_child(self.name)
		#bigVersion = get_parent().get_node(pathtobig)
		bigVersion = get_parent().BigVersion.get_child(self.get_index())
		pathtobig = get_path_to(bigVersion)
		#bigVersion = get_parent().get_node(pathtobig)
		#if bigVersion == null:
		#	print("null")
		#print(bigVersion)
	else:
		isSmol = false
		spd = 0
		target = get_parent().new_target()

func setState(newState: int):
	if newState == currState:
		return
	currState = newState
	emit_signal("stateChanged", currState)

enum behavior {
	MOVE,
	PAUSE,
	HIDE
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	play(motion)
	
	if isSmol:
		self.position = bigVersion.position
		self.flip_h = bigVersion.flip_h
		self.scale = bigVersion.scale
	else:
		self.position += position.direction_to(target).normalized() * spd
		relativeposition = target - position
		if relativeposition.x < 0:
			self.flip_h = false # right
		else:
			self.flip_h = true # left
		
		match currState:
			behavior.MOVE:
				motion = "swim_L"
				if abs(position.distance_to(target)) < spd:
					setState(behavior.PAUSE)
					#print("pausing")
					statetimer = 0
					spd = 0
			behavior.PAUSE:
				motion = "idle_L"
				if statetimer < 120:
					statetimer += 1
					if statetimer == 120:
						target = get_parent().new_target()
				else:
					if randi_range(1,4) == 4:
						setState(behavior.HIDE)
						#print("hiding")
						target = spawnpoint
						spd = 8
						statetimer = 0
					else: 
						setState(behavior.MOVE)
						#print("moving")
						spd = 2
			behavior.HIDE:
				motion = "swim_L"
				if abs(position.distance_to(target)) < spd:
					spd = 1
				elif abs(position.distance_to(target)) == 0:
					spd = 0
				else: pass
				
				if statetimer < 240:
					statetimer += 1
					if statetimer == 240:
						target = get_parent().new_target()
				else:
					setState(behavior.MOVE)
					#print("moving")
					spd = 2


#func _on_visible_on_screen_notifier_2d_screen_entered():
	#if isSmol:
		#get_parent().get_parent().inframecounter += 1
	#else: pass
#
#
#func _on_visible_on_screen_notifier_2d_screen_exited():
	#if isSmol:
		#get_parent().get_parent().inframecounter -= 1
	#else: pass
