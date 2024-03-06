/// @description Player variables
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
hp_x = (window_get_width()/5)-(hp_width/2);
hp_y = (window_get_height()/5*4);

dash_speed = 8;		//dash stats
dash_duration = 15;
dash_cooldown = 60;
dash_timer = 0;
guard_stamina = 2; //how many attacks can the character guard against
stagger_timer = 0;
stagger_direction = 1;

is_dashing = false;		//character states
is_attacking = false;
is_guarding = false;
is_staggered = false;
attack_num = 0;

//Inputs
inputX = 0
inputUp = 0
inputDown = 0
inputDash = 0
inputAttack = 0
inputLightAttack = 0
inputGuard = 0
inputGuardRelease = 0

//attack hitboxes
hitbox1 = 0
hitbox2 = 0

//sprites
dashSprite = 0
attackSprite = 0
lightAttackSprite = 0
idleSprite = 0
jumpSprite = 0
runSprite = 0
guardSprite = 0
hitSprite = 0