extends Node

var current_action := ""
var waiting_for_key := false

func _ready() -> void:
	start_rebind("jump")

func start_rebind(action_name: String) -> void:
	current_action = action_name
	waiting_for_key = true
	print("Press a key to bind to action: ", action_name)

func _input(event):
	if waiting_for_key and event is InputEventKey and event.pressed and not event.echo:
		# Remove all old events for this action
		for ev in InputMap.action_get_events(current_action):
			InputMap.action_erase_event(current_action, ev)

		# Add the newly pressed key
		InputMap.action_add_event(current_action, event)
		print("Rebound ", current_action, " to key: ", event.keycode)

		waiting_for_key = false
