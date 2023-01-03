extends Sprite
class_name Cannon
var angle = 45;
var desired_angle = 45;
var min_angle = 0;
var max_angle=90;
export(PackedScene) var presentScene:PackedScene;
export(NodePath) var fire_particles_path;
var fire_particles:CPUParticles2D;
export(NodePath) var sleighPath;
var sleigh:Sleigh
var old_sleigh_pos = Vector2(); 
export var reload_time = 0.75;
var reload_timer = 0; 
var reload_rect_size = 5;
func _ready():
	sleigh = get_node(sleighPath);
	fire_particles = get_node(fire_particles_path);
	pass # Replace with function body.


func _process(delta):
	reload_timer -= delta;
	if (reload_timer < 0): reload_timer = 0;
	var sleigh_pos_delta:Vector2 = sleigh.position - old_sleigh_pos;
	if (angle < min_angle): angle = min_angle;
	if (angle > max_angle): angle = max_angle;
	angle += sleigh_pos_delta.x * -1;
	angle = lerp(angle, desired_angle, 0.2);
	rotation_degrees = angle;
	
	if (Input.is_action_just_pressed("fire") && reload_timer <= 0):
		$Fire.play();
		fire_particles.emitting = true;
		reload_timer = reload_time;
		var p:Present = presentScene.instance();
		get_parent().get_parent().add_child(p);
		p.position = position + get_parent().position;
		p.shoot(get_vec());
		sleigh.position += get_vec() * -7;
	old_sleigh_pos = sleigh.position;
		
func get_vec():
	return Vector2(cos(deg2rad(angle + 180)), sin(deg2rad(angle + 180)));
