extends Node2D

export(Array, NodePath) var letter_input_paths;
var letter_inputs:Array;
onready var select_rect = get_node("ColorRect");
export var letter_input_dist:float = 28;
var letter_index = 0;
var select_want_pos:Vector2;
var abc = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var submitted = false;
var declined = false;
signal submitted;
signal declined;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	select_want_pos = select_rect.rect_position;
	for p in letter_input_paths:
		letter_inputs.append(get_node(p));
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!submitted && !declined):
		if (Input.is_action_just_pressed("ui_right")):
			if (letter_index < 2):
				letter_index += 1;
				select_want_pos.x += letter_input_dist;
		if (Input.is_action_just_pressed("ui_left")):
			if (letter_index > 0):
				letter_index -=1;
				select_want_pos.x -= letter_input_dist;
		
		if (Input.is_action_just_pressed("ui_up")):
			letter_inputs[letter_index].decrement();
		if (Input.is_action_just_pressed("ui_down")):
			letter_inputs[letter_index].increment();
		select_rect.rect_position = select_rect.rect_position.linear_interpolate(select_want_pos,0.2);
		if (Input.is_action_just_pressed("fire")):
			_submit();
		if (Input.is_action_just_pressed("leaderboard")):
			_cancel();
	else:
		select_rect.visible = false;
func _submit():
	submitted = true;
	emit_signal("submitted");
	Stats.Add_Leaderboard_Entry_With_Current_Score(get_name());
func _cancel():
	declined = true;
	emit_signal("declined");
	queue_free();
func get_name():
	var name = "";
	for i in letter_inputs:
		name += i.text.text;
	return name;
