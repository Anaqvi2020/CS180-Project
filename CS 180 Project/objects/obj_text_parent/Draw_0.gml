draw_self();

draw_set_font(font);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(color);
draw_text_ext(x, y, text, -625, 1250);

// resets drawing position
draw_set_halign(fa_left);
draw_set_valign(fa_top);