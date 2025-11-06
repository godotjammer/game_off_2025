class_name Tower extends Node3D

@export var tower_range: float
@export var damage: float
@export var fire_rate: float

var is_icon: bool = false
var _links: Array[UpgradeTower]

func link_tower(tower: UpgradeTower):
	if not _links.has(tower): _links.push_back(tower)

func unlink_tower(tower: UpgradeTower):
	if _links.has(tower): _links.erase(tower)

func get_linked_range() -> float:
	var link_range := tower_range
	for link in _links:
		link_range += link.get_linked_range()
	return link_range

func get_linked_damage() -> float:
	var link_damage := damage
	for link in _links:
		link_damage += link.get_linked_damage()
	return link_damage

func get_linked_rate() -> float:
	var link_rate := fire_rate
	for link in _links:
		link_rate += link.get_linked_rate()
	return link_rate

func _get_chain(chain: Array[Tower]) -> Array[Tower]:
	chain.push_back(self)
	return chain
