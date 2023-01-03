extends Sprite
class_name Rudolph
var vel:Vector2 = Vector2(0,0);
var real_y;
export var speed:float = 0.5;
var friction:float = 0.9;
var original_pos:Vector2;
export var points:Array = [];
var hit_timer = 0;
var thing_that_hit_us;
var thing_that_hit_us_pos;
export(NodePath) var sleighPath;
var sleigh;
export var knockback_power = 10;

signal hit_registered
# Called when the node enters the scene tree for the first time.
func _ready():
	sleigh = get_node(sleighPath);
	original_pos = position;
	real_y = position.y;

func _process(delta):
	hit_timer -= delta;
	
	if (hit_timer > 0):
		
		thing_that_hit_us.position =thing_that_hit_us_pos;
		pass;
	else:
		if (thing_that_hit_us):
			$Hit.play();
			sleigh.position += (thing_that_hit_us.position - position).normalized() * knockback_power;
			thing_that_hit_us.queue_free();
			thing_that_hit_us = null;
			emit_signal("hit_registered");
		var input = Vector2(0,0);
		if (Input.is_action_pressed("down")): input.y += 1;
		if (Input.is_action_pressed("up")): input.y -= 1;
		if (Input.is_action_pressed("left")): input.x -= 1;
		if (Input.is_action_pressed("right")): input.x += 1;
		vel += input * speed * delta;
		position.x += vel.x;
		real_y += vel.y;
		position.y = real_y + Wave.GenerateWave(OS.get_ticks_msec()/1000, 1, 1, 0);
		points.append(position);
		vel *= friction;


func _on_Sleigh_got_hit(area:Area2D):
	$Hit.play(0.1);
	area.monitorable = false;
	thing_that_hit_us = area.get_parent();
	thing_that_hit_us_pos = area.get_parent().position;
	hit_timer = 0.15;
	pass # Replace with function body.
