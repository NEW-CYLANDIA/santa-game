extends Node
class_name Wave

static func GenerateWave(t, freq, height, offset):
	return (sin(t*freq)*height)+offset

