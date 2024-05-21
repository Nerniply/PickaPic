extends Node2D

@onready var BigVersion = $"../../../../../../../BigSpawn5"
var LinkedObjects = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if BigVersion.get_child_count() > LinkedObjects.size():
		for fish in BigVersion.get_children():
			var smolfish = fish.duplicate()
			self.add_child(smolfish)
			smolfish.bigVersion = fish
			smolfish.pathtobig = $BigVersion/fish
			LinkedObjects[fish]= smolfish
	elif BigVersion.get_child_count() < LinkedObjects.size():
		for item in LinkedObjects.keys():
			if BigVersion.get_children().has(item) == false:
				(LinkedObjects.get(item)).queue_free()
				LinkedObjects.erase(item)
