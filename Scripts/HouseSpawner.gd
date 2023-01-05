extends Node2D

export(PackedScene) var house_scene:PackedScene
export(PackedScene) var angle_house_scene:PackedScene;

export var house_frequency = 0.5
export var move_speed:float = 5;

var house_width = 80;
var current_house;
var house_index = 0;
var start_x = 640;

signal present_landed;

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_house();

func _process(delta):
	if ((start_x - current_house.position.x) > house_frequency * house_width):
		spawn_house();
	
func spawn_house():
	var rand = randf()
	
	var h;
	
	if rand < 0.2:
		h = angle_house_scene.instance();
		h.connect("present_bounced", self, "on_present_bounced");
	else:
		h = house_scene.instance(); 
		h.connect("present_landed", self, "on_present_landed");
	add_child(h);
	h.position.x = start_x + rand_range(-20, 20);
	h.position.y = 180 - 20 + (sin(house_index*2)*10);
	house_index+=1;
	current_house = h;
	h.speed = move_speed;
	
func on_present_landed(pos, right_color):
	$PresentLanded.play();
	$PresentLanded.position = pos;
	emit_signal("present_landed", pos, right_color);
func on_present_bounced(pos):
	$PresentBounced.play();
	$PresentBounced.position = pos;
