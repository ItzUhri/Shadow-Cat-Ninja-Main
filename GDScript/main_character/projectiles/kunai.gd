extends Area2D

@export var speed: float = 500.0
var direction := Vector2.RIGHT

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))  # Ensure collision detection is active

func _process(delta):
	position += direction * speed * delta

func launch(dir: Vector2):
	direction = dir
	rotation = direction.angle()

func _on_body_entered(body):
	queue_free()  # Destroy kunai on collision
