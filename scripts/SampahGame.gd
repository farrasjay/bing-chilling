extends Control

export (NodePath) var kotak_sampah_path
var kotak_sampah

func _ready():
	kotak_sampah = get_node(kotak_sampah_path)
	kotak_sampah.connect("open", self, "show")
	

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		hide()
	
func show():
	$"../../tembok2/player".is_active = false
	visible = true
	
func hide():
	$"../../tembok2/player".is_active = true
	visible = false


func _on_Exit_button_pressed():
	hide()
