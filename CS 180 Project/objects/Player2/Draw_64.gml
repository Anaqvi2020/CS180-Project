/// @description Health Bar
// You can write your code in this editor


draw_sprite(HealthBackground,0,hp_x+915, hp_y);
draw_sprite_stretched(HealthBar,0, hp_x+915,hp_y, (hp/hp_max)*hp_width,hp_height);
draw_sprite(HealthBorder,0,hp_x+915, hp_y);
draw_sprite(Portrait2, 0, hp_x+915, hp_y-130);
draw_set_font(fnt_menu)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_text(hp_x+965, hp_y+25, "Lives: " + string(Player2.lives_left))
draw_set_halign(fa_left)