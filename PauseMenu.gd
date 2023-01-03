extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var can_unpause = false;
func _ready():
	pass # Replace with function body.

func show():
	can_unpause = false;
	print("tryin to show");
	visible = true;
	get_tree().paused = true;
func hide():
	visible = false;
	get_tree().paused = false;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (visible):
		if (Input.is_action_just_pressed("escape") && can_unpause):
			
			hide();
		if (Input.is_action_just_pressed("leaderboard")):
			get_tree().change_scene("res://Title.tscn")
		can_unpause = true;
func _exit_tree():
	get_tree().paused = false;
