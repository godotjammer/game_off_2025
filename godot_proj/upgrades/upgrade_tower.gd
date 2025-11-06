class_name UpgradeTower extends Tower

const link_range: float = 4.0

var _linked_tower: Tower

func _physics_process(_delta: float) -> void:
	if is_icon: return
	_link_tower()

func _link_tower():
	var target := _find_nearest_in_range()
	if is_instance_valid(_linked_tower) and _linked_tower != target:
		target.unlink_tower(self)
	if is_instance_valid(target):
		_linked_tower = target
		target.link_tower(self)

func _find_nearest_in_range() -> Tower:
	var nearest := _find_nearest()
	if nearest == null: return null
	if nearest.position.distance_to(self.position) > link_range: return null
	return nearest

func _get_chain(chain: Array[Tower]) -> Array[Tower]:
	chain.push_back(self)
	if is_instance_valid(_linked_tower): return _linked_tower._get_chain(chain)
	return chain

func _find_nearest() -> Tower:
	var list := get_tree().get_nodes_in_group("towers")
	var nearest: Tower = null
	var near_dist: float = 1000.0
	for item in list:
		if item == self: continue
		var tower := item as Tower
		var chain := tower._get_chain([])
		if chain.back() is UpgradeTower: continue
		if chain.has(self): continue
		var dist := tower.position.distance_to(self.position)
		if dist < near_dist:
			near_dist = dist
			nearest = item
	return nearest
