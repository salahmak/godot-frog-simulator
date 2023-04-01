extends Node2D

@export var health = 100

var gameOverScene = preload("res://levels/game_over.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Health.value = health
	
	if(health <= 0):
		print("dead")
		get_tree().paused = true
		add_child(gameOverScene.instantiate())
		
	pass


func drawLine(start: Vector2, end: Vector2):
	pass


func heal():
	health += 5
	if(health > 100):
		health = 100

func unheal(amount):
	health -= amount + 4
