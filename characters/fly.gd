extends Area2D


var tongueScene = preload("res://tongue.tscn")

var x_speed = 1
var frog_pos = Vector2.ZERO



@onready var gameScene = get_parent().get_parent()

# add out of bounds check for flies
# only reduce health when flies go out of bounds

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	x_speed = randf_range(1.5, 7)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	frog_pos = gameScene.get_node("frog").position
#	frog_pos.y += 10
#	frog_pos.x -= 10
	position += Vector2(x_speed, 0)
	pass



func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.pressed):
			flyClick(event.position)
			queue_free()




# Draw line by getting node  "frog" from the parent of the parent
# maybe add distance check (to force player to move before eating far flies

func flyClick(fly_pos: Vector2):
	var tongue = tongueScene.instantiate()
	
	tongue.spawn(frog_pos, fly_pos)
	
	get_parent().add_child(tongue)

	gameScene.heal()
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	get_parent().get_parent().unheal(x_speed)
	queue_free()
	pass # Replace with function body.
