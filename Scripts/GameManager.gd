extends Node2D

func _ready():
	Stats.score = 0;
	pass # Replace with function body.

func _process(delta):
	if (Input.is_action_just_pressed("escape")):
		$PauseMenu.show();
func _on_Santa_santa_fallen():
	get_tree().change_scene("res://GameOver.tscn");
