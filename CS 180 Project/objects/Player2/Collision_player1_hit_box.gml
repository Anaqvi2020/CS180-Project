/// @description Insert description here
// You can write your code in this editor

if (hp - other.damage < 0) {
	hp = 0;
}
else {
	hp -= other.damage;
}

instance_destroy(other);