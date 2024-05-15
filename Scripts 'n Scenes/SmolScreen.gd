extends Node2D
class_name SMOL

@onready var BigScreen = $"../../../../../BigScreen"
var LinkedObjects = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	for fish in BigScreen.get_children():
		var smolfish = fish.duplicate()
		self.add_child(smolfish)
		LinkedObjects[fish]= smolfish


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if BigScreen.get_child_count() > LinkedObjects.size():
		for fish in BigScreen.get_children():
			var smolfish = fish.duplicate()
			self.add_child(smolfish)
			LinkedObjects[fish]= smolfish
	elif BigScreen.get_child_count() < LinkedObjects.size():
		for item in LinkedObjects.keys():
			if BigScreen.get_children().has(item) == false:
				(LinkedObjects.get(item)).queue_free()
				LinkedObjects.erase(item)
				print("big fish erased")
	
	for value in LinkedObjects.values():
		value.position = BigScreen.get_child(LinkedObjects.values().find(value)).position
		value.scale = BigScreen.get_child(LinkedObjects.values().find(value)).scale
		value.flip_h = BigScreen.get_child(LinkedObjects.values().find(value)).flip_h


func updatObjects():
	#BigScreen = $"../../../../../BigScreen"
	#for item in LinkedObjects.values():
		#if BigScreen.find_child(LinkedObjects.find_key(item)) == null:
			#LinkedObjects.erase(LinkedObjects.find_key(item))
	
	#if BigObjects == LinkedObjects.keys():
		#for fish in BigObjects:
			#LinkedObjects[fish].position = BigObjects[fish].position
	
	pass
