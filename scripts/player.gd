extends XROrigin3D

@onready
var left_hand: XRToolsHand = $LeftHand/LeftHand
@onready
var right_hand: XRToolsHand = $RightHand/RightHand

@export
var cube: StaticBody

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var left_grip : float = left_hand._controller.get_float(left_hand.grip_action)
	var left_trigger : float = left_hand._controller.get_float(left_hand.trigger_action)
	
	var right_grip : float = right_hand._controller.get_float(right_hand.grip_action)
	var right_trigger : float = right_hand._controller.get_float(right_hand.trigger_action)
	
	print("=== LEFT HAND ===")
	print("GRIP: ", left_grip)
	print("TRIGGER: ", left_trigger)
	
	print("=== RIGHT HAND ===")
	print("GRIP: ", right_grip)
	print("TRIGGER: ", right_trigger)
	
	if left_trigger >= right_trigger:
		cube.apply_shader(Color(left_trigger, left_trigger, left_trigger))
	else:
		cube.apply_shader(Color(right_trigger, right_trigger, right_trigger))
