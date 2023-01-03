extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_dead = false;
var vel = Vector2();
var friction = 0.95;
var gravity = 0.2
signal santa_fallen;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_dead):
		vel.y += gravity;
		position += vel;
		vel.x *= friction;
		if (position.y > 200):
			emit_signal("santa_fallen");
			queue_free();



func _on_Hearts_santas_dead():
	$PlayerDeath.play();
	vel = Vector2(-5, -5);
	is_dead = true;
	get_node("../Area2D").queue_free();
