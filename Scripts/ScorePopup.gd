extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var oy;
var lifetime = 1
export(Color) var first_color = 0xffffffff;
export(Color) var second_color = 0x29adffff;

var color_flip_timer = 0;
var color_flip_interval = 0.07;
# Called when the node enters the scene tree for the first time.
func _ready():
	oy = rect_position.y;
	pass # Replace with function body.

func set_pos(pos):
	rect_position = pos;
	oy = pos.y;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	color_flip_timer += delta;
	if (color_flip_timer > color_flip_interval):
		modulate = first_color;
	if (color_flip_timer > color_flip_interval * 2):
		modulate = second_color;
		color_flip_timer = 0;
	lifetime -= delta;
	if (lifetime < 0):
		queue_free();
	rect_position.y = lerp(rect_position.y, oy-30, 0.1);
