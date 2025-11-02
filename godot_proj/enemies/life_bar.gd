class_name LifeBar extends Node3D

@onready var _follow: Enemy = owner as Enemy

func _ready() -> void:
	position = _follow.global_position + Vector3(0, 1, 0)

func set_life(current: float, total: float):
	for child in get_children():
		if child.has_method("set_life"):
			child.set_life(current, total)

func _physics_process(_delta: float) -> void:
	position = _follow.global_position + Vector3(0, 1, 0)
