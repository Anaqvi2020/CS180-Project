/// @description Player1 Controls
// You can write your code in this editor
inputX = keyboard_check(ord("D")) - keyboard_check(ord("A"))
inputUp = keyboard_check_pressed(ord("W"))
inputDown = keyboard_check_pressed(ord("S"))
inputDash = keyboard_check(ord("N"))
inputAttack = keyboard_check_pressed(ord("V"))
inputLightAttack = keyboard_check_pressed(ord("C"))
inputGuard = keyboard_check(ord("B"))
inputGuardRelease = keyboard_check_released(ord("B"))

//attack hitboxes
hitbox1 = player1_hit_box1
hitbox2 = player1_hit_box2

//sprites
dashSprite = Dash
attackSprite = Attack
lightAttackSprite = light_attack
idleSprite = Idle
jumpSprite = Jumping
runSprite = Running
guardSprite = Guard
hitSprite = hit