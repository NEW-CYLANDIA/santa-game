extends Sprite
class_name Snowflake
var speed = 0;
var iters = 0;
var vel:Vector2 = Vector2();
func _ready():
	pass # Replace with function body.

func _process(delta):
	iters += 1;
	position.x += vel.x;
	position.y += vel.y;
	rotate(-vel.x/18);
