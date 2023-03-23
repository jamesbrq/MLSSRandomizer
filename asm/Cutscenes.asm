C_OPTION equ 0x08DF0000
MARIO_VALUE equ 0x02006C14
LUIGI_VALUE equ 0x02006FB0
CUTSCENE_RAM equ 0x02003034
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
TEMP_INACTIVE equ 0x08E10700
JUMP_HOOK equ 0x080268CC
JUMP_SUBR equ 0x081E04E0
MARIO_TEXT equ 0x08200407
LUIGI_TEXT equ 0x0820040F
MARIO_EVENT_TEXT equ 0x08E00860
LUIGI_EVENT_TEXT equ 0x08E00890
MARIO_SHOP equ 0x08E008C0
LUIGI_SHOP equ 0x08E008C4
MARIO_SHOP2 equ 0x08E008C8
LUIGI_SHOP2 equ 0x08E008D0


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
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x0
beq .jump_norm
ldr r0, =0x020048FB
ldrb r0, [r0]
cmp r0, #0x0
bne .jump_norm
mov r0, #0x40
bl .jump_end
.jump_norm:
mov r0, #0x75
.jump_end:
pop pc
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
ldr r0, =ROOM
ldrb r1, [r0]
ldrb r2, [r0, #0x2]
cmp r1, r2
bne .cutscene_end
ldr r0, =CUTSCENE_ACTIVE_ONE
ldrb r0, [r0]
cmp r0, #0x0
bne .active
ldr r0, =CUTSCENE_ACTIVE_TWO
ldrb r0, [r0]
cmp r0, #0x0
beq .cutscene_end
.active:
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
mov r1, #0x1
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
strb r2, [r0, r2]
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
push { r0-r1, lr }
ldr r0, =ROOM
ldrh r0, [r0]
cmp r0, #0x66
beq .realm_end
ldr r0, =BRO_ITEM
ldrb r0, [r0]
cmp r0, #0x1
beq .realm_end
ldr r0, =CUTSCENE_RAM
ldrb r0, [r0]
cmp r0, #0x1
bne .realm_end
bl RESET_BATTLE
ldr r0, =CUTSCENE_ACTIVE_ONE
ldrb r0, [r0]
cmp r0, #0x0
bne .realm_end
ldr r0, =CUTSCENE_ACTIVE_TWO
ldrb r0, [r0]
cmp r0, #0x0
bne .realm_end
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x1
beq .shadow_luigi
ldr r0, =MARIO_VALUE
bl .shadowrealm
.shadow_luigi:
ldr r0, =LUIGI_VALUE
.shadowrealm:
ldr r1, =0xFFFFFFFF
str r1, [r0]
ldr r1, =0xFFFFFFFF
str r1, [r0, 0x4]
ldr r1, =0xFFFFFFFF
str r1, [r0, 0x8]
ldr r1, =0xFFFFFFFF
str r1, [r0, 0xC]
ldr r0, =CUTSCENE_RAM
mov r1, #0x0
strb r1, [r0]
ldr r0, =SOLO_VALUE
mov r1, #0x10
ldrb r2, [r0]
bic r2, r1
strb r2, [r0]
.realm_end:
pop { r0-r1, pc }
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
ldr r0, =ROOM
ldrb r0, [r0, #0x1]
cmp r0, #0x1
bgt .handler_end
ldr r0, =ROOM
ldrh r0, [r0]
mov r1, #0x66
cmp r0, r1
beq .handler_end
ldr r0, =CUTSCENE_RAM
ldrb r0, [r0]
cmp r0, #0x1
beq .handler_end
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
.handler_end:
pop { r0-r2, pc }
.pool





.org DOOR_FIX_HOOK
	 bl DOOR_FIX_SUBR

.org DOOR_FIX_SUBR
push r2, lr
ldr r2, =C_OPTION
ldrb r2, [r2]
cmp r2, #0x0
beq .door_norm
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
pop r2, pc
.pool






.org BRO_RESTORE
push { r0-r3, lr }
ldr r0, =SOLO_VALUE
mov r2, #0x11
ldrb r1, [r0]
orr r1, r2
strb r1, [r0]
ldr r0, =C_OPTION
ldrb r0, [r0]
cmp r0, #0x1
beq .luigi_restore
ldr r0, =LUIGI_VALUE
ldr r1, =MARIO_VALUE
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
pop { r0-r3, pc }
.pool