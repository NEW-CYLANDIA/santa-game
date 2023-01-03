extends Node2D

export var rudolphPath:NodePath;
var reindeer:Array
var rudolph:Rudolph
export var santaPath:NodePath;
var santa:Sleigh;

# Called when the node enters the scene tree for the first time.
func _ready():
	santa = get_node(santaPath);
	rudolph = get_node(rudolphPath);
	reindeer = get_children()

func _process(delta):
	var sample_num=7
	var delay=1
	if (rudolph.points.size() > sample_num):
		var i = rudolph.points.size() - sample_num*delay-1
		var index = reindeer.size()-1;
		while (i < rudolph.points.size()):
			var r:Reindeer = reindeer[index];
			r.position.x = rudolph.points[i].x + (r.original_pos.x - rudolph.original_pos.x);
			r.real_y = rudolph.points[i].y + (r.original_pos.y - rudolph.original_pos.y);
			i+=delay;
			index-=1;
	var santa_dist = 14;
	if (rudolph.points.size() > santa_dist):
		santa.position = santa.position.linear_interpolate(rudolph.points[rudolph.points.size() - santa_dist] + (santa.original_pos - rudolph.original_pos), delta*10);
