extends Sprite
class_name House

var speed;
var particles:CPUParticles2D
signal present_landed;

func _ready():
	particles = get_node("CPUParticles2D");
	if (randf() > 0.5):
		frame = 0;
	else:
		frame = 1;

func _process(delta):
	position.x -= speed;
	z_index = MathUtil.map_range(position.x, 0, 320, -1, -20);




func _on_Area2D_area_entered(area):
	var present:Present = area.get_parent();
	if (present.vel.y > 0):
		emit_signal("present_landed", area.get_parent().position);
		area.get_parent().queue_free();
		particles.emitting = true;
