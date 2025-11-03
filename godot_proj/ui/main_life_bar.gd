class_name MainLifeBar extends CenterContainer

@export var _life_rect: ColorRect

func _ready() -> void:
	_instance = self

func set_life(amount: float, max_life: float):
	_life_rect.custom_minimum_size.x = 400 * clampf(amount / max_life, 0, 1)

static var _instance: MainLifeBar

static func get_instance() -> MainLifeBar:
	return _instance
