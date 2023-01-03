extends Node2D
export(NodePath) var cannon_path;
var cannon:Cannon
var height = 3;
# Called when the node enters the scene tree for the first time.
func _ready():
	cannon = get_node(cannon_path);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update();
	
func _draw():
	draw_rect(Rect2(Vector2(0, -10), Vector2(MathUtil.map_range(cannon.reload_timer, 0, cannon.reload_time, 0, height*2), height)), Color.white);
