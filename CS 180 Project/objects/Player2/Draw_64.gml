/// @description Health Bar
// You can write your code in this editor


draw_sprite(HealthBackground,0,hp_x+915, hp_y);
draw_sprite_stretched(HealthBar,0, hp_x+915,hp_y, (hp/hp_max)*hp_width,hp_height);
draw_sprite(HealthBorder,0,hp_x+915, hp_y);
draw_sprite(Portrait2, 0, hp_x+915, hp_y-130);