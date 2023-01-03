extends Node
class_name MathUtil

static func map_range (number, inMin, inMax, outMin, outMax):
	return (number - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
