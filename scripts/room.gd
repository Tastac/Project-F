extends RigidBody2D

var size

func make_room(_pos, _size):
	rotate(0)
	position = _pos
	size = _size
	var s = RectangleShape2D.new()
	s.extents = size
	$CollisionShape2D.shape = s
