/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_font(font);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(color);
draw_text_ext(x-342, y, "Player 1:\nWASD = Movement\nC = Light Attack\nV = Heavy Attack\nB = Guard\nN = Dash", 50, 500);
draw_text_ext(x+342, y, "Player 2:\nArrow Keys = Movement\n/ (Slash) = Light Attack\n. (Period) = Heavy Attack\n, (Comma) = Guard\nM = Dash", 50, 500);

draw_text(x - 15, y, "Esc/P = Pause")

// resets drawing position
draw_set_halign(fa_left);
draw_set_valign(fa_top);