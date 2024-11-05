extends Node

var _undo_redo = UndoRedo.new()

var _array = []

func _ready():
	print(_array)
	
	_undo_redo.create_action('Add 5')
	_undo_redo.add_do_method(_array.append.bind(5))
	_undo_redo.add_undo_method(_array.erase.bind(5))
	_undo_redo.commit_action()
	
	print(_array)
	
	_undo_redo.undo()
	
	print(_array)
	
	_undo_redo.redo()
	
	print(_array)
	
	var m: Callable = _array.append.bind(5)
	printt('Valid', m.is_valid())
	printt('Object', m.get_object())
	printt('Object ID', m.get_object_id())
	printt('Method', m.get_method())

	#No constructor of "Callable" matches the signature "Callable(Array, String)".
	#var cm = Callable(_array, 'append').bind(5)
	#printt('Valid', cm.is_valid())
	#printt('Object', cm.get_object())
	#printt('Object ID', cm.get_object_id())
	#printt('Method', cm.get_method())
