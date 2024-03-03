// Regular movement logic
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

// jump
if (keyboard_check_pressed(vk_space) && (place_meeting(x, y + 1, obj_FinalDestination) || curr_jumps < 2)) {
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

if (keyboard_check_pressed(vk_down) && place_meeting(x + _finalMoveX, y + 1, obj_platform)) {
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

<<<<<<< Updated upstream
// Move
x += _finalMoveX;
y += _finalMoveY;

// Add Gravity
if (move_y <  10) {
	move_y += gravSpeed;
}

if (move_x != 0) {
	image_xscale = sign(move_x);
	sprite_index = Running;
=======
// Attack logic
// Check for attack button using the key code for "X" (ord('X') or 88)
if (keyboard_check(ord("X")) && !is_attacking) {
    // Set the attacking state
    is_attacking = true;
    sprite_index = Attack;
    var inst = instance_create_layer(x + (90* image_xscale), y + 60, "Instances", player1_hit_box);
>>>>>>> Stashed changes
} else {
	sprite_index = Idle;
    // If attacking, check if the attack animation is complete
    if (is_attacking) {
        if (image_index == image_number) {
            // Reset to the idle state after the attack animation is complete
            sprite_index = Idle;
            is_attacking = false;
            instance_destroy(player1_hit_box);
        } else {
            // If the attack animation is still playing, do not allow further input
            _finalMoveX = 0;
            _finalMoveY = 0;
        }
    } else {
        // If not attacking, perform movement and collision logic
        x += _finalMoveX;
        y += _finalMoveY;

        // Add Gravity
        if (move_y < 10) {
            move_y += gravSpeed;
        }

        if (move_x != 0) {
            image_xscale = sign(move_x);
            if(move_y < 0) {
                sprite_index = Jumping;
            } else {
                sprite_index = Running;
            }
        } else {
            sprite_index = Idle;
        }
    }
}
//move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);<<<<<<< Updated upstream
//move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);
=======
>>>>>>> Stashed changes
