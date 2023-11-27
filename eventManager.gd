class_name EventManager

func manage_event(_node: Node = null, event: InputEvent = null, input_support = []):
	# Looks for a manager that can process the event.
	for supported in input_support:
		if event.get_class() in supported.event_class_support:
			supported.process_input_event(_node, event)
			return
