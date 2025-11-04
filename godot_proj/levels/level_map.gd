class_name LevelMap extends Node3D

@export var placement_regions: Array[MeshInstance3D]

var placement_mode: bool = false:
	set(val):
		placement_mode = val
		if is_node_ready(): _update_view()

func _ready() -> void:
	_update_view()

func _update_view():
	for item in placement_regions:
		item.visible = placement_mode
