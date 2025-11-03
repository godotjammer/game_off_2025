@abstract class_name BehaviorDecorator extends Behavior

var _child: Behavior

func _init(child: Behavior):
	_child = child

func _tick() -> Result:
	return _decorate(_child.tick())

@abstract func _decorate(result: Result) -> Result
