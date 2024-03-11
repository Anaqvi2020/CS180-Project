/// @description Player Logic

// Regular movement logic
move_x = inputX;
move_x *= move_speed;

// jump
if (inputUp && (place_meeting(x, y + 1, obj_FinalDestination) || curr_jumps < 2)) {
    move_y = -jump_speed;
    curr_jumps += 1;
}

// final movement velocity
var _finalMoveX = move_x;
var _finalMoveY = move_y;

if (place_meeting(x + _finalMoveX, y, Player_parent)) {
    // Adjust for horizontal collision with another player
    _finalMoveX = 0; // Stop horizontal movement
}

if (place_meeting(x, y + _finalMoveY, Player_parent)) {
    var otherPlayer = instance_place(x, y + _finalMoveY, Player_parent);
    // Determine if the collision is from the top (jumping onto the player)
    if (_finalMoveY > 0 && y < otherPlayer.y) {
        var slideDirection = sign(move_x);
        if (slideDirection == 0) { // Determine slide direction based on relative positions
            slideDirection = (x < otherPlayer.x) ? -1 : 1;
        }

        // Attempt to slide off, check for free space in slide direction
        if (!place_meeting(x + slideDirection * move_speed, y, Player_parent)) {
            _finalMoveX += slideDirection * move_speed; // Apply slide off effect
        } else {
            _finalMoveX = 0; // If blocked, prevent movement to avoid getting stuck
        }
        
        // Adjust vertical movement to prevent embedding into the collision box
        if (place_meeting(x + _finalMoveX, y + 1, Player_parent)) {
            _finalMoveX = slideDirection * 2; // Slight horizontal adjustment to prevent getting stuck during slide down
        } else {
            _finalMoveY = 0; // Stop downward movement
        }
        
        curr_jumps = 0; // Reset jump count to allow re-jumping
    } else {
        _finalMoveY = 0; // For other types of collisions, stop vertical movement
    }
}

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

if (inputDown && place_meeting(x + _finalMoveX, y + 1, obj_platform)) {
    y += 2;
}

// Platform collisions
// x
if (place_meeting(x + _finalMoveX, y, obj_FinalDestination))
{
    while (!place_meeting(x + sign(_finalMoveX), y, obj_FinalDestination)) {
        x += sign(_finalMoveX);
    }
	_finalMoveX = 0;
}

// y
if (place_meeting(x, y + _finalMoveY, obj_FinalDestination)) {
    while (!place_meeting(x, y + sign(_finalMoveY), obj_FinalDestination)) {
        y += sign(_finalMoveY);
    }
    
    _finalMoveY = 0;
    //reset gravity
    move_y = 0;
	if (y < obj_FinalDestination.y) {
		curr_jumps = 0;
	}
}

if (inputDash && dash_timer <= 0 && !is_attacking) {
    is_dashing = true;
	sprite_index = dashSprite;
    dash_timer = dash_duration + dash_cooldown; // Reset the dash timer
}

if (dash_timer > 0) {
    dash_timer--;
}


if (is_dashing) {
    // Use the player's facing direction or last movement direction for the dash
    var dash_direction = image_xscale; // Assuming move_x indicates direction; adjust as necessary
    if (dash_direction == 0) dash_direction = 1; // Default to right if no movement
    
	if (place_meeting(x + dash_direction * dash_speed, y - 1, obj_FinalDestination)) {
		while (!place_meeting(x + sign(dash_direction * dash_speed), y, obj_FinalDestination)) {
			x += sign(dash_direction * dash_speed);
		}
		_finalMoveX = 0;
	} else {
		_finalMoveX += dash_direction * dash_speed; // Apply dash speed to the movement
	}
	
    // End the dash if the duration has elapsed
    if (dash_timer <= dash_cooldown) {
        is_dashing = false;
    }
}

// Attack logic
// Check for attack button using the key code for "X" (ord('X') or 88)
if ((inputAttack || inputLightAttack) && !is_attacking) {
    // Set the attacking state
    is_attacking = true;
	var attack_hitbox_offset = 90 * image_xscale;
    if (inputAttack) {
        sprite_index = attackSprite;
		attack_num = 1;
		var inst = instance_create_layer(x + attack_hitbox_offset, y + 60, "Instances", hitbox1);
		inst.damage = attack_damage + 5;
    } else if (inputLightAttack) {
        sprite_index = lightAttackSprite;
		attack_num = 2;
		var inst = instance_create_layer(x + attack_hitbox_offset, y + 60, "Instances", hitbox2);
		inst.damage = attack_damage;
    }
    image_index = 0;
    // Set the hitbox offset based on the direction
} else {
    // If attacking, check if the attack animation is complete
    if (is_attacking) {
        if (image_index == image_number || is_staggered) {
            // Reset to the idle state after the attack animation is complete
			// ... or got interrupted by another attack
            if (image_index == image_number) sprite_index = idleSprite;
            is_attacking = false;
            if (attack_num = 1){instance_destroy(hitbox1);}
			else if (attack_num = 2){instance_destroy(hitbox2);}
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
				if(is_dashing != true) {
					sprite_index = jumpSprite;
				}
		    } else {
				if(is_dashing != true) {
					sprite_index = runSprite
				}
		    }
		 } else {
			if( is_dashing != true) {
				sprite_index = idleSprite;
		  }
		}
    }
}

// Guard logic
if (inputGuard && !is_attacking && !is_staggered)
{
    sprite_index = guardSprite;
    is_guarding = true;
	move_speed = 0;
	jump_speed = 0;
}
if (inputGuardRelease && !is_attacking)
{
	move_speed = 3;
	jump_speed = 10;
	is_guarding = false;
	if(stagger_timer == 0){sprite_index = idleSprite;}
}

// Stagger logic
if (stagger_timer > 0) {
    stagger_timer--;
}
if (is_staggered) {
	if(!is_guarding) {sprite_index = hitSprite;}
	else if (is_guarding) {sprite_index = guardSprite;}
	image_xscale = (-stagger_direction);
    if (stagger_direction == 0) {stagger_direction = 1;} // Default to right if no movement

    x += stagger_direction * (dash_speed/2);

    // End the stagger if the duration has elapsed
    if (stagger_timer <= 0) {
        is_staggered = false;
		if(!is_guarding) {sprite_index = idleSprite;}
    }
}

if (hp == 0 || y > 800) {
	lives_left -= 1;
	hp = -1;
	y = -10000
	
	if (lives_left > 0) {
		alarm[4] = room_speed * 2;
	}
	else {
		if (object_index == Player1) {
			room_goto(P2Win);
		} else {
			room_goto(P1Win);
		}
	}
}

//show_debug_message(lives_left);

//move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);
//move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);