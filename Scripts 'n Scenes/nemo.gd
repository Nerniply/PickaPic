extends AnimatedSprite2D

var isSmol
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent() is SMOL:
		isSmol = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	play("swim_L")


func _on_area_2d_area_entered(area):
	print("connected")
