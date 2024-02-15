move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

if (place_meeting(x, y+1, obj_FinalDestination)) {
	move_y = 0;
	if (keyboard_check(vk_space)) move_y = -jump_speed;
}
else if (move_y < 0) move_y += 1;
move_and_collide(move_x, move_y, obj_FinalDestination);

if (move_x != 0) {
	image_xscale = sign(move_x);
	sprite_index = PlayerRunning;
} else {
	sprite_index= Idle;
}
move_and_collide(move_x, move_y, obj_FinalDestination, 2, 0, 0, move_speed, -1);