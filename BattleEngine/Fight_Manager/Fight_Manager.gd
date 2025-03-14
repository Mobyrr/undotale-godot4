class_name Fight_Manager
extends Node2D

var input
var selection = 0

var enabled = false

var possiblePositions := [286, 318, 350]
var positionArray := []
@export var soul: PlayerSoul

var children = []

#var cutscene = [] # ether: wasn't commented before

signal select
signal cutscene_end

func cutscene(_arg): # to be overloaded
	pass

func _ready():
	cutscene_end.connect(get_selection)
	for child in get_children():
		if !child.spared:
			children.append(child)

func _process(_delta):
	if enabled:
		input = int(Input.is_action_just_pressed("ui_down")) - int(Input.is_action_just_pressed("ui_up"))
		
		if input:
			get_parent().get_node("Squeak").play()
		
		selection = (selection + input) % children.size()
		soul.position = Vector2(73, positionArray[selection])
		
		if Input.is_action_just_pressed("ui_accept"):
			self.enabled = false
			get_parent().get_node("Select").play()
			select.emit()
		elif Input.is_action_just_pressed("ui_cancel"):
			get_parent().get_node("Squeak").play()
			select.emit()

func enable():
	positionArray = possiblePositions.slice(0, children.size())
	connect("select", Callable(self, "disable"))
	await get_tree().create_timer(0.1).timeout
	self.enabled = true

func disable():
	disconnect("select", Callable(self, "disable"))

func string():
	var _string = ""
	for child in children:
		var monster = "   * " + child.NAME + "\n"
		if child.spareable:
			monster = "[color=yellow]" + monster + "[/color]"
		_string += monster
	return _string

func get_selection(): # was "selection"
	return children[selection]

func _on_select(): # was "select". ether: idk what this does, and why nothing happens on select signal
	pass
