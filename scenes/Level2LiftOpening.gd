extends Node2D

onready var player_sprite = get_node("player/AnimatedSprite")
onready var player_collision = get_node("player/CollisionShape2D")
onready var lift_sprite = get_node("Lift")
onready var transition_screen = get_node("TransitionScreen1/AnimationPlayer")

func _ready():
	$player/AudioStreamPlayer2D.stream = load("res://assets/sfx/level2/lift-ongoing.mp3")
	$player/AudioStreamPlayer2D.play()
	
	transition_screen.play("fade_to_normal")
	player_collision.disabled = false
	player_sprite.play("default-front-idle")
	lift_sprite.play("opening")
	
	var lift_timer = Timer.new()
	lift_timer.set_wait_time(2.0)
	lift_timer.set_one_shot(true)
	lift_timer.connect("timeout", self, "_on_lift_timer_timeout")
	add_child(lift_timer)
	lift_timer.start()

func _on_lift_timer_timeout():
	lift_sprite.play("closing")
	transition_screen.play("fade_to_black")
	transition_screen.connect("animation_finished", self, "_on_transition_finished")

func _on_transition_finished(anim_name):
	if anim_name == "fade_to_black":
		get_tree().change_scene("res://scenes/pre-levels/transition-3.tscn")
