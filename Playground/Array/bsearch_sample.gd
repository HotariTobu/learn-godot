extends Node

func _ready():
	var d = {2: "a", 5: "b", 7: "c"}
	var ks = d.keys()
	
	printt(d, ks)
	
	ks.sort()
	
	printt(d, ks)
	
	for v in range(10):
		var i = ks.bsearch(v)
		var k = ks[i % len(ks)]
		printt(v, i, d[k])
	
	print('#####')
	
	for v in range(10):
		var i = ks.bsearch(v, false)
		var k = ks[i % len(ks)]
		printt(v, i, d[k])
	
	print('#####')
	
	for v in range(10):
		var i = ks.bsearch(v, false)
		var k = ks[i - 1]
		printt(v, i, d[k])
	
	print('#####')
	print('#####')
	print('#####')
	
	var vs = [-1, 3]
	print(vs)
	
	for v in range(10):
		printt(v, vs.bsearch(v), vs.bsearch(v) - 1, vs.bsearch(v, false), vs.bsearch(v, false) - 1)
