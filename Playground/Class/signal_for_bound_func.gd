extends Node

signal some_event

func _init():
	print('### Phase 1 ###')
	some_event.connect(handler)
	some_event.connect(handler_with_arg.bind(5))

	some_event.emit()
	print(some_event.get_connections())
	
	some_event.disconnect(handler)
	some_event.disconnect(handler_with_arg.bind(5))

	some_event.emit()
	print(some_event.get_connections())
	
	print('### Phase 2 ###')
	some_event.connect(handler)
	some_event.connect(handler_with_arg.bind(5))
	some_event.connect(handler_with_arg.bind(10))

	some_event.emit()
	print(some_event.get_connections())
	
	some_event.disconnect(handler_with_arg.bind(0))

	some_event.emit()
	print(some_event.get_connections())
	
	print('### Phase 3 ###')
	some_event.connect(handler_with_arg.bind(5))

	some_event.emit()
	print(some_event.get_connections())
	
	some_event.disconnect(handler_with_arg)

	some_event.emit()
	print(some_event.get_connections())


func handler():
	print('Handled!')


func handler_with_arg(value: int):
	printt('Handled!', value)
