extends Node2D
class_name CannonPreview
export(NodePath) var cannonPath;
export(NodePath) var house_spawner_path;
var cannon:Cannon;
var house_spawner;
var preview_iters = 50;
# Called when the node enters the scene tree for the first time.
func _ready():
	cannon = get_node(cannonPath);
	house_spawner = get_node(house_spawner_path);
	
func _process(delta):
	update();

func _draw():
	var preview_pos = cannon.position;
	var vec = cannon.get_vec() * PresentPhysics.speed;
	for i in preview_iters:
		#problem: we're trying to account for house speed but the present is 25% slower than this
		draw_circle(preview_pos + Vector2.RIGHT, 1.5, 0x83769cff);
		vec.y += PresentPhysics.gravity;
		preview_pos += vec;
		vec.x *= PresentPhysics.friction;
