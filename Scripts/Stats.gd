extends Node

var score = 0;

var leaderboard:Array = [];
var save_data_path = "user://savegame.save";
func _ready():
	Load();
func Add_Leaderboard_Entry_With_Current_Score(name):
	var found_existing_entry = false;
	for entry in leaderboard:
		if (entry.name == name):
			found_existing_entry =true;
			if (entry.score < Stats.score):
				entry.score = Stats.score;
	if (!found_existing_entry):
		leaderboard.append({name=name, score=Stats.score});
	Save();

func Sort_Leaderboard():
	leaderboard.sort_custom(self, "_sort_by_score");
func _sort_by_score(a, b):
	return a.score > b.score;

func Save():
	var save_game = File.new()
	save_game.open(save_data_path, File.WRITE)
	var serialized_leaderboard = to_json(leaderboard);
	save_game.store_line(serialized_leaderboard);
	save_game.close();
func Load():
	var save_game = File.new();
	if not save_game.file_exists(save_data_path):
		print("tried load, no file");
		return;
	save_game.open(save_data_path, File.READ);
	var deserialized_leaderboard = parse_json(save_game.get_line());
	leaderboard = deserialized_leaderboard;
	save_game.close();
	
