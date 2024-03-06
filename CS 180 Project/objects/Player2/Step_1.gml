/// @description Insert description here
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
hitbox1 = player2_hit_box1
hitbox2 = player2_hit_box2

//sprites
dashSprite = Dash2
attackSprite = Attack2
lightAttackSprite = light_attack2
idleSprite = Idle2
jumpSprite = Jumping2
runSprite = Running2
guardSprite = Guard2
hitSprite = hit2
