class_name Factory extends RefCounted

const _towers: Array[String] = [
	"res://towers/test_tower.tscn",
	"res://towers/gun_tower.tscn"
]

const _enemies: Array[String] = [
	"res://enemies/flying_saucer/flying_saucer.tscn"
]

const _tower_marker := "res://levels/tower_marker.tscn"
const _tower_select_menu := "res://ui/tower_select.tscn"

func spawn_gun_tower() -> Tower:
	return load(_towers[1]).instantiate() as Tower

func spawn_test_tower() -> Tower:
	return load(_towers[0]).instantiate() as Tower

func spawn_square_enemy() -> Enemy:
	return load(_enemies[0]).instantiate() as Enemy

func spawn_tower_marker() -> TowerMarker:
	return load(_tower_marker).instantiate() as TowerMarker

func spawn_tower_select_menu() -> TowerSelect:
	return load(_tower_select_menu).instantiate() as TowerSelect

static var _instance: Factory

static func get_instance() -> Factory:
	if not is_instance_valid(_instance): _instance = Factory.new()
	return _instance
