## INI HARUSNYA PUNYA LOKER

extends transparancable_object

onready var command_line = $line_wrapper/LineEdit
var _sandi = ""
var is_closed = true

func _ready():
	command_line.visible=false
	set_sandi("t980v")

func set_sandi(sandi):
	_sandi=sandi

func interact():
	# get_tree().change_scene("res://scenes/post-level/post1.tscn")
	if is_closed:
		command_line.grab_focus()
		command_line.visible=true
		get_tree().paused=true
		print(command_line.visible)
	is_closed = true

func _on_LineEdit_text_entered(new_text):
	if new_text.to_lower() == _sandi.to_lower():
		print("berhasil")
		get_tree().change_scene("res://scenes/post-level/post1.tscn")
	command_line.visible=false
	get_tree().paused=false
	print(command_line.visible)
	is_closed = false
