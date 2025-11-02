class_name BehaviorSequence extends BehaviorGroup

var _last: int

func _init(children: Array[Behavior]) -> void:
	_last = 0
	super._init(children)

func _tick() -> Result:
	for index in _children.size():
		if index < _last: continue
		var result := _children[index].tick()
		if result == Result.RUNNING:
			_last = index
			return Result.RUNNING
		elif result == Result.FAIL:
			_last = 0
			return Result.FAIL
	_last = 0
	return Result.SUCCEED
