extends Node


func _ready():
	var P: GDScript = Parent
	var C: GDScript = Child

	var p = P.new()
	var c = C.new()

	printt(p is Parent, c is Parent, p is Child, c is Child)
	printt(P.instance_has(p), P.instance_has(c), C.instance_has(p), C.instance_has(c))
	printt(isinstance(p, P), isinstance(c, P), isinstance(p, C), isinstance(c, C))
	printt(is_instance_of(p, Person), is_instance_of(c, Person), is_instance_of(p, Child), is_instance_of(c, Child))
	printt(is_instance_of(p, P), is_instance_of(c, P), is_instance_of(p, C), is_instance_of(c, C))


static func isinstance(instance: Object, script: Script) -> bool:
	var instance_script = instance.get_script()
	while instance_script != null:
		if instance_script == script:
			return true

		instance_script = instance_script.get_base_script()

	return false
