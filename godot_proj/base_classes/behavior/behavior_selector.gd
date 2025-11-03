class_name BehaviorSelector extends BehaviorGroup

func _tick() -> Result:
	for child in _children:
		var result := child.tick()
		if result != Result.FAIL: return result
	return Result.FAIL
