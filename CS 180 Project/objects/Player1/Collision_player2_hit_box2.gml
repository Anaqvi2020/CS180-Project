/// @description Insert description here
// You can write your code in this editor

instance_destroy(other);

var finalDamage;

if (is_guarding) {finalDamage = other.damage / 3;}
else {finalDamage = other.damage;}

if (hp - finalDamage < 0) {
	hp = 0;
}
else {
	hp -= finalDamage;
}

stagger_timer = finalDamage*2.5;
is_staggered = true;
stagger_direction = sign(x-Player2.x);