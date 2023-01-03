extends Node2D

export(PackedScene) var scene;
export var active:bool = true;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		if (Input.is_action_just_pressed("fire")):
			get_tree().change_scene_to(scene);
		if (Input.is_action_just_pressed("leaderboard")):
			get_tree().change_scene("res://Leaderboard.tscn");
