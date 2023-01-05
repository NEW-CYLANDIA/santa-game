extends Node

var combo = 1;
var score = 0;
var score_increment = 100;

export(PackedScene) var popup_scene:PackedScene;
signal got_score;
func _ready():
	pass # Replace with function body.

func _on_HouseSpawner_present_landed(pos, right_color):
	var value_multiplier = 1;
	if right_color: value_multiplier = 2;
	score += (score_increment * value_multiplier) * combo;
	Stats.score = score;
	emit_signal("got_score", score_increment * value_multiplier, combo, score);
	combo += 1;

func _on_Rudolph_hit_registered():
	combo = 1;
