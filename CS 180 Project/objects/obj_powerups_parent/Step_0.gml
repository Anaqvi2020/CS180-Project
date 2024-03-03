/// @description Insert description here
// You can write your code in this editor

y += fall_speed;

depth = -1000;

//show_debug_message(place_meeting(x, y + 10, obj_platform));
if (place_meeting(x, y + 10, obj_platform)) {
	var targetSpeed = 0;
	if (x < 700) {
		var targetObj = instance_find(obj_platform, 0);
		targetSpeed = targetObj.moveX;
	}
	else {
		var targetObj = instance_find(obj_platform, 1);
		targetSpeed = targetObj.moveX;
	}
    x += targetSpeed;
}

if (y > 800) {
	instance_destroy();
}