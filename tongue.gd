extends Line2D


@onready var gameScene = get_parent().get_parent()


var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", do_this)
	timer.wait_time = 0.1
	timer.one_shot = true
	add_child(timer)
	timer.start()
	

func do_this():
	despawn()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_point_position(0, gameScene.get_node("frog").position)
	pass


func spawn(start: Vector2, end: Vector2):
	antialiased = true
	add_point(start)
	add_point(end)
	width = 7	
	
	pass


func set_start(start: Vector2):
	pass

func despawn():
	timer.queue_free()
	queue_free()
