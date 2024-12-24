extends CharacterBody3D

@onready var head: Node3D = $Head

var current_speed = 5

@export var walking_speed = 8.0
@export var running_speed = 20.0
@export var crouching_speed = 3.0

const jump_velocity = 4.5

const mouse_sens = 0.2

func _ready():
	$Label.hide()
	$Label.text = "goed gedaan we hebben die lelijke engelse alemaal vermoord ik zie een toekomst in jou je mag als Planetenverteidigungskanonenkommandant gaan werken veel succes! ga nu snel naar het vliegtuig"
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.relative.x * mouse_sens * -1))
		head.rotate_x(deg_to_rad(event.relative.y * mouse_sens * -1))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89),deg_to_rad(89))

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("sprint"):
		current_speed = running_speed
	else:
		current_speed = walking_speed
	if Input.is_action_pressed("crouch"):
		current_speed = crouching_speed
	else:
		current_speed = walking_speed
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()


func _on_area_3d_area_entered(area: Area3D) -> void:
	print("enter")
	$Label.show() 
