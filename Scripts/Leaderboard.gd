extends Node2D

export (NodePath) var container_path
var container;
export(PackedScene) var leaderboard_entry;

# Called when the node enters the scene tree for the first time.
func _ready():
	container = get_node(container_path);
	Stats.Sort_Leaderboard();
	var entry_color = 0x1d2b53ff
	var other_entry_color = 0x192445ff
	var current_color = entry_color;
	for entry in Stats.leaderboard:
		var e = leaderboard_entry.instance();
		e.color = current_color;
		if (current_color == entry_color): current_color = other_entry_color;
		else: current_color = entry_color;
		e.get_node("name").text = entry.name;
		e.get_node("score").text = str(entry.score);
		container.add_child(e);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
