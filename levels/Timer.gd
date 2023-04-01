extends Timer


var flyScene = preload("res://characters/fly.tscn")




# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	randomize()
	
	var fly = flyScene.instantiate()
	
	fly.position = (Vector2(0, randi_range(120, 500)))
	
	
	add_child(fly)
	
	get_parent().unheal(0)
	
	wait_time = 0.7
	
	
