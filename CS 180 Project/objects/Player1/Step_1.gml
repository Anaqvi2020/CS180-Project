/// @description Player1 Controls
// You can write your code in this editor
inputX = keyboard_check(vk_right) - keyboard_check(vk_left)
inputUp = keyboard_check_pressed(vk_up)
inputDown = keyboard_check_pressed(vk_down)
inputDash = keyboard_check(191)
inputAttack = keyboard_check_pressed(188)
inputLightAttack = keyboard_check_pressed(ord("M"))
inputGuard = keyboard_check(190)
inputGuardRelease = keyboard_check_released(190)

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