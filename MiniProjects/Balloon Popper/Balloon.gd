extends Area3D

@export var clicks_to_pop : int = 5
@export var size_increase : float = 0.2
@export var score_to_give : int = 1
@onready var balloon_pop_sound = get_node("/root/Main/BalloonPop")
@onready var balloon_click_sound = get_node("/root/Main/BalloonClick")

func _on_input_event(camera, event, position, normal, shape_idx):
	
	# check if mouse button click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		balloon_click_sound.play()
		scale += Vector3.ONE * size_increase
		clicks_to_pop -= 1
		
		if clicks_to_pop == 0:
			get_node("/root/Main:").increase_score(score_to_give)
			balloon_pop_sound.play()
			queue_free()

