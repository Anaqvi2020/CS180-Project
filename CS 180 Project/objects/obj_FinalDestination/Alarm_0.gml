/// @description Insert description here
// You can write your code in this editor

var pick = irandom_range(1, 4);
//show_debug_message(pick);
if (pick == 1) {
	instance_create_layer(random_range(275, 1100), -50, "Instances", obj_speed_up);	
}
else if (pick == 2) {
	instance_create_layer(random_range(275, 1100), -50, "Instances", obj_jump_boost);	
}
else if (pick == 3) {
	instance_create_layer(random_range(275, 1100), -50, "Instances", obj_attack_up);	
}
else {
	instance_create_layer(random_range(275, 1100), -50, "Instances", obj_health_up);
}

alarm[0] = room_speed * random_range(8, 15);