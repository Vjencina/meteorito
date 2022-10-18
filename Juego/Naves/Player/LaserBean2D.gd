#LaserBeam2D.gd

class_name RayoLaser
extends RayCast2D

onready var laser_sfx: AudioStreamPlayer2D = $LaserSFX

func set_is_casting(cast: bool) -> void:
	is_casting = cast
	if is_casting:
		laser_sfx.play()
		cast_to = Vector2.ZERO
		fill.points[1] = cast_to
		appear()
	else:
		laser_sfx.stop()
		collision_particles.emitting = false
		disappear()

	set_physics_process(is_casting)
	beam_particles.emmitting = is_casting   
	casting_particles.emitting = is_casting
