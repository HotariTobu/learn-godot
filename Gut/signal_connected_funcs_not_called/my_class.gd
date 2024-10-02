extends Node

signal something_occurred


func do_something():
	something_occurred.emit()
