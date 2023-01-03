extends Node2D

var hearts:Array;
var heart_index = 2;

signal santas_dead;
func _ready():
	hearts = get_children();

func _on_Rudolph_hit_registered():
	if (heart_index == 0):
		emit_signal("santas_dead");
		queue_free();
		return;
	hearts[heart_index].queue_free();
	heart_index-=1;
