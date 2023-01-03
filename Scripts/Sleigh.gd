extends Sprite
class_name Sleigh
export(PackedScene)var  scorePopupScene:PackedScene;
var max_dist = 50;
var vel = Vector2(0,0);
var friction = 0.9;
var connectedReindeer:Node2D
var speed = 0.3;
var original_pos:Vector2;
signal got_hit;

func _ready():
	original_pos = position;


func _on_Area2D_area_entered(area):
	emit_signal("got_hit", area);


func _on_ScoreManager_got_score(base_score, combo, total_score):
	var p:Label = scorePopupScene.instance();
	p.text = str(base_score * combo);
	p.rect_position = Vector2.LEFT * 5;
	add_child(p);
