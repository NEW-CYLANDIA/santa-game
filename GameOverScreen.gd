extends Node2D

enum MenuState {
	NAME_ENTRY,
	NAME_SUBMITTED
}

var state = MenuState.NAME_ENTRY; #using enum above
onready var submit_prompt = get_node("AToSubmit");
onready var name_cancel = get_node("BToDiscard");
onready var restart_prompt = get_node("AToStart");
onready var leaderboard_prompt = get_node("BToLeaderboard");
onready var name_form = get_node("NameInput");
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == MenuState.NAME_SUBMITTED:
		if (Input.is_action_just_pressed("fire")):
			get_tree().change_scene("res://GameScene.tscn");
		if (Input.is_action_just_pressed("leaderboard")):
			get_tree().change_scene("res://Leaderboard.tscn");

func _on_NameInput_submitted():
	_name_input_complete();


func _on_NameInput_declined():
	_name_input_complete();

func _name_input_complete():
	state = MenuState.NAME_SUBMITTED;
	submit_prompt.visible = false;
	name_cancel.visible = false;
	
	restart_prompt.visible = true;
	leaderboard_prompt.visible = true;
