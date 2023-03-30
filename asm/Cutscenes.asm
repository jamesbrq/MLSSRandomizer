C_OPTION equ 0x08DF0000
MARIO_VALUE equ 0x02006C14
LUIGI_VALUE equ 0x02006FB0
CUTSCENE_RAM equ 0x02003034
TIME equ 0x03002548
TIME_RAM equ 0x02003038
CAMERA_X equ 0x03002486
CAMERA_Y equ 0x03002488
CAMERA_RESET equ 0x03002305
TALKING equ 0x02004F74
CUTSCENE_ACTIVE_ONE equ 0x02004AC4
CUTSCENE_ACTIVE_TWO equ 0x02004B6C
BRO_ITEM equ 0x020048FB
SOLO_VALUE equ 0x03002414
FRONT_BRO equ 0x02004F4C
CUTSCENE_FIX equ 0x08E10000
SHADOWREALM equ 0x08E10100
BRO_HANDLER equ 0x08E10200
BRO_RESTORE equ 0x08E10300
RESET_BATTLE equ 0x08E10400
CHUCKOLATOR equ 0x08E10600
TEMP_ACTIVE equ 0x08E10500
DOOR_FIX_HOOK equ 0x08024108
DOOR_FIX_SUBR equ 0x081E0300
BIKE_FIX_HOOK equ 0x080469F2
BIKE_FIX_SUBR equ 0x081E00A0
BIKE_FIX_HOOK2 equ 0x08046A70
BIKE_FIX_SUBR2 equ 0x081E0640
TEMP_INACTIVE equ 0x08E10700
BOSS_FIX_HOOK equ 0x08080976
BOSS_FIX_SUBR equ 0x081E0550
FIX_CAMERA equ 0x08E10800
JUMP_HOOK equ 0x080268CC
JUMP_SUBR equ 0x081E04E0
MARIO_TEXT equ 0x08200408
LUIGI_TEXT equ 0x08200410
MARIO_EVENT_TEXT equ 0x08E00860
LUIGI_EVENT_TEXT equ 0x08E00890
MARIO_SHOP equ 0x08E008C0
LUIGI_SHOP equ 0x08E008C4
MARIO_SHOP2 equ 0x08E008C8
LUIGI_SHOP2 equ 0x08E008D0
WATER equ 0x03002452


.org MARIO_EVENT_TEXT
	db 0x16, 0x2, 0xFF, 0xB, 0x1, "You got Mario!", 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MARIO_EVENT_TEXT
	db 0x16, 0x2, 0xFF, 0xB, 0x1, "You got Luigi!", 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MARIO_SHOP
	dw MARIO_SHOP2

.org LUIGI_SHOP
	dw LUIGI_SHOP2

.org MARIO_SHOP2
	dw MARIO_TEXT
	dw MARIO_TEXT

.org LUIGI_SHOP2
	dw LUIGI_TEXT
	dw LUIGI_TEXT


.org JUMP_HOOK
	bl JUMP_SUBR



.org JUMP_SUBR
push lr
ldr r0, =0x080268FC
ldr r3, [r0]
ldr r0, =0x020048FB
ldrb r0, [r0]
cmp r0, #0x0
bne .jump_norm
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x0
beq .jump_norm
cmp r0, #0x1
beq .jump_luigi
ldr r0, =0x02006C08
cmp r0, r4
beq .jump_norm
mov r0, #0x40
bl .jump_end
.jump_luigi:
ldr r0, =0x02006FA4
cmp r0, r4
beq .jump_norm
mov r0, #0x40
bl .jump_end
.jump_norm:
mov r0, #0x75
.jump_end:
pop pc
.pool






.org FIX_CAMERA
push { r0-r3, lr }
ldr r0, =FRONT_BRO
ldrb r0, [r0]
ldr r1, =0x39C
mul r1, r0
ldr r0, =MARIO_VALUE
ldr r2, [r0, r1]
lsr r2, #0x8
sub r2, #0x70
ldr r3, =CAMERA_X
strh r2, [r3]
add r1, #0x4
ldr r3, [r0, r1]
add r1, #0x4
ldr r2, [r0, r1]
lsr r2, #0x8
sub r3, r2
sub r3, #0x70
ldr r2, =CAMERA_Y
strh r3, [r2]
ldr r0, =CAMERA_RESET
mov r1, #0x0
strb r1, [r0]
pop { r0-r3, pc }
.pool





.org BOSS_FIX_HOOK
	bl BOSS_FIX_SUBR






.org BOSS_FIX_SUBR
push r1, lr
add r0, r1
ldrb r4, [r0]
ldr r1, =BRO_ITEM
ldrb r1, [r1]
cmp r1, #0x0
bne .boss_end
ldr r1, =C_OPTION
ldrb r1, [r1]
cmp r1, #0x0
beq .boss_end
cmp r1, #0x1
beq .boss_luigi
cmp r4, #0x3
beq .boss_end
mov r4, #0x3
bl .boss_end
.boss_luigi:
cmp r4, #0x2
beq .boss_end
mov r4, #0x2
.boss_end:
pop r1, pc
.pool






.org CUTSCENE_FIX
push { r0-r3, lr }
ldr r0, =BRO_ITEM
ldrb r0, [r0]
cmp r0, #0x0
bne .cutscene_end
ldr r0, =CUTSCENE_RAM
ldrb r0, [r0]
cmp r0, #0x0
bne .cutscene_end
ldr r0, =0x02004AE0
ldr r0, [r0]
ldr r1, =0x082468AD
cmp r0, r1
beq .cutscene_end
ldr r1, =0x08243444
cmp r0, r1
beq .talk_skip
ldr r1, =0x0825AC17
cmp r0, r1
beq .talk_skip
ldr r0, =TIME_RAM
ldr r0, [r0]
ldr r1, =TIME
ldr r1, [r1]
add r0, #0x20
cmp r1, r0
blt .cutscene_end
ldr r0, =CUTSCENE_ACTIVE_ONE
ldrb r0, [r0]
cmp r0, #0x0
bgt .active
ldr r0, =CUTSCENE_ACTIVE_TWO
ldrb r0, [r0]
cmp r0, #0x0
beq .cutscene_end
.active:
cmp r0, #0x1
bgt .talk_skip
ldr r0, =TALKING
ldrb r0, [r0]
cmp r0, #0x0
bne .cutscene_end
.talk_skip:
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x0
beq .cutscene_end
cmp r0, #0x1
beq .luigi_values
ldr r1, =MARIO_VALUE
ldr r2, =LUIGI_VALUE
bl .do_fix
.luigi_values:
ldr r1, =LUIGI_VALUE
ldr r2, =MARIO_VALUE
.do_fix:
ldr r3, [r2]
str r3, [r1]
ldr r3, [r2, #0x4]
str r3, [r1, #0x4]
ldr r3, [r2, #0x8]
str r3, [r1, #0x8]
ldr r3, [r2, #0xC]
str r3, [r1, #0xC]
ldr r2, =0x200
ldrb r3, [r1, r2]
mov r0, #0x1
orr r3, r0
strb r3, [r1, r2]
add r2, #0x3
ldrb r3, [r1, r2]
mov r0, #0x2
orr r3, r0
strb r3, [r1, r2]
ldr r0, =SOLO_VALUE
mov r1, #0x40
ldrb r2, [r0]
orr r2, r1
strb r2, [r0]
ldr r0, =CUTSCENE_RAM
mov r1, #0x1
strb r1, [r0]
.cutscene_end:
pop { r0-r3, pc }
.pool




.org TEMP_ACTIVE
push { r0-r3, lr }
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x1
beq .luigi_temp
ldr r0, =MARIO_VALUE
bl .do_temp
.luigi_temp:
ldr r0, =LUIGI_VALUE
.do_temp:
ldr r1, =0x200
ldrb r2, [r0, r1]
mov r3, #0x1
orr r2, r3
strb r2, [r0, r1]
add r1, #0x3
ldrb r2, [r0, r1]
mov r3, #0x2
orr r2, r3
strb r2, [r0, r1]
pop { r0-r3, pc }
.pool





.org TEMP_INACTIVE
push { r0-r3, lr }
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x1
beq .luigi_temp2
ldr r0, =MARIO_VALUE
bl .do_temp2
.luigi_temp2:
ldr r0, =LUIGI_VALUE
.do_temp2:
ldr r1, =0x200
ldrb r2, [r0, r1]
mov r3, #0x1
bic r2, r3
strb r2, [r0, r1]
add r1, #0x3
ldrb r2, [r0, r1]
mov r3, #0xF
bic r2, r3
strb r2, [r0, r2]
pop { r0-r3, pc }
.pool


.org 0x08DF0000
	; db 0x1




.org RESET_BATTLE
push r0-r2, lr
ldr r0, =SOLO_VALUE
ldrb r1, [r0]
mov r2, #0xE0
bic r1, r2
strb r1, [r0]
pop r0-r2, pc
.pool




.org SHADOWREALM
push { r0-r2, lr }
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x0
beq .realm_end
ldr r0, =BRO_ITEM
ldrb r0, [r0]
cmp r0, #0x0
bne .realm_end
ldr r0, =CUTSCENE_RAM
ldrb r0, [r0]
cmp r0, #0x1
bne .realm_end
;bl RESET_BATTLE
ldr r0, =CUTSCENE_ACTIVE_ONE
ldrb r0, [r0]
cmp r0, #0x0
bne .realm_end
ldr r0, =CUTSCENE_ACTIVE_TWO
ldrb r0, [r0]
cmp r0, #0x0
bne .realm_end
ldr r0, =TIME_RAM
ldr r1, [r0]
cmp r1, #0x0
bne .check_time
ldr r1, =TIME
ldr r1, [r1]
str r1, [r0]
bl .realm_end
.check_time:
ldr r1, =TIME
ldr r1, [r1]
ldr r0, [r0]
add r0, #0x1
cmp r0, r1
bgt .realm_end
mov r0, #0x0
ldr r1, =TIME_RAM
str r0, [r1]
ldr r0, =ROOM
ldrh r0, [r0]
cmp r0, #0x66
beq .intro
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x1
beq .shadow_luigi
ldr r0, =MARIO_VALUE
bl .shadowrealm
.shadow_luigi:
ldr r0, =LUIGI_VALUE
.shadowrealm:
ldr r1, =0xFFFFF
str r1, [r0]
ldr r1, =0xFFFFF
str r1, [r0, 0x4]
ldr r1, =0xFFFFF
str r1, [r0, 0x8]
ldr r0, =CUTSCENE_RAM
mov r1, #0x0
strb r1, [r0]
ldr r0, =SOLO_VALUE
mov r1, #0x50
ldrb r2, [r0]
bic r2, r1
strb r2, [r0]
bl .realm_end
.intro:
ldr r0, =CUTSCENE_RAM
mov r1, #0x0
strb r1, [r0]
.realm_end:
pop { r0-r2, pc }
.pool

.org CHUCKOLATOR
push r0-r1, lr
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x0
beq .chuck_norm
ldr r1, =0x02004A24
ldr r1, [r1]
ldr r0, =0x0824E9A1
cmp r0, r1
bne .chuck_norm
ldr r1, =0x0824EBD2
ldr r0, =0x02004A24
str r1, [r0]
.chuck_norm:
pop r0-r1, pc
.pool






.org BRO_HANDLER
push { r0-r2, lr }
ldr r0, =CUTSCENE_RAM
ldrb r0, [r0]
cmp r0, #0x1
beq .handler_end
ldr r0, =ROOM
ldrb r0, [r0, #0x1]
cmp r0, #0x1
bgt .handler_end
ldr r0, =BRO_ITEM
ldrb r0, [r0]
cmp r0, #0x0
bne .handler_end
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x0
beq .handler_end
mov r2, #0x4
cmp r0, #0x2
beq .luigi_handler
ldr r0, =FRONT_BRO
mov r1, #0x0
strb r1, [r0]
ldr r0, =SOLO_VALUE
ldrb r1, [r0]
bic r1, r2
strb r1, [r0]
bl .handler_cont
.luigi_handler:
ldr r1, =FRONT_BRO
mov r0, #0x1
strb r0, [r1]
ldr r0, =SOLO_VALUE
ldrb r1, [r0]
orr r1, r2
strb r1, [r0]
.handler_cont:
mov r2, #0xF1
ldr r0, =SOLO_VALUE
ldrb r1, [r0]
bic r1, r2
strb r1, [r0]
ldr r0, =0x03002418
ldrb r1, [r0]
cmp r1, #0x5
bne .handler_end
mov r1, #0x0
strb r1, [r0]
.handler_end:
pop { r0-r2, pc }
.pool





.org DOOR_FIX_HOOK
	 bl DOOR_FIX_SUBR

.org DOOR_FIX_SUBR
push r2-r3, lr
ldr r2, =C_OPTION
ldrb r2, [r2]
cmp r2, #0x0
beq .door_norm
ldr r2, =BRO_ITEM
ldrb r2, [r2]
cmp r2, #0x0
bne .door_norm
ldr r2, =0x082574AA
ldr r3, =0x02004A24
ldr r3, [r3]
cmp r3, r2
beq .door_skip
ldr r2, =CUTSCENE_ACTIVE_TWO
ldrb r2, [r2]
cmp r2, #0x5
beq .door_skip
ldr r2, =CUTSCENE_RAM
ldrb r2, [r2]
cmp r2, #0x1
beq .door_norm
ldr r2, =0x03002414
cmp r2, r1
bne .door_norm
cmp r4, #0x10
beq .door_skip
.door_norm:
orr r0, r4
.door_skip:
strb r0, [r1]
pop r2-r3, pc
.pool






.org BRO_RESTORE
push { r0-r3, lr }
bl TEMP_ACTIVE
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x1
beq .luigi_restore
ldr r0, =LUIGI_VALUE
ldr r1, =MARIO_VALUE
bl .restore_position
.luigi_restore:
ldr r0, =MARIO_VALUE
ldr r1, =LUIGI_VALUE
.restore_position:
ldr r3, [r0]
str r3, [r1]
ldr r3, [r0, #0x4]
str r3, [r1, #0x4]
ldr r3, [r0, #0x8]
str r3, [r1, #0x8]
ldr r3, [r0, #0xC]
str r3, [r1, #0xC]
ldr r0, =SOLO_VALUE
mov r2, #0x11
ldrb r1, [r0]
orr r1, r2
strb r1, [r0]
pop { r0-r3, pc }
.pool