/// @description Player2 Controls
// You can write your code in this editor
inputX = keyboard_check(vk_right) - keyboard_check(vk_left)
inputUp = keyboard_check_pressed(vk_up)
inputDown = keyboard_check_pressed(vk_down)
inputDash = keyboard_check(ord("M"))
inputAttack = keyboard_check_pressed(190)
inputLightAttack = keyboard_check_pressed(191)
inputGuard = keyboard_check(188)
inputGuardRelease = keyboard_check_released(188)

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
