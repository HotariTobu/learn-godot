extends Node


func _ready():
	var person = Person.new()
	var people: Array[Person] = []
	var inner = Inner.new()

	var parent = Parent.new()
	var child = Child.new()

	#print("\n### Object ###")
	#print_type(Object)

	#print("\n### Node ###")
	#print_type(Node)

	print("\n### self ###")
	print_type(self)

	print("\n### Person ###")
	print_type(Person)

	print("\n### person ###")
	print_type(person)

	print("\n### people ###")
	print_type(people)

	print("\n### inner ###")
	print_type(inner)

	print("\n### parent ###")
	print_type(parent)

	print("\n### child ###")
	print_type(child)

	print("\n### is_instance_of ###")
	#print(is_instance_of(person, person))
	print(is_instance_of(person, Person))
	print(is_instance_of(person, person.get_script()))
	print(is_instance_of(person, people.get_typed_script()))

	print(is_instance_of(self, Node))
	print(is_instance_of(self, get_script()))

	print("\n### Script = ###")
	print(person.get_script() == people.get_typed_script())

	#print(ClassDB.get_class_list())

	print("\n### person.person.gd ###")
	print(person.get("person.gd"))

	print("\n### person method list ###")
	for method_info in person.get_method_list():
		var method = Method.new(method_info)
		if method.name != "message_to":
			continue

		print(method)

		var callable = Callable(person, method.name)
		print(callable)

	person.set("age", "five")
	printt("person.age", person.age)

	person.set("age", 5)
	printt("person.age", person.age)


static func print_type(value: Variant):
	printt("Type Name", type_string(typeof(value)))

	var script: Script

	if value is GDScript:
		script = value

	elif value is Array:
		script = value.get_typed_script()

	elif value is Object:
		printt("Class", value.get_class())
		print_property_list(value.get_property_list())
		script = value.get_script()

	if script == null:
		return

	printt("Script", script)

	printt("Base Script", script.get_base_script())
	printt("Base Type", script.get_instance_base_type())

	print_if_not_empty("script Constant map", script.get_script_constant_map())
	print_if_not_empty("script Method list", script.get_script_method_list())
	print_if_not_empty("script Property list", script.get_script_property_list())
	print_if_not_empty("script Signal list", script.get_script_signal_list())

	var global_name = script.get_global_name()
	if global_name == "":
		return

	printt("Global Name", global_name)
	#printt("Type", ClassDB.instantiate(global_name))

	print_if_not_empty("class Enum list", ClassDB.class_get_enum_list(global_name))
	print_if_not_empty("class Method list", ClassDB.class_get_method_list(global_name))
	print_if_not_empty("class Property list", ClassDB.class_get_property_list(global_name))


static func print_property_list(property_list: Array[Dictionary]):
	printt("Property List", "[")

	for property_info in property_list:
		var property = Property.new(property_info)
		printt("", property)

	print("]")


static func print_if_not_empty(label: String, data):
	if data.is_empty():
		return

	printt(label, data)


class Inner:
	pass


class Property:
	var name: String
	var classname: StringName
	var type: Variant.Type
	var hint: PropertyHint
	var hint_string: String
	var usage: PropertyUsageFlags

	var type_name: String:
		get:
			if type == TYPE_OBJECT:
				return classname
			else:
				return type_string(type)

	func _init(info: Dictionary):
		name = info["name"]
		classname = info["class_name"]
		type = info["type"]
		hint = info["hint"]
		hint_string = info["hint_string"]
		usage = info["usage"]

	func _to_string():
		return (
			"%s: %s"
			% [
				name,
				type_name,
			]
		)


class Method:
	var name: String
	var args: Array[Property]
	var default_args: Array
	var flags: MethodFlags = METHOD_FLAGS_DEFAULT
	var id: int
	var ret: Property

	func _init(info: Dictionary):
		name = info["name"]
		args = []
		for arg_info in info["args"]:
			var arg = Property.new(arg_info)
			args.append(arg)
		default_args = info["default_args"]
		flags = info["flags"]
		id = info["id"]
		ret = Property.new(info["return"])

	func _to_string():
		return (
			"%s(%s) -> %s"
			% [
				name,
				", ".join(args),
				ret.type_name,
			]
		)
