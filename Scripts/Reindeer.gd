extends Sprite
class_name Reindeer
var original_pos:Vector2;
var real_y;


# Called when the node enters the scene tree for the first time.
func _ready():
	original_pos =position;
	real_y = position.y;
	pass # Replace with function body.

func _process(delta):
	position.y = real_y + Wave.GenerateWave(OS.get_ticks_msec()/1000, 1, 1, 0);
