extends Sprite
class_name Present
var vel:Vector2 = Vector2();
var future_pos:Vector2;
var sim_speed = 0.75
var color:int
export var is_preview:bool = false;
func _ready():
	future_pos = position;
func _process(delta):
	if (not is_preview):
		rotate(0.1);
		position += (future_pos - position) * sim_speed;
		if (position.distance_to(future_pos) < sim_speed):
			step();
func step():
	vel.y += PresentPhysics.gravity;
	future_pos += vel;
	vel.x *= PresentPhysics.friction

func shoot(vec:Vector2, new_color:int):
	future_pos = position;
	set_color(new_color)
	vel += (vec.normalized() * PresentPhysics.speed);
func set_color(new_color):
	color = new_color;
	frame = new_color; 
	update();
