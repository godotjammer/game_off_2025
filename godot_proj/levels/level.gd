class_name Level extends Node3D

@export var map: LevelMap

func _ready() -> void:
	_instance = self

static var _instance: Level

static func get_instance() -> Level:
	return _instance
