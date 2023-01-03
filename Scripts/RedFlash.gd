extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	color.a -= delta*2;
	if (color.a < 0): color.a = 0;


func _on_Rudolph_hit_registered():
	color.a = 1;
