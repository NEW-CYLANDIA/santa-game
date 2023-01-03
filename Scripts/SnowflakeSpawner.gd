extends Node2D

export var snowflake_interval:float = 1;
export var snowflake_speed:float = 3.1;
export var snowflake_vel:Vector2 = Vector2();
export var snowflake_spawn_delay:float = 3.0;
export var spawn_rect_width:float = 320;
export var spawn_rect_height:float = 180
export(PackedScene) var snowflake_scene:PackedScene

var snowflake_timer:float = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	snowflake_timer = -snowflake_spawn_delay;
	pass # Replace with function body.

func _process(delta):
	snowflake_timer += delta;
	snowflake_interval -= 0.0002;
	if snowflake_timer > snowflake_interval:
		snowflake_timer = 0;
		var s:Snowflake = snowflake_scene.instance();
		s.position.x = rand_range(0, spawn_rect_width);
		s.position.y = rand_range(0, spawn_rect_height);
		s.vel = snowflake_vel.normalized() * (snowflake_speed + rand_range(-snowflake_speed/3, snowflake_speed/3))
		add_child(s);
