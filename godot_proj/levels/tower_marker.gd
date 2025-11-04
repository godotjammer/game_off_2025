class_name TowerMarker extends Node3D

@export var _overlay: MeshInstance3D

var tower: TowerDesc
var _node: Tower

func _ready() -> void:
	_node = tower.file.instantiate() as Tower
	_node.is_icon = true
	_overlay.scale.x = _node.tower_range
	_overlay.scale.z = _node.tower_range
	visible = false
	add_child(_node)
	Level.get_instance().map.placement_mode = true

func _exit_tree() -> void:
	Level.get_instance().map.placement_mode = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var evt := event as InputEventMouseMotion
		var pos := evt.global_position
		var final_pos := _get_world_pos(pos)
		if not _test_position(final_pos):
			visible = false
			return
		global_position = final_pos
		visible = true
	elif event is InputEventMouseButton:
		var evt := event as InputEventMouseButton
		if evt.button_index == MOUSE_BUTTON_RIGHT:
			queue_free()
		elif evt.button_index == MOUSE_BUTTON_LEFT and evt.pressed:
			var pos := _get_world_pos(evt.position)
			if not _test_position(pos): return
			var node := tower.file.instantiate() as Tower
			get_tree().current_scene.add_child(node)
			node.global_position = pos
			MoneyTracker.get_instance().coins -= tower.cost
			queue_free()

func _get_world_pos(pos: Vector2) -> Vector3:
		var cam := get_viewport().get_camera_3d()
		var origin := cam.project_ray_origin(pos)
		var dir := cam.project_ray_normal(pos)

		var space := get_world_3d().direct_space_state
		var query := PhysicsRayQueryParameters3D.create(origin, origin + dir * 500, 1)
		var result := space.intersect_ray(query)
		if not result.has("position"): return Vector3.ZERO
		return result["position"] as Vector3

func _test_position(pos: Vector3) -> bool:
	var start = pos + Vector3.UP
	var end = pos + Vector3.DOWN
	var space := get_world_3d().direct_space_state
	var query := PhysicsRayQueryParameters3D.create(start, end, 2)
	var result := space.intersect_ray(query)
	if result.keys().size() == 0: return false
	return true
