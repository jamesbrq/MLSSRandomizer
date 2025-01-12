BADGE equ 0x02004912
PANTS equ 0x0200494A
SPECIAL equ 0x02004982
BADGE_FLAGS equ 0x02004992
PANTS_FLAGS equ 0x020049CA
SPECIAL_FLAGS equ 0x02004A02
BADGE_ADD equ 0x08E019B0
PANTS_ADD equ 0x08E01A50
SPECIAL_ADD equ 0x08E01B00
BADGE_SHOP_HOOK equ 0x0812AE7C
BADGE_SHOP_SUBR equ 0x081E0490
BADGE_SHOP_INJECT_HOOK equ 0x0812AE90
BADGE_SHOP_INJECT_SUBR equ 0x081E04C0
PANTS_SHOP_INJECT_HOOK equ 0x0812AEF2
PANTS_SHOP_INJECT_SUBR equ 0x081DFF00
BADGE_SHOP_TEXT_RAM_HOOK equ 0x0812E57E
BADGE_SHOP_TEXT_RAM_SUBR equ 0x081DFF20
BADGE_SHOP_TEXT_HOOK equ 0x0812E59C
BADGE_SHOP_TEXT_SUBR equ 0x081DFF30
BADGE_SHOP_TEXT_DATA equ 0x08E06A00
BADGE_SHOP_DESC_HOOK equ 0x0812E2AC
BADGE_SHOP_DESC_SUBR equ 0x081DFFD0
BADGE_SHOP_DESC_DATA equ 0x08E06300
PANTS_SHOP_DESC_HOOK equ 0x0812E2E6
PANTS_SHOP_DESC_SUBR equ 0x081E0070
PANTS_SHOP_DESC_DATA equ 0x08E06100
BADGE_SHOP_DESC_RAM_HOOK equ 0x0812E296
BADGE_SHOP_DESC_RAM_SUBR equ 0x081E01F0
PANTS_SHOP_DESC_RAM_HOOK equ 0x0812E2D0
PANTS_SHOP_DESC_RAM_SUBR equ 0x081DFAC0
BADGE_BUY_FIX equ 0x0812B76E
BADGE_BUY_HOOK equ 0x0812b776
BADGE_BUY_SUBR equ 0x081E0970
BADGE_BUY_DATA equ 0x08E06500
ITEM_SHOP_ARRAY equ 0x08E06750
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
PRICE_FIX_SUBR equ 0x081E02B0
PRICE_FIX_PANTS_HOOK equ 0x0812af0e
PRICE_FIX_PANTS_SUBR equ 0x081E0250
EQUIP_FIX_HOOK equ 0x0812c38a
EQUIP_FIX_SUBR equ 0x081E05F0
PANTS_TEXT_FIX equ 0x0812e52a
BSHOP_RAM equ 0x0200302D
BUY_RAM equ 0x0200302E
PANTS_SPRITE_HOOK equ 0x0812D87E
PANTS_SPRITE_SUBR equ 0x081E0800
AP_RAM equ 0x0200304C
AP_INIT equ 0x0200304B
AP_SCROLL equ 0x0200304A
AP_BADGE_HOOK equ 0x0812AE70
AP_BADGE_SUBR equ 0x081DFDC0
AP_BADGE_DESC equ 0x08D10200
AP_FBADGE_DESC equ 0x08D10300
AP_PANTS_DESC equ 0x08D10400
AP_FPANTS_DESC equ 0x08D10500
AP_RAM_CHECK_HOOK equ 0x0812E192
AP_RAM_CHECK_SUBR equ 0x081DFE00
EMBLEM_SHOP_HOOK2 equ 0x08E012A0
EMBLEM_SHOP3 equ 0x08E01250
EMBLEM_TEXT_BOX2 equ 0x08E01200
ITEM_CHANGE_FIX_HOOK equ 0x0812B87E
ITEM_CHANGE_FIX_SUBR equ 0x081E0C00
SHOP_FLAG_FUNC equ 0x08E01900


.org AP_RAM_CHECK_HOOK
	bl AP_RAM_CHECK_SUBR


.org AP_RAM_CHECK_SUBR
push lr
add r1, r2
ldr r1, [r1]
ldr r1, [r1, #0x4]
pop pc
.pool

.org EMBLEM_SHOP_HOOK2
	dw EMBLEM_SHOP3

.org EMBLEM_SHOP3
	dw EMBLEM_TEXT_BOX2
	dw EMBLEM_TEXT_BOX2

.org EMBLEM_TEXT_BOX2
	db "Beanstar Emblem", 0x0

.org 0x0812E196
	db 0xA8


.org AP_BADGE_DESC
	dw 0x08D12600
	dw 0x08D12640
	dw 0x08D12680
	dw 0x08D126C0
	dw 0x08D12700
	dw 0x08D12740
	dw 0x08D12780
	dw 0x08D127C0
	dw 0x08D12800
	dw 0x08D12840
	dw 0x08D12880
	dw 0x08D128C0
	dw 0x08D12900
	dw 0x08D12940
	dw 0x08D12980
	dw 0x08D129C0
	dw 0x08D12A00

.org AP_FBADGE_DESC
	dw 0x08D12A40
	dw 0x08D12A80
	dw 0x08D12AC0
	dw 0x08D12B00
	dw 0x08D12B40
	dw 0x08D12B80
	dw 0x08D12BC0

.org AP_PANTS_DESC
	dw 0x08D12C00
	dw 0x08D12C40
	dw 0x08D12C80
	dw 0x08D12CC0
	dw 0x08D12D00
	dw 0x08D12D40
	dw 0x08D12D80
	dw 0x08D12DC0
	dw 0x08D12E00
	dw 0x08D12E40
	dw 0x08D12E80
	dw 0x08D12EC0
	dw 0x08D12F00
	dw 0x08D12F40
	dw 0x08D12F80
	dw 0x08D12FC0
	dw 0x08D13000
	dw 0x08D13040

.org AP_FPANTS_DESC
	dw 0x08D13080
	dw 0x08D130C0
	dw 0x08D13100
	dw 0x08D13140
	dw 0x08D13180
	dw 0x08D131C0
	dw 0x08D13200
	



.org 0x0812D876 ;Pants sprite fix
	db 0xE6

.org 0x0812D7D6 ;Pants sprite fix 2
	db 0xFF

.org 0x0812D7E9 ;Pants sprite fix 2
	db 0xDA

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

.org PANTS_SPRITE_HOOK
	bl PANTS_SPRITE_SUBR

.org AP_BADGE_HOOK
	bl AP_BADGE_SUBR

.org ITEM_CHANGE_FIX_HOOK
	bl ITEM_CHANGE_FIX_SUBR





.org SHOP_FLAG_FUNC
push { r0-r3, lr }
mov r3, #0x0
ldr r0, =AP_RAM
ldr r0, [r0]
ldr r1, =0x083C05F0
cmp r0, r1
bne .shop_fungi_check
ldr r0, =0x020047F0
bl .flags_cont
.shop_fungi_check:
ldr r1, =0x083C066A
cmp r0, r1
bne .flags_badge
ldr r0, =0x020047F0
add r3, #0x10
bl .flags_cont
.flags_badge:
ldr r1, =0x083C0618
cmp r0, r1
bne .flags_fungi
ldr r0, =0x020047F4
ldr r1, =0x03003FE0
ldrb r1, [r1]
mov r2, #0x7F
and r1, r2
cmp r1, #0x1
bne .flags_cont
add r0, #0x4
bl .flags_cont
.flags_fungi:
ldr r0, =0x020047FC
ldr r1, =0x03003FE0
ldrb r1, [r1]
mov r2, #0x7F
and r1, r2
cmp r1, #0x1
bne .flags_cont
add r3, #0x8
.flags_cont:
cmp r4, #0x2
bne .scroll_norm
mov r1, r5
mov r4, #0x1
bl .scroll_skip
.scroll_norm:
ldr r1, =AP_SCROLL
ldrb r1, [r1]
.scroll_skip:
add r3, r1
mov r2, #0x1
lsl r2, r3
ldr r1, [r0]
cmp r4, #0x1
bne .flags_write
and r1, r2
cmp r1, #0x0
bl .flags_end
.flags_write:
orr r1, r2
str r1, [r0]
.flags_end:
pop { r0-r3, pc }
.pool





.org ITEM_CHANGE_FIX_SUBR
push lr
mov r0, #0xFF
and r0, r2
pop pc
.pool






.org AP_BADGE_SUBR
push r2, lr
add r0, #0x18
ldr r1, [r0]
ldr r2, =AP_RAM
str r1, [r2]
pop r2, pc
.pool




.org PANTS_SPRITE_SUBR
push { r2, lr }
cmp r2, #0x30
bge .sprite_key
sub r2, #0xA
cmp r2, #0xB
bgt .sprite_extra
lsr r2, #0x2
mov r0, r2
bl .pants_sprite_norm
.sprite_extra:
sub r2, #0x9
cmp r2, #0x4
bgt .sprite_gold
mov r0, #0x3
bl .pants_sprite_norm
.sprite_gold:
sub r2, #0x1
cmp r2, #0x8
bge .sprite_espresso
mov r0, r2
bl .pants_sprite_norm
.sprite_espresso:
sub r2, #0x8
cmp r2, #0x6
bgt .sprite_bean
mov r0, #0x8
bl .pants_sprite_norm
.sprite_bean:
sub r2, #0xE
mov r0, #0x9
add r0, r2
bl .pants_sprite_norm
.sprite_key:
cmp r2, #0x9E
bge .sprite_badge
mov r0, #0xD
bl .pants_sprite_norm
.sprite_badge:
cmp r2, #0xCA
bge .sprite_pants
mov r0, #0xE
bl .pants_sprite_norm
.sprite_pants:
cmp r2, #0xF8
bge .sprite_special
mov r0, #0x11
bl .pants_sprite_norm
.sprite_special:
mov r0, #0x12
.pants_sprite_norm:
add r1, r0
mov r6, r1
pop { r2, pc }
.pool

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
push { r2, r4, lr }
ldr r0, =PRICE_RAM
mov r1, #0x1
strb r1, [r0]
ldr r1, =BSHOP_RAM
ldrb r1, [r1]
mov r3, #0x3
ldr r4, =PRICE_CALC + 1
mov r2, pc
bx r4
mov r0, r7
pop { r2, r4, pc }
.pool

.org PRICE_FIX_PANTS_SUBR
push { r2, r4, lr }
ldr r0, =PRICE_RAM
mov r1, #0x1
strb r1, [r0]
ldr r1, =BSHOP_RAM
ldrb r1, [r1]
mov r3, #0x3
ldr r4, =PRICE_CALC + 1
mov r2, pc
bx r4
mov r0, r7
pop { r2, r4, pc }
.pool

.org BADGE_COUNT_SUBR
push { r2, r3, lr }
mov r1, #0x0
ldrsh r0, [r0, r1]
cmp r0, r9
beq .count_fix
bl .count_end
.count_fix:
ldr r2, =ROOM
ldrh r2, [r2]
ldr r3, =0x182
cmp r2, r3
beq .count_end
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
ldr r2, =BADGE_BUY_DATA + 1
mov r1, pc
bx r2
pop { r1-r4, pc }
.pool

.org BADGE_BUY_DATA
push r1-r4
ldr r1, =AP_INIT
mov r2, 0x1
strb r2, [r1]
ldr r1, =0x03003FE4
ldrb r2, [r1]
mov r1, #0x7F
and r2, r1
ldr r1, =AP_SCROLL
strb r2, [r1]
cmp r0, #0x30
bge .pants_key
sub r0, #0xA
ldr r1, =MUSHROOM
ldrb r2, [r1, r0]
cmp r2, #0xFF
beq .pants_buy_clause
add r2, #0x1
cmp r2, #0x64
blt .bmush
mov r2, #0x63
.bmush:
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
lsr r1, #0x1C
cmp r1, #0x8
bge .pants_bros
ldr r2, =KEY_ITEM
ldrb r3, [r2, r0]
mov r4, #0x1
lsl r4, r1
orr r3, r4
strb r3, [r2, r0]
bl .pants_buy_end
.pants_bros:
cmp r1, #0x8
bne .pants_hand
push r4
mov r4, #0x1
bl SHOP_FLAG_FUNC
pop r4
bne .pants_buy_end
ldr r2, =0x02004338
ldrb r3, [r2]
mov r4, #0x8
and r4, r3
cmp r4, #0x8
beq .pants_super
mov r4, #0x8
orr r3, r4
strb r3, [r2]
bl .pants_buy_end
.pants_super:
mov r4, #0x10
and r4, r3
cmp r4, #0x10
beq .pants_ultra
mov r4, #0x10
orr r3, r4
strb r3, [r2]
bl .pants_buy_end
.pants_ultra:
mov r4, #0x20
orr r3, r4
strb r3, [r2]
bl .pants_buy_end
.pants_hand:
cmp r1, #0xE
beq .pants_emblem
cmp r1, #0xF
beq .pants_buy_end
sub r1, #0x9
mov r2, #0x1
lsl r2, r1
ldr r1, =0x02004339
ldrb r0, [r1]
orr r0, r2
strb r0, [r1]
bl .pants_buy_end
.pants_emblem:
push r4
mov r4, #0x1
bl SHOP_FLAG_FUNC
pop r4
bne .pants_buy_end
ldr r1, =0x020048FB
ldrb r2, [r1]
cmp r2, #0xFF
bne .pants_emblem_norm
mov r2, #0x1
strb r2, [r1]
bl .pants_buy_end
.pants_emblem_norm:
add r2, #0x1
strb r2, [r1]
bl .pants_buy_end
.pants_badge:
sub r0, #0x9E
cmp r0, #0x2C
bge .pants_pants
ldr r2, =BADGE_ADD + 1
mov r1, pc
bx r2
bl .pants_buy_end
.pants_pants:
cmp r0, #0x5A
bge .pants_special
ldr r2, =PANTS_ADD + 1
mov r1, pc
bx r2
bl .pants_buy_end
.pants_special:
ldr r2, =SPECIAL_ADD + 1
mov r1, pc
bx r2
.pants_buy_end:
mov r0, #0xFF
push r4
mov r4, #0x0
bl SHOP_FLAG_FUNC
pop r4
pop r1-r4
add r1, #0x1
bx r1
.pool

.org BADGE_ADD
push { r1-r3 }
ldr r1, =BADGE
ldrb r2, [r1, r0]
cmp r2, #0xff
beq .badge_clause
ldr r3, =0x0200302C
ldrb r3, [r3]
cmp r3, #0x0
beq .badge_add_skip
sub r3, #0x01
.badge_add_skip:
add r3, #0x1
add r2, r3
strb r2, [r1, r0]
bl .badge_flag
.badge_clause:
ldr r3, =0x0200302C
ldrb r3, [r3]
cmp r3, #0x0
beq .badge_clause_norm
mov r2, r3
bl .badge_clause_skip
.badge_clause_norm:
mov r2, #0x1
.badge_clause_skip:
strb r2, [r1, r0]
.badge_flag:
mov r3, #0x0
.badge_loop:
ldr r1, =BADGE_FLAGS
ldrb r2, [r1, r3]
cmp r2, r0
beq .badge_end
cmp r2, #0xFF
beq .bflag_set
add r3, #0x1
bl .badge_loop
.bflag_set:
strb r0, [r1, r3]
.badge_end:
pop { r1-r3 }
add r1, #0x1
bx r1
.pool

.org PANTS_ADD
push { r0-r3 }
sub r0, #0x2C
ldr r1, =PANTS
ldrb r2, [r1, r0]
cmp r2, #0xff
beq .pants_clause
ldr r3, =0x0200302C
ldrb r3, [r3]
cmp r3, #0x0
beq .pants_add_skip
sub r3, #0x01
.pants_add_skip:
add r3, #0x1
add r2, r3
strb r2, [r1, r0]
bl .pants_flag
.pants_clause:
ldr r3, =0x0200302C
ldrb r3, [r3]
cmp r3, #0x0
beq .pants_clause_norm
mov r2, r3
bl .pants_clause_skip
.pants_clause_norm:
mov r2, #0x1
.pants_clause_skip:
strb r2, [r1, r0]
.pants_flag:
mov r3, #0x0
.pants_loop:
ldr r1, =PANTS_FLAGS
ldrb r2, [r1, r3]
cmp r2, r0
beq .pants_end
cmp r2, #0xFF
beq .pflag_set
add r3, #0x1
bl .pants_loop
.pflag_set:
strb r0, [r1, r3]
.pants_end:
pop { r0-r3 }
add r1, #0x1
bx r1
.pool

.org SPECIAL_ADD
push { r0-r3 }
sub r0, #0x5A
mov r3, #0x0
ldr r1, =SPECIAL
ldrb r2, [r1, r0]
cmp r2, #0xff
beq .special_clause
add r2, #0x1
strb r2, [r1, r0]
bl .special_flag
.special_clause:
mov r2, #0x1
strb r2, [r1, r0]
.special_flag:
ldr r1, =SPECIAL_FLAGS
ldrb r2, [r1, r3]
cmp r2, r0
beq .special_end
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
pop { r0-r3 }
add r1, #0x1
bx r1
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
push { r2-r4, lr }
ldr r3, =BADGE_SHOP_TEXT_DATA + 1
mov r2, pc
bx r3
pop { r2-r4, pc }
.pool

.org BADGE_SHOP_TEXT_DATA
push r2-r4
push r4
mov r4, #0x2
bl SHOP_FLAG_FUNC
pop r4
beq .text_cont
cmp r6, #0xB
beq .text_cont
mov r6, #0x6
.text_cont:
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
cmp r3, #0x8
bgt .text_hands
ldr r2, =BROS_ITEM_SHOP_ARRAY
ldr r1, [r2]
bl .text_norm
.text_hands:
cmp r3, #0xE
beq .text_emblem
cmp r3, #0xF
beq .text_ap
sub r3, #0x8
ldr r2, =BROS_ITEM_SHOP_ARRAY
add r3, #0x2
mov r4, #0x4
mul r3, r4
ldr r1, [r2, r3]
bl .text_norm
.text_emblem:
ldr r1, =EMBLEM_SHOP_HOOK
bl .text_norm
.text_ap:
ldr r1, =AP_SHOP_HOOK
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
pop r2-r4
add r2, #0x1
bx r2
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
push { r3-r4, r6, lr }
ldr r3, =BADGE_SHOP_DESC_DATA + 1
mov r4, pc
bx r3
pop { r3-r4, r6, pc }
.pool

.org BADGE_SHOP_DESC_DATA
push { r3-r4, r6}
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
cmp r4, #0x8
bgt .desc_hands
ldr r3, =BROS_ITEM_SHOP_ARRAY
ldr r2, [r3]
bl .desc_norm
.desc_hands:
cmp r4, #0xE
beq .desc_emblem
cmp r4, #0xF
beq .desc_ap
sub r4, #0x8
ldr r3, =BROS_ITEM_SHOP_ARRAY
add r4, #0x2
lsl r4, #0x2
ldr r2, [r3, r4]
bl .desc_norm
.desc_emblem:
ldr r2, =EMBLEM_SHOP2
bl .desc_norm
.desc_ap:
ldr r2, =AP_RAM
ldr r2, [r2]
ldr r3, =0x083C0618
cmp r2, r3
bne .desc_ap_f
ldr r2, =AP_BADGE_DESC
bl .desc_ap_norm
.desc_ap_f:
ldr r2, =AP_FBADGE_DESC
.desc_ap_norm:
ldr r3, =0x03003FE4
ldrb r3, [r3]
mov r4, #0x1F
and r3, r4
lsl r3, #0x2
ldr r1, [r2, r3]
bl .desc_norm_ap
.desc_badge:
sub r3, #0x9E
lsl r3, #0x2
ldr r2, =BADGE_SHOP_ARRAY
ldr r2, [r2, r3]
.desc_norm:
ldr r1, [r2]
ldr r1, [r1, #0x4]
.desc_norm_ap:
ldr r3, =BADGE_DESC_RAM
mov r4, #0x0
strb r4, [r3]
pop { r3-r4, r6 }
add r4, #0x1
bx r4
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
ldr r3, =PANTS_SHOP_DESC_DATA + 1
mov r4, pc
bx r3
pop { r3-r4, r6, pc}
.pool

.org PANTS_SHOP_DESC_DATA
push { r3-r4, r6 }
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
cmp r4, #0x8
bgt .desc_hands2
ldr r3, =BROS_ITEM_SHOP_ARRAY
ldr r2, [r3]
bl .desc_norm2
.desc_hands2:
cmp r4, #0xE
beq .desc_emblem2
cmp r4, #0xF
beq .desc_ap2
sub r4, #0x8
ldr r3, =BROS_ITEM_SHOP_ARRAY
add r4, #0x2
lsl r4, #0x2
ldr r2, [r3, r4]
bl .desc_norm2
.desc_emblem2:
ldr r2, =EMBLEM_SHOP2
bl .desc_norm2
.desc_ap2:
ldr r2, =AP_RAM
ldr r2, [r2]
ldr r3, =0x083C0618
cmp r2, r3
bne .desc_ap_f2
ldr r2, =AP_PANTS_DESC
bl .desc_ap_norm2
.desc_ap_f2:
ldr r2, =AP_FPANTS_DESC
.desc_ap_norm2:
ldr r3, =0x03003FE4
ldrb r3, [r3]
mov r4, #0x1F
and r3, r4
lsl r3, #0x2
ldr r1, [r2, r3]
bl .desc_norm_ap2
.desc_badge2:
sub r3, #0x9E
lsl r3, #0x2
ldr r2, =BADGE_SHOP_ARRAY
ldr r2, [r2, r3]
.desc_norm2:
ldr r1, [r2]
ldr r1, [r1, #0x4]
.desc_norm_ap2:
ldr r3, =BADGE_DESC_RAM
mov r4, #0x0
strb r4, [r3]
pop { r3-r4, r5 }
add r4, #0x1
bx r4
.pool