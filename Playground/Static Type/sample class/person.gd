class_name Person
extends Object

var name: String
var age: int

static var person_set: Array[Person]


func message_to(person: Person, time: float, message = "Hello"):
	print("%s from %s to %s at %s" % [message, name, person.name, time])
