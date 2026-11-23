extends StaticBody3D
class_name StaticBody

@onready
var mesh_instance: MeshInstance3D = $MeshInstance3D

func apply_shader(color: Color) -> void:
	var material = mesh_instance.get_surface_override_material(0) as StandardMaterial3D
	if material:
		material.emission = color
