extends Node

var RED = 0;
var PINK = 1;
var ORANGE = 2;
var GREEN = 3;

var NUM_COLORS = 4;

func get_random() -> int:
	var col = int(rand_range(0, NUM_COLORS));
	print(col);	
	return col
