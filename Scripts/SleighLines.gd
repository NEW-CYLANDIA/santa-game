extends Node2D
export(NodePath) var sleighPath;
export(NodePath) var rudolphPath;
export(NodePath) var herdPath;

var reindeer:Array;
var sleigh;

func _ready():
	for r in get_node(herdPath).get_children():
		reindeer.append(r);
	reindeer.append(get_node(rudolphPath));
	sleigh = get_node(sleighPath);

func _process(delta):
	update();
func _draw():
	for r in reindeer:
		draw_line(sleigh.position, r.position, 0x1d2b53ff, 1);
