extends SubViewport

@onready var TotalScore = $"../../../../../PanelContainer2/MarginContainer/VBoxContainer/Label"
@onready var combobar = $"../../../../../PanelContainer2/MarginContainer/VBoxContainer/ComboBar"
var inframecounter = 0
var thirdscore = 0
var goldscore = 0
var centerscore = 0
var totalodd = 0
var totalthird = 0
var totalgold = 0
var totalcenter = 0
var singlescore = 0
var totaltotal = 0
var prevshot = 0
var lastshot = 0
var combo = 0
var combotimer = 0
var minzoom = 2
var curzoom = 2
var maxzoom = 8
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if inframecounter % 2 == 0:
		totalodd = 0
	elif inframecounter < 8:
		totalodd = (inframecounter + 1) / 2 * 75
	elif inframecounter > 0:
		totalodd = 300
	
	if thirdscore > 300:
		totalthird = 300
	else: totalthird = thirdscore
	
	if goldscore > 300:
		totalgold = 300
	else: totalgold = goldscore
	
	if centerscore > 300:
		totalcenter = 300
	else: totalcenter = centerscore
	
	singlescore = totalodd + totalthird + totalgold + totalcenter
	
	
	if prevshot != 0 and lastshot >= prevshot:
		combotimer = 180
		if combo != 9:
			combo += 1
	
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		#if 


func _on_test_1_mouse_l():
	prevshot = lastshot
	lastshot = singlescore
	
	
	if combo > 1:
		totaltotal += singlescore * combo
		combobar.value += 1
	else:
		totaltotal += singlescore
		combobar.value = 1
		
	
	
	TotalScore.text = "SCORE: " + str(totaltotal)
	#print(isframecounter)
	
