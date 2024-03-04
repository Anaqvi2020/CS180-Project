/// @description Insert description here
// You can write your code in this editor

instance_destroy(other);

if (hp - other.damage < 0) {
	hp = 0;
}
else {
	hp -= other.damage;
}

stagger_timer = other.damage*2.5;
is_staggered = true;
stagger_direction = sign(x-Player1.x);