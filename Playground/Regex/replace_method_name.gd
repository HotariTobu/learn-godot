extends Node

const PATTERN = "(?<=[^\\p{ID_Continue}])%s(?=[^\\p{ID_Continue}])"
const REPLACEMENT = "__$0"

const SCRIPT = '''

func _ready():
	var value =native_method()
	var value = native_method()
	native_method(native_method())
	native_method(native_method)
	native_method(
		native_method(),native_method()
	)
	native_method ()
	native_method \
	()

	not_native_method()
	native_method_hack()
	
'''

const METHOD_NAME = "native_method"


func _ready():
	var regex = RegEx.new()
	regex.compile(PATTERN % METHOD_NAME)

	var new_script = regex.sub(SCRIPT, REPLACEMENT, true)
	print(new_script)
