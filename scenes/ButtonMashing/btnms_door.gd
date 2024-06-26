extends transparancable_object

class_name btnms_door

onready var door_closed = $door_closed
onready var door_opened = $door_opened

var status

# Called when the node enters the scene tree for the first time.
func _ready():
	door_closed.visible=true
	door_opened.visible=false
	status = "closed"

func interact():
	print(self)
	if Level3Manager.get_counter() == 3:
		get_tree().change_scene("res://scenes/ButtonMashing/ButtonMashing.tscn")
	else:
		DialogueBoxManager.emit_signal("type", "I'm not strong enough. I need to collect more food.")

func open():
	door_closed.visible = false
	door_opened.visible = true

func close():
	door_closed.visible = true
	door_opened.visible = false
