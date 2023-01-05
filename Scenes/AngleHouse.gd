extends Sprite


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var speed;
signal present_bounced;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	position.x -= speed;
	z_index = MathUtil.map_range(position.x, 0, 320, -1, -20);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area2D_area_entered(area: Area2D) -> void:
	var present:Present = area.get_parent();
	emit_signal("present_bounced", present.position);
	if (present.vel.y > 0):
		present.vel = Vector2(scale.x, -1.5).normalized() * (present.vel.length()*1.2);
	
