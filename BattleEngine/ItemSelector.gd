extends Node2D

var input = Vector2.ZERO
var selection = 0

var enabled = false

var positionArray = [ [Vector2(80,285), Vector2(320,285)], [Vector2(80,315), Vector2(320,315)]]
var soul
var blitter

var page = 0
var page_old = 0
var page_max = 0
var second_row = false

var list = []

signal select

func enable(_soul, _blitter):
	
	self.blitter = _blitter
	self.soul = _soul
	
	list = rows(Data.items)
	blitter.feed([string(), null, null, true]) # ether: should this be blitter or _blitter?
	
	select.connect(disable) # connect("select", Callable(self, "disable"))
	await get_tree().create_timer(0.1).timeout
	self.enabled = true

func string():
	var _string = ""
	
	var row_one = list[0].slice(2 * page, (2 * page) + 1, 1)
	var row_two = list[1].slice(2 * page, (2 * page) + 1, 1)
	
	var both = []
	
	both.append_array(row_one)
	both.append_array(row_two)
	
	var lines = 0
	
	for index in range(both.size()):
		var option = both[index]
		if index % 2 == 1:
			for spaces in range(14 - len(both[index-1])):
				_string += " "
			_string += "* " + option + "\n"
			lines += 1
		else:
			_string += "\t\t* " + option
	
	for line in range(2 - lines):
		_string += "\n"
	
	_string += "[right]PAGE "+ str(page + 1) +"[/right]"
	return _string

func rows(paralist, reverse = false):
	var copylist = paralist.duplicate(true)
	var size = copylist.size()
	var new_list = []
	if reverse:
		for sub in copylist:
			for element in sub:
				new_list.append(element)
		return new_list
	
	var page_num = ceil(copylist.size() / 4.0)
	page_max = page_num
	
	new_list.append_array([[],[]])
	
	for _page in range(page_num):
		for index in range(clamp(2, 1, copylist.size())):
			new_list[0].append(copylist.pop_front())
		for index in range(clamp(2, 1, copylist.size())):
			new_list[1].append(copylist.pop_front())
	
	return new_list

func _process(delta):
	if enabled:
		input.x = int(Input.is_action_just_pressed("ui_right")) - int(Input.is_action_just_pressed("ui_left"))
		input.y = (int(Input.is_action_just_pressed("ui_down")) - int(Input.is_action_just_pressed("ui_up")))
		
		selection = int(selection + input.x) % (list[int(second_row)].size())
		if selection < 0:
			selection = list[int(second_row)].size() - 1
		page = abs(((selection) / 2) % int(page_max))
		
		if input:
			get_parent().get_node("Squeak").play()
			if page_old != page:
				page_old = page
				blitter.feed([string(), null, null, true])
		
		if input.y and list[int(!second_row)].size() > selection:
			second_row = !second_row
		
		soul.position = positionArray[int(second_row)][selection % 2]
		
		if Input.is_action_just_pressed("ui_accept"):
			self.enabled = false
			get_parent().get_node("Select").play()
			select.emit() # emit_signal("select")
		elif Input.is_action_just_pressed("ui_cancel"):
			get_parent().get_node("Squeak").play()
			select.emit() # emit_signal("select")

func disable():
	select.disconnect(disable) # disconnect("select", Callable(self, "disable"))

func get_selection(): # was "selection"
	return list[int(second_row)][selection]
	
func cutscene():
	pass
