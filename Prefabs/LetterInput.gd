extends Node2D
class_name LetterInput
var abc = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
onready var text = get_node("Label");
var letter_index = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func increment():
	if (letter_index < abc.length()-1):
		letter_index+=1;
	else:
		letter_index = 0;
	text.text = abc[letter_index];
func decrement():
	if (letter_index > 0):
		letter_index -= 1;
	else: 
		letter_index = abc.length() - 1;
	text.text = abc[letter_index];
