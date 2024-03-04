move_speed = 3;
jump_speed = 10;

move_x = 0;
move_y = 0;

curr_jumps = 0;
gravSpeed = 0.5;

attack_damage = 10;

lives_left = 3;
hp = 100;
hp_max = 100;

hp_width = 100; //position and dimension of HP Bar
hp_height = 11;
hp_x = (window_get_width())-(3 * hp_width);
hp_y = (window_get_height()/5*4);

dash_speed = 8;		//dash stats
dash_duration = 15;
dash_cooldown = 60;
dash_timer = 0;
guard_stamina = 2; //how many attacks can the character guard against

is_dashing = false;		//character states
is_attacking = false;
is_guarding = false;
attack_num = 0;