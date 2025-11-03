class_name Enemy extends PathFollow3D

signal attack(damage: float)

@export var damage: float

var is_dead: bool

func apply_damage(amount: float, type: int):
	for child in get_children():
		if child.has_method("apply_damage"):
			child.apply_damage(amount, type)

func do_attack():
	attack.emit(damage)
