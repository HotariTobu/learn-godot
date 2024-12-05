extends Node

signal sig(msg: String)

func _ready():
	sig.connect(print)
	
	var emit = sig.emit.bind('Hello')
	emit.call_deferred()

	var s = sig.emit.bind('Hi') as Callable
	s.call()
