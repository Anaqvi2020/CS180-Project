move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

if (place_meeting(x, y+2, obj_FinalDestination))
{
	curr_jumps = 0;
	move_y = 0;
	if (keyboard_check_pressed(vk_space) && curr_jumps < 2) {
		move_y = -jump_speed;
		curr_jumps += 1;
	}
}
else if (keyboard_check_pressed(vk_space) && curr_jumps < 2) {
	move_y = -jump_speed;
	curr_jumps += 1;
}
else if (move_y < 10) move_y += 1;

move_and_collide(move_x, move_y, obj_FinalDestination);

if (move_x != 0) {
	image_xscale = sign(move_x);
	sprite_index = Running;
} else {
	sprite_index = Idle;
}
move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);