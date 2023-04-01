extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	replay()
	pass # Replace with function body.



func replay():
	get_tree().reload_current_scene()
	get_tree().paused = false
	queue_free()
