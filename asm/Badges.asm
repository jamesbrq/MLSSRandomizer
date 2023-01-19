BADGE equ 0x02004912
PANTS equ 0x0200494A
SPECIAL equ 0x02004982
BADGE_FLAGS equ 0x02004992
PANTS_FLAGS equ 0x020049CA
SPECIAL_FLAGS equ 0x02004A02
BADGE_ADD equ 0x081DFA10
PANTS_ADD equ 0x081E0450
SPECIAL_ADD equ 0x081DFA60
BADGE_SHOP_HOOK equ 0x0812AE7C
BADGE_SHOP_SUBR equ 0x081E0490
BADGE_SHOP_INJECT_HOOK equ 0x0812AE90
BADGE_SHOP_INJECT_SUBR equ 0x081E04C0
PANTS_SHOP_INJECT_HOOK equ 0x0812AEF2
PANTS_SHOP_INJECT_SUBR equ 0x081E04E0
BADGE_SHOP_TEXT_RAM_HOOK equ 0x0812E57E
BADGE_SHOP_TEXT_RAM_SUBR equ 0x081DFF20
BADGE_SHOP_TEXT_HOOK equ 0x0812E59C
BADGE_SHOP_TEXT_SUBR equ 0x081DFF30
BADGE_SHOP_DESC_HOOK equ 0x0812E2AC
BADGE_SHOP_DESC_SUBR equ 0x081DFFD0
PANTS_SHOP_DESC_HOOK equ 0x0812E2E2
PANTS_SHOP_DESC_SUBR equ 0x081E0070
BADGE_SHOP_DESC_RAM_HOOK equ 0x0812E296
BADGE_SHOP_DESC_RAM_SUBR equ 0x081E01F0
PANTS_SHOP_DESC_RAM_HOOK equ 0x0812E2D0
PANTS_SHOP_DESC_RAM_SUBR equ 0x081DFAC0
BADGE_BUY_FIX equ 0x0812B76E
BADGE_BUY_HOOK equ 0x0812b776
BADGE_BUY_SUBR equ 0x081E0970
ITEM_SHOP_ARRAY equ 0x081E0580
BADGE_DESC_RAM equ 0x02003043
BADGE_BUY_BLOCK equ 0x0812B780
BADGE_SHOP_RAM equ 0x02003042
BADGE_FIX equ 0x0812AE8E
PANTS_FIX equ 0x0812AEF0
PANTS_VALUE equ 0x100
BADGE_COUNT_FIX equ 0x0812adb8
BADGE_COUNT_HOOK equ 0x0812adf2
BADGE_COUNT_SUBR equ 0x081E0200
PRICE_FIX_HOOK equ 0x0812aeac
PRICE_FIX_SUBR equ 0x081E0230
PRICE_FIX_PANTS_HOOK equ 0x0812af0e
PRICE_FIX_PANTS_SUBR equ 0x081E0250
EQUIP_FIX_HOOK equ 0x0812c38a
EQUIP_FIX_SUBR equ 0x081E05F0
PANTS_TEXT_FIX equ 0x0812e52a
BSHOP_RAM equ 0x0200302D
BUY_RAM equ 0x0200302E

.org BADGE_BUY_BLOCK
	mov r0, r0

.org BADGE_BUY_FIX
	mov r0, #0xFF

.org PANTS_TEXT_FIX 
	mov r3, #0xFF

.org BADGE_COUNT_FIX
	 ldrb r0, [r0, #0x1]
	 mov r0, r0
	 mov r0, r0

.org ITEM_SHOP_ARRAY
	dw 0x083BBBDC
	dw 0x083BBBF0
	dw 0x083BBCCC
	dw 0x083BBC04
	dw 0x083BBC18
	dw 0x083BBC2C
	dw 0x083BBCE0
	dw 0x083BBC40
	dw 0x083BBC54
	dw 0x083BBC68
	dw 0x083BBCF4
	dw 0x083BBC7C
	dw 0x083BBCA4
	dw 0x083BBCB8
	dw 0x083BBD08
	dw 0x083BBC90
	dw 0x083BBD1C
	dw 0x083BBD30
	dw 0x083BBD44
	dw 0x083BBD58
	dw 0x083BBD6C
	dw 0x083BBD80
	dw 0x083BBD94
	dw 0x083BBDA8
	dw 0x083BBDBC

.org BADGE_SHOP_HOOK
	bl BADGE_SHOP_SUBR

.org BADGE_SHOP_INJECT_HOOK
	bl BADGE_SHOP_INJECT_SUBR

.org PANTS_SHOP_INJECT_HOOK
	bl PANTS_SHOP_INJECT_SUBR

.org BADGE_SHOP_TEXT_HOOK
	bl BADGE_SHOP_TEXT_SUBR

.org BADGE_SHOP_TEXT_RAM_HOOK
	bl BADGE_SHOP_TEXT_RAM_SUBR

.org BADGE_SHOP_DESC_HOOK
	bl BADGE_SHOP_DESC_SUBR

.org BADGE_SHOP_DESC_RAM_HOOK
	bl BADGE_SHOP_DESC_RAM_SUBR

.org PANTS_SHOP_DESC_HOOK
	bl PANTS_SHOP_DESC_SUBR

.org PANTS_SHOP_DESC_RAM_HOOK
	bl PANTS_SHOP_DESC_RAM_SUBR

.org BADGE_BUY_HOOK
	bl BADGE_BUY_SUBR

.org BADGE_COUNT_HOOK
	bl BADGE_COUNT_SUBR

.org PRICE_FIX_HOOK
	bl PRICE_FIX_SUBR

.org PRICE_FIX_PANTS_HOOK
	bl PRICE_FIX_PANTS_SUBR

.org EQUIP_FIX_HOOK
	bl EQUIP_FIX_SUBR

.org EQUIP_FIX_SUBR
push { r5, lr }
ldr r5, =0x03003FE6
ldrb r5, [r5]
cmp r5, #0x80
blt .equip_norm
ldr r5, =0x03003FD6
ldrb r5, [r5]
cmp r5, #0x3
blt .equip_clause
mov r2, #0x82
mov r0, #0x80
bl .equip_end
.equip_clause:
mov r2, #0x81
mov r0, #0x80
bl .equip_end
.equip_norm:
ldrb r2, [r6]
mov r0, #0x80
.equip_end:
pop { r5, pc }
.pool

.org BADGE_SHOP_TEXT_RAM_SUBR
push { r1, lr }
ldr r1, =BADGE_DESC_RAM
strb r4, [r1]
lsl r3, #0x10
lsr r3, #0x10
pop { r1, pc }
.pool

.org PRICE_FIX_SUBR
push lr
ldr r0, =PRICE_RAM
mov r1, #0x1
strb r1, [r0]
ldr r1, =BSHOP_RAM
ldrb r1, [r1]
mov r3, #0x3
bl PRICE_CALC
mov r0, r7
pop pc
.pool

.org PRICE_FIX_PANTS_SUBR
push lr
ldr r0, =PRICE_RAM
mov r1, #0x1
strb r1, [r0]
ldr r1, =BSHOP_RAM
ldrb r1, [r1]
mov r3, #0x3
bl PRICE_CALC
mov r0, r7
pop pc
.pool

.org BADGE_COUNT_SUBR
push { r2, r3, lr }
mov r1, #0x0
ldrsh r0, [r0, r1]
cmp r0, r9
beq .count_fix
bl .count_end
.count_fix:
ldr r2, =0x03003fcc
ldrb r3, [r2]
sub r3, #0x1
strb r3, [r2]
ldrb r3, [r2, #0x2]
add r3, #0x1
strb r3, [r2, #0x2]
.count_end:
pop { r2, r3, pc }
.pool

.org BADGE_BUY_SUBR
push { r1-r4, lr }
cmp r0, #0x30
bge .pants_key
ldr r1, =MUSHROOM
ldrb r2, [r1, r0]
cmp r2, #0xFF
beq .pants_buy_clause
add r2, #0x1
strb r2, [r1, r0]
bl .pants_buy_end
.pants_buy_clause:
mov r2, #0x1
strb r2, [r1, r0]
bl .pants_buy_end
.pants_key:
cmp r0, #0x9E
bge .pants_badge
sub r0, #0x30
mov r1, r0
lsr r0, #0x4
lsl r1, #0x1C
lsr r1, #0x1c
cmp r1, #0x9
bge .pants_hand
ldr r2, =KEY_ITEM
ldrb r3, [r2, r0]
mov r4, #0x1
lsl r4, r1
orr r3, r4
strb r3, [r2, r0]
bl .pants_buy_end
.pants_hand:
sub r1, #0x9
mov r2, #0x1
lsl r2, r1
ldr r1, =0x02004339
ldrb r0, [r1]
orr r0, r2
strb r0, [r1]
bl .pants_buy_end
.pants_badge:
sub r0, #0x9E
cmp r0, #0x2C
bge .pants_pants
bl BADGE_ADD
bl .pants_buy_end
.pants_pants:
cmp r0, #0x5A
bge .pants_special
bl PANTS_ADD
bl .pants_buy_end
.pants_special:
bl SPECIAL_ADD
.pants_buy_end:
mov r0, #0xFF
pop { r1-r4, pc }
.pool

.org BADGE_ADD
push { r1, r2, r3, lr }
mov r3, #0x0
ldr r1, =BADGE
ldrb r2, [r1, r0]
cmp r2, #0xff
beq .badge_clause
add r2, #0x1
strb r2, [r1, r0]
bl .badge_end
.badge_clause:
mov r2, #0x1
strb r2, [r1, r0]
.badge_flag:
ldr r1, =BADGE_FLAGS
ldrb r2, [r1, r3]
cmp r2, #0xFF
beq .bflag_set
add r3, #0x1
bl .badge_flag
.bflag_set:
strb r0, [r1, r3]
.badge_end:
pop { r1, r2, r3, pc }
.pool

.org PANTS_ADD
push { r0, r1, r2, r3, lr }
sub r0, #0x2C
mov r3, #0x0
ldr r1, =PANTS
ldrb r2, [r1, r0]
cmp r2, #0xff
beq .pants_clause
add r2, #0x1
strb r2, [r1, r0]
ldrb r2, [r1, r0]
cmp r2, #0x1
beq .pants_flag
bl .pants_end
.pants_clause:
mov r2, #0x1
strb r2, [r1, r0]
.pants_flag:
ldr r1, =PANTS_FLAGS
ldrb r2, [r1, r3]
cmp r2, #0xFF
beq .pflag_set
add r3, #0x1
bl .pants_flag
.pflag_set:
strb r0, [r1, r3]
.pants_end:
pop { r0, r1, r2, r3, pc }
.pool

.org SPECIAL_ADD
push { r0, r1, r2, r3, lr }
sub r0, #0x5A
mov r3, #0x0
ldr r1, =SPECIAL
ldrb r2, [r1, r0]
cmp r2, #0xff
beq .special_clause
add r2, #0x1
strb r2, [r1, r0]
ldrb r2, [r1, r0]
cmp r2, #0x1
beq .special_flag
bl .special_end
.special_clause:
mov r2, #0x1
strb r2, [r1, r0]
.special_flag:
ldr r1, =SPECIAL_FLAGS
ldrb r2, [r1, r3]
cmp r2, #0xFF
beq .sflag_set
add r3, #0x1
bl .special_flag
.sflag_set:
strb r0, [r1, r3]
.special_end:
ldr r1, =0x0200433c
ldrb r2, [r1]
mov r3, #0x4
orr r2, r3
strb r2, [r1]
pop { r0, r1, r2, r3, pc }
.pool

.org BADGE_SHOP_SUBR
push { r5, lr }
mov r3, #0x1
neg r3, r3
ldr r5, =0xFF00
cmp r2, r5
bge .badge_shop_end
mov r5, r2
lsr r5, #0x8
cmp r5, #0x1
bne .badge_shop_r
mov r0, #0x0
bl .badge_shop_end
.badge_shop_r:
mov r0, #0x81
lsl r0, #0x10
.badge_shop_end:
pop { r5, pc }
.pool

.org BADGE_SHOP_INJECT_SUBR
push { r5, lr }
strb r2, [r1]
ldr r5, =BSHOP_RAM
strb r2, [r5]
pop { r5, pc }	
.pool

.org PANTS_SHOP_INJECT_SUBR
push { r5, lr }
lsl r2, #0x18
lsr r2, #0x18
strb r2, [r1]
ldr r5, =BSHOP_RAM
strb r2, [r5]
pop { r5, pc }	
.pool

.org BADGE_SHOP_TEXT_SUBR
push { r2, r3, r4, lr }
ldr r3, =BADGE_DESC_RAM
ldrb r2, [r3]
mov r4, #0x0
strb r4, [r3]
cmp r2, #0x30
bge .text_key
cmp r2, #0x2B
bge .text_bean
sub r2, #0xA
ldr r3, =ITEM_SHOP_ARRAY
mov r4, #0x4
mul r2, r4
ldr r1, [r3, r2]
bl .text_norm
.text_bean:
sub r2, #0x2b
ldr r3, =BEAN_ITEM_SHOP_ARRAY
mov r4, #0x4
mul r2, r4
ldr r1, [r3, r2]
bl .text_norm
.text_key:
cmp r2, #0x9E
bge .text_badge
sub r2, #0x30
mov r3, r2
lsr r2, #0x4
lsl r3, #0x1C
lsr r3, #0x1C
cmp r3, #0x8
bge .text_bros
mov r4, #0x8
mul r2, r4
add r2, r3
mov r4, #0x4
mul r2, r4
ldr r3, =KEY_ITEM_SHOP_ARRAY
ldr r1, [r3, r2]
bl .text_norm
.text_bros:
sub r3, #0x8
cmp r3, #0x0
bgt .text_hands
; Hammer Code Here
bl .text_norm
.text_hands:
ldr r2, =BROS_ITEM_SHOP_ARRAY
add r3, #0x2
mov r4, #0x4
mul r3, r4
ldr r1, [r2, r3]
bl .text_norm
.text_badge:
sub r2, #0x9E
mov r3, #0x4
mul r3, r2
ldr r2, =BADGE_SHOP_ARRAY
ldr r1, [r2, r3]
.text_norm:
ldr r1, [r1]
ldr r1, [r1]
pop { r2, r3, r4, pc }
.pool

.org BADGE_SHOP_DESC_RAM_SUBR
push { r3, lr }
ldr r3, =BADGE_DESC_RAM
strb r1, [r3]
add r2, r4, #0x0
and r2, r1
pop { r3, pc }
.pool

.org BADGE_SHOP_DESC_SUBR
push { r3, r4, r6, lr }
ldr r3, =BADGE_DESC_RAM
ldrb r3, [r3]
cmp r3, #0x30
bge .desc_key
cmp r3, #0x2B
bge .desc_bean
sub r3, #0xA
ldr r4, =ITEM_SHOP_ARRAY
lsl r3, #0x2
ldr r2, [r4, r3]
bl .desc_norm
.desc_bean:
sub r3, #0x2b
ldr r4, =BEAN_ITEM_SHOP_ARRAY
lsl r3, #0x2
ldr r2, [r4, r3]
bl .desc_norm
.desc_key:
cmp r3, #0x9E
bge .desc_badge
sub r3, #0x30
mov r4, r3
lsr r3, #0x4
lsl r4, #0x1C
lsr r4, #0x1C
cmp r4, #0x8
bge .desc_bros
lsl r3, #0x3
add r3, r4
lsl r3, #0x2
ldr r4, =KEY_ITEM_SHOP_ARRAY
ldr r2, [r4, r3]
bl .desc_norm
.desc_bros:
sub r4, #0x8
cmp r4, #0x0
bgt .desc_hands
; Hammer Code Here
bl .desc_norm
.desc_hands:
ldr r3, =BROS_ITEM_SHOP_ARRAY
add r4, #0x2
lsl r4, #0x2
ldr r2, [r3, r4]
bl .desc_norm
.desc_badge:
sub r3, #0x9E
lsl r3, #0x2
ldr r2, =BADGE_SHOP_ARRAY
ldr r2, [r2, r3]
.desc_norm:
ldr r3, =BADGE_DESC_RAM
mov r4, #0x0
strb r4, [r3]
ldr r1, [r2]
ldr r1, [r1, #0x4]
pop { r3, r4, r5, pc }
.pool

.org PANTS_SHOP_DESC_RAM_SUBR
push { r3, lr }
ldr r3, =BADGE_DESC_RAM
strb r1, [r3]
mov r2, r4
and r2, r1
pop { r3, pc }
.pool

.org PANTS_SHOP_DESC_SUBR
push { r3, r4, r6, lr }
ldr r3, =BADGE_DESC_RAM
ldrb r3, [r3]
cmp r3, #0x30
bge .desc_key2
cmp r3, #0x2B
bge .desc_bean2
sub r3, #0xA
ldr r4, =ITEM_SHOP_ARRAY
lsl r3, #0x2
ldr r2, [r4, r3]
bl .desc_norm2
.desc_bean2:
sub r3, #0x2b
ldr r4, =BEAN_ITEM_SHOP_ARRAY
lsl r3, #0x2
ldr r2, [r4, r3]
bl .desc_norm2
.desc_key2:
cmp r3, #0x9E
bge .desc_badge2
sub r3, #0x30
mov r4, r3
lsr r3, #0x4
lsl r4, #0x1C
lsr r4, #0x1C
cmp r4, #0x8
bge .desc_bros2
lsl r3, #0x3
add r3, r4
lsl r3, #0x2
ldr r4, =KEY_ITEM_SHOP_ARRAY
ldr r2, [r4, r3]
bl .desc_norm2
.desc_bros2:
sub r4, #0x8
cmp r4, #0x0
bgt .desc_hands2
; Hammer Code Here
bl .desc_norm2
.desc_hands2:
ldr r3, =BROS_ITEM_SHOP_ARRAY
add r4, #0x2
lsl r4, #0x2
ldr r2, [r3, r4]
bl .desc_norm2
.desc_badge2:
sub r3, #0x9E
lsl r3, #0x2
ldr r2, =BADGE_SHOP_ARRAY
ldr r2, [r2, r3]
.desc_norm2:
ldr r3, =BADGE_DESC_RAM
mov r4, #0x0
strb r4, [r3]
ldr r1, [r2]
ldr r1, [r1, #0x4]
pop { r3, r4, r5, pc }
.pool