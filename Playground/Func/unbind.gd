extends Node

func _ready():
	printt.unbind(1).call(1, 2)
	printt.unbind(1).bind(3, 4).call(1, 2)
	printt.bind(3, 4).unbind(1).call(1, 2)
	
	#Invalid call to function '@GlobalScope::printt (Callable) (Callable)'. Expected 100 arguments.
	#printt.unbind(100).call()
	
	printt(foo.get_argument_count(), foo.get_bound_arguments_count())
	
	var foo1 = foo.unbind(1)
	printt(foo1.get_argument_count(), foo1.get_bound_arguments_count())
	
	var foo123 = foo.unbind(1).bind(3, 4)
	printt(foo123.get_argument_count(), foo123.get_bound_arguments_count())
	
	var foo134 = foo.bind(3, 4).unbind(1)
	printt(foo134.get_argument_count(), foo134.get_bound_arguments_count())

func foo(arg):
	pass
