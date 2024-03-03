move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_x *= move_speed;

// jump
if (keyboard_check_pressed(ord("W")) && (place_meeting(x, y + 1, obj_FinalDestination) || curr_jumps < 2)) {
	move_y = -jump_speed;
	curr_jumps += 1;
}

// final movement velocity
var _finalMoveX = move_x;
var _finalMoveY = move_y;

// moving platform collision
var _movingPlatform = instance_place(x, y + max(1, _finalMoveY), obj_platform);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	if (_finalMoveY > 0) {
		while (!place_meeting(x, y + sign(move_y), obj_platform)) {
			y += sign(_finalMoveY);
		}
		
		_finalMoveY = 0;
		move_y = 0;
		curr_jumps = 0;
	}
	
	_finalMoveX += _movingPlatform.moveX;
	_finalMoveY += _movingPlatform.moveY;
} 

if (keyboard_check_pressed(ord("S")) && place_meeting(x + _finalMoveX, y + 1, obj_platform)) {
	y += 2;
}

// Platform collisions
// x
if (place_meeting(x + _finalMoveX, y, obj_FinalDestination))
{
	while (!place_meeting(x + sign(_finalMoveX), y, obj_FinalDestination)) {
		x += sign(_finalMoveX);
	}
}

// y
if (place_meeting(x, y + _finalMoveY, obj_FinalDestination)) {
	while (!place_meeting(x, y + sign(_finalMoveY), obj_FinalDestination)) {
		y += sign(_finalMoveY);
	}
	
	_finalMoveY = 0;
	//reset gravity
	move_y = 0;
	curr_jumps = 0;
}

// Move
x += _finalMoveX;
y += _finalMoveY;

// Add Gravity
if (move_y <  10) {
	move_y += gravSpeed;
}


if (move_x != 0) {
	image_xscale = sign(move_x);
	if(move_y < 0) {
	sprite_index = Jumping2;
	} else {
		sprite_index = Running2;
	}
} else {
	sprite_index = Idle2;
}
if(move_y < 0) {
	sprite_index = Jumping2;
}

if keyboard_check(ord("Y"))
{
    sprite_index = Guard2;
	keyboard_clear(ord("W"));  // for now you can't move if you push direction
	keyboard_clear(ord("A"));  // button before you release the guard key
	keyboard_clear(ord("S"));
	keyboard_clear(ord("D"));
}
//move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);
//move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);