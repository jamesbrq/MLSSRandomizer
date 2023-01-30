    .gba
    .thumb
    .open "mlss.gba", "mlss_loop.gba", 0x08000000
    .include "Arrays.asm"
    .include "Variables.asm"
    .include "Badges.asm"

    .org 0x082754C8
        db 0x22, 0xB0

    .org 0x0827547D
        db 0x22, 0xB0

    .org 0x0827555E
        db 0x22, 0xB0

    .org 0x082000A4
        db 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA

    .org GRASS_FIX
        db 0x24, 0x40

    .org SHOP_FIX
        db 0xFF

    .org SHOP_FIX2
        db 0xFF

    .org 0x082209BA
        db 0x20, 0xA0

    .org 0x08220A96
        db 0x20, 0xB0

    .org 0x0822075A
        db 0x21, 0x60

    .org OVERRIDE
       ; db 0x0, 0x0, 0x0, 0x0

    .org HIGH_JUMP
        db 0xAA

    .org SPIN_JUMP
        db 0xAA

    .org HAMMERS_SHOP
        dw HAMMERS_SHOP2

    .org SHAMMERS_SHOP
        dw SHAMMERS_SHOP2

    .org UHAMMERS_SHOP
        dw UHAMMERS_SHOP2

    .org FIRE_SHOP
        dw FIRE_SHOP2

    .org THUNDER_SHOP
        dw THUNDER_SHOP2

    .org HAMMERS_SHOP2
        dw HAMMERS_SHOPNAME
        dw HAMMERS_SHOPNAME

    .org HAMMERS_SHOPNAME
        db 0x48, 0x61, 0x6D, 0x6D, 0x65, 0x72, 0x73, 0x0

    .org SHAMMERS_SHOP2
       dw SHAMMERS_SHOPNAME
        dw SHAMMERS_SHOPNAME

    .org SHAMMERS_SHOPNAME
        db 0x53, 0x75, 0x70, 0x65, 0x72, 0x20, 0x48, 0x61, 0x6D, 0x6D, 0x65, 0x72, 0x73, 0x0

    .org UHAMMERS_SHOP2
        dw UHAMMERS_SHOPNAME
        dw UHAMMERS_SHOPNAME

    .org UHAMMERS_SHOPNAME
        db 0x55, 0x6C, 0x74, 0x72, 0x61, 0x20, 0x48, 0x61, 0x6D, 0x6D, 0x65, 0x72, 0x73, 0x0

    .org FIRE_SHOP2
        dw FIRE_SHOPNAME
        dw FIRE_SHOPNAME

    .org FIRE_SHOPNAME
        db 0x46, 0x69, 0x72, 0x65, 0x20, 0x68, 0x61, 0x6E, 0x64, 0x0

    .org THUNDER_SHOP2
        dw THUNDER_SHOPNAME
        dw THUNDER_SHOPNAME

    .org THUNDER_SHOPNAME
        db 0x54, 0x68, 0x75, 0x6E, 0x64, 0x65, 0x72, 0x20, 0x68, 0x61, 0x6E, 0x64, 0x0




    .org YOSHI_ARRAY
        dw 0x08240EBE
        dw 0x08241000
        dw 0x08241155
        dw 0x08241297
        dw 0x08241AFA
        dw 0x08241C3C
        dw 0x08241D7E



    .org KEY_ITEM_TEXT_ARRAY
        dw 0x08204587 ; Map
        dw 0x08204ABB ; Rose
        dw 0x082045B3 ; Brooch
        dw 0x082045E7 ; Red Goblet
        dw 0x0820461B ; Green Goblet
        dw 0x0820464F ; Red Fruit
        dw 0x08204683 ; White Fruit
        dw 0x082046BB ; Purple Fruit
        dw 0x082046F7 ; Membership Card
        dw 0x0820472B ; Winkle Card
        dw 0x08204753 ; Peach Dress
        dw 0x08204787 ; Fake Beanstar
        dw 0x082047B7 ; Crabbie Grass
        dw 0x082047E7 ; Red Pearl Bean
        dw 0x0820481B ; Green Pearl Bean
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204EB7 ; Bean Fruit
        dw 0x08204D3F ; Blue Egg
        dw 0x08204D73 ; Red Egg
        dw 0x08204DA7 ; Green Egg
        dw 0x08204DDB ; Yellow Egg
        dw 0x08204E13 ; Purple Egg
        dw 0x08204E4B ; Orange Egg
        dw 0x08204E83 ; Azure Egg
        dw 0x08204A13 ; Beanstar Piece
        dw 0x08204A13 ; Beanstar Piece
        dw 0x08204A13 ; Beanstar Piece
        dw 0x08204A13 ; Beanstar Piece
        dw 0x08204AEF ; Beanstar
        dw 0x08204B73 ; Sprangle
        dw 0x08204B23 ; Beanlet
        dw 0x08204B23 ; Beanlet
        dw 0x08204B23 ; Beanlet
        dw 0x08204B23 ; Beanlet
        dw 0x08204B23 ; Beanlet
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204B47 ; Beanstone
        dw 0x08204ee7 ; Scroll 1
        dw 0x08204f23 ; Scroll 2

    .org KEY_ITEM_SHOP_ARRAY
        dw 0x083BC6B8 ; Map
        dw 0x083BC8AC ; Rose
        dw 0x083BC6CC ; Brooch
        dw 0x083BC6E0 ; Red Goblet
        dw 0x083BC6F4 ; Green Goblet
        dw 0x083BC708 ; Red Fruit
        dw 0x083BC71C ; White Fruit
        dw 0x083BC730 ; Purple Fruit
        dw 0x083BC744 ; Membership Card
        dw 0x083BC758 ; Winkle Card
        dw 0x083BC76C ; Peach Dress
        dw 0x083BC780 ; Fake Beanstar
        dw 0x083BC794 ; Crabbie Grass
        dw 0x083BC7A8 ; Red Pearl Bean
        dw 0x083BC7BC ; Green Pearl Bean
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BCA28 ; Bean Fruit
        dw 0x083BC99C ; Blue Egg
        dw 0x083BC9B0 ; Red Egg
        dw 0x083BC9C4 ; Green Egg
        dw 0x083BC9D8 ; Yellow Egg
        dw 0x083BC9EC ; Purple Egg
        dw 0x083BCA00 ; Orange Egg
        dw 0x083BCA14 ; Azure Egg
        dw 0x083BC898 ; Beanstar Piece
        dw 0x083BC898 ; Beanstar Piece
        dw 0x083BC898 ; Beanstar Piece
        dw 0x083BC898 ; Beanstar Piece
        dw 0x083BC8C0 ; Beanstar
        dw 0x083BC8FC ; Spangle
        dw 0x083BC8D4 ; Beanlet
        dw 0x083BC8D4 ; Beanlet
        dw 0x083BC8D4 ; Beanlet
        dw 0x083BC8D4 ; Beanlet
        dw 0x083BC8D4 ; Beanlet
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BC8E8 ; Beanstone
        dw 0x083BCA3C ; Scroll 1
        dw 0x083BCA50 ; Scroll 2

    .org BROS_ITEM_SHOP_ARRAY
        dw HAMMERS_SHOP
        dw SHAMMERS_SHOP
        dw UHAMMERS_SHOP
        dw FIRE_SHOP
        dw THUNDER_SHOP

    .org BEAN_ITEM_SHOP_ARRAY
        dw 0x083BCD88
        dw 0x083BCD9C

    .org ESPRESSO_TEXT
        dw 0x082032D7
        dw 0x082032FF
        dw 0x08203327
        dw 0x08203353
        dw 0x0820337F
        dw 0x082033A3
        dw 0x082033C7

    .org ITEM_TEXTBOX_ARRAY
        dw 0x08483048
        dw 0x08483020
        dw ULTRA_MUSHROOM_TEXT
        dw 0x08484BB4
        dw NUT_TEXT
        dw SUPER_NUT_TEXT
        dw ULTRA_NUT_TEXT
        dw 0x08484BDC
        dw SYRUP_TEXT
        dw SUPER_SYRUP_TEXT
        dw ULTRA_SYRUP_TEXT
        dw 0x08484C00
        dw 0x084831E8
        dw 0x08484C50
        dw 0x08484C24
        dw REFRESHING_HERB_TEXT
        dw 0x08484C74
        dw 0x08484C98
        dw 0x083F62AC
        dw 0x083F62D0
        dw 0x083F62F4
        dw 0x083F631C
        dw 0x083F6340
        dw 0x083F6364
        dw 0x083F6388

    .org KEY_TEXTBOX_ARRAY
        dw 0x08401838
        dw ROSE_TEXT
        dw 0x083FAD14
        dw 0x083F1054
        dw 0x083F10A4
        dw 0x083F1454
        dw 0x083F1424
        dw 0x083F13F4
        dw 0x08401860
        dw 0x0840188C
        dw 0x083FAD8C
        dw 0x083FAD64
        dw 0x08481D1C
        dw 0x08481D44
        dw 0x08481D70
        dw 0x08489220
        dw 0x08489220
        dw 0x08489220
        dw 0x08489220
        dw 0x08489220
        dw 0x08489220
        dw 0x08489220
        dw 0x08488E8C
        dw 0x08483254
        dw 0x0848327C
        dw 0x084832A4
        dw 0x084832D0
        dw 0x084832FC
        dw 0x08483328
        dw 0x08486F08
        dw 0x08486F08
        dw 0x08486F08
        dw 0x08486F08
        dw 0x083FFEE0
        dw 0x08488E68 ; sprangle
        dw 0x083FACF0
        dw 0x083FACF0
        dw 0x083FACF0
        dw 0x083FACF0
        dw 0x083FACF0
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x083FACCC
        dw 0x08489584
        dw 0x084895AC

    .org BROS_TEXTBOX_ARRAY
        dw 0x083ECC98
        dw 0x08401108
        dw 0x08401130
        dw 0x084785A4
        dw 0x08478570


    .org UNKNOWN_FIX
        db 0x16

    .org THUNDER_FIX
        db 0x16

    .org FIRE_FIX
        db 0x16

    .org HAMMER_FIX
        db 0x16

    .org SHAMMER_FIX
        db 0x16

    .org UHAMMER_FIX
        db 0x16

    .org FRUIT_FIX
        db 0x16

    .org SPANGLE_FIX
        db 0x16

    .org UP_SUPER_FIX
        db 0x16

    .org MAP_FIX
        db 0x23

    .org SCROLL_FIX1
        db 0x16

    .org MEMBERSHIP_FIX
        db 0x16

    .org BROS_ROCK_FIX
        db 0x16

    .org SCROLL_FIX2
        db 0x16

    .org BEANLET_FIX
        db 0x16

    .org CASTLE_DOOR_FIX
        db 0xB

    .org FLAG_FIX 
        mov r0, r0

    .org FSHOP_FIX
        mov r0, r0

    .org FBSHOP_FIX
        mov r0, r0

    .org FPSHOP_FIX
        mov r0, r0

    .org ULTRA_MUSHROOM_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x6E, 0x20, 0x55, 0x6C, 0x74, 0x72, 0x61, 0x20, 0x4D, 0x75, 0x73, 0x68, 0x72, 0x6F, 0x6F, 0x6D, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org NUT_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x2, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x20, 0x4E, 0x75, 0x74, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org SUPER_NUT_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x20, 0x53, 0x75, 0x70, 0x65, 0x72, 0x20, 0x4E, 0x75, 0x74, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org ULTRA_NUT_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x6E, 0x20, 0x55, 0x6C, 0x74, 0x72, 0x61, 0x20, 0x4E, 0x75, 0x74, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org SYRUP_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x20, 0x53, 0x79, 0x72, 0x75, 0x70, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org SUPER_SYRUP_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x20, 0x53, 0x75, 0x70, 0x65, 0x72, 0x20, 0x53, 0x79, 0x72, 0x75, 0x70, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA, 0x0

    .org ULTRA_SYRUP_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0x6F, 0x75, 0x20, 0x67, 0x6F, 0x74, 0x20, 0x61, 0x6E, 0x20, 0x55, 0x6C, 0x74, 0x72, 0x61, 0x20, 0x53, 0x79, 0x72, 0x75, 0x70, 0x21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org REFRESHING_HERB_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X52, 0X65, 0X66, 0X72, 0X65, 0X73, 0X68, 0X69, 0X6E, 0X67, 0X20, 0X48, 0X65, 0X72, 0X62, 0X21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org HAMMER_TEXT
        db 0x48, 0X61, 0X6D, 0X6D, 0X65, 0X72, 0X73

    .org SUPER_HAMMER_TEXT
        db 0x53, 0X75, 0X70, 0X65, 0X72, 0X20, 0X48, 0X61, 0X6D, 0X6D, 0X65, 0X72, 0X73

    .org ULTRA_HAMMER_TEXT
        db 0x55, 0X6C, 0X74, 0X72, 0X61, 0X20, 0X48, 0X61, 0X6D, 0X6D, 0X65, 0X72, 0X73

    .org FIRE_TEXT
        db 0x46, 0X69, 0X72, 0X65, 0X62, 0X72, 0X61, 0X6E, 0X64, 0x0

    .org THUNDER_TEXT
        db 0x54, 0X68, 0X75, 0X6E, 0X64, 0X65, 0X72, 0X20, 0X48, 0X61, 0X6E, 0X64, 0x0

    .org ROSE_TEXT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X50, 0X65, 0X61, 0X73, 0X6C, 0X65, 0X79, 0X27, 0X73, 0X20, 0X52, 0X6F, 0X73, 0X65, 0X21
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org GOLDEN_FIX
        db 0x16

    .org HOO_TEXT
        dw 0x08404F38

    .org CHUCKLE_TEXT
        dw 0x08404F5C

     .org EVENT_BLOCKER_HOOK
        bl EVENT_BLOCKER_SUBR

     .org TEXT_ITEM_INJECT_HOOK
        bl TEXT_ITEM_INJECT_SUBR

     .org DOOR_HOOK
        bl DOOR_SUBR

     .org KEY_ITEM_B_HOOK
        bl KEY_ITEM_B_SUBR

     .org KEY_ITEM_TEXTBOX_HOOK
        bl KEY_ITEM_TEXTBOX

    .org KOOPA_BLOCK_HOOK
        bl KOOPA_BLOCK_SUBR

    .org CHUCKOLA_BLOCK_HOOK
        bl CHUCKOLA_BLOCK_SUBR

    .org TREE_BLOCK_HOOK
        bl TREE_BLOCK_SUBR

    .org ABILITY_BLOCK_HOOK
        bl ABILITY_BLOCK_SUBR

    .org KEY_ITEM_FIX_HOOK
        bl KEY_ITEM_FIX_SUBR

    .org TEXT_ITEM_BLOCK_HOOK
        bl TEXT_ITEM_BLOCK_SUBR

    .org HAND_FIX_HOOK
        bl HAND_FIX_SUBR

    .org HAND_FIX2_HOOK
        bl HAND_FIX2_SUBR

    .org TEXT_MASH_HOOK
        bl TEXT_MASH_SUBR

    .org INTRO_SKIP_HOOK
        bl INTRO_SKIP_SUBR
        
    .org INTRO_FIX_HOOK
        bl INTRO_FIX_SUBR

    .org SHOP_RAM_HOOK
        bl SHOP_RAM_SUBR

    .org SHOP_TEXT_HOOK
        bl SHOP_TEXT_SUBR

    .org SHOP_DESC_HOOK
        bl SHOP_DESC_SUBR

    .org SHOP_DESC_RAM_HOOK
        bl SHOP_DESC_RAM_SUBR

    .org SHOP_PRICE_HOOK
        bl SHOP_PRICE_SUBR

    .org SHOP_INJECT_RAM_HOOK
        bl SHOP_INJECT_RAM_SUBR

    .org SHOP_INJECT_HOOK
        bl SHOP_INJECT_SUBR

    .org SPRING_BLOCK_HOOK
        bl SPRING_BLOCK

    .org PRICE_INJECT_HOOK
        bl PRICE_INJECT_SUBR

    .org PEARL_RFIX_HOOK
        bl PEARL_RFIX_SUBR

    .org FIRST_STRIKE_HOOK
        bl FIRST_STRIKE_SUBR
                
    .org MOLE_FIX_HOOK
        bl MOLE_FIX_SUBR
        
    .org MOLE_FLAG_FIX_HOOK
        bl MOLE_FLAG_FIX_SUBR

    .org MOLE_FIX_PANTS_HOOK
        bl MOLE_FIX_PANTS_SUBR
        
    .org MOLE_FLAG_FIX_PANTS_HOOK
        bl MOLE_FLAG_FIX_PANTS_SUBR

    .org YOSHI_DISPLAY_HOOK
        bl YOSHI_DISPLAY_SUBR

    .org HP_SCALE_HOOK
        bl HP_SCALE_SUBR

    .org HP_SCALE_FIX_HOOK
        bl HP_SCALE_FIX_SUBR




    .org HP_SCALE_FIX_SUBR
    push { r2, lr }
    ldr r2, =ERANDOM
    ldrb r2, [r2]
    cmp r2, #0x1
    bne .scale_norm
    ldr r2, =0x030024B8
    ldrb r2, [r2]
    cmp r2, #0x32
    beq .scale_norm
    cmp r2, #0x1F
    beq .scale_norm
    cmp r2, #0x9A
    beq .scale_norm
    cmp r2, #0xB1
    beq .scale_norm
    bl CALC_HEALTH
    strh r0, [r1]
    bl .scale_end2
    .scale_norm:
    ldrh r0, [r6, #0x6]
    strh r0, [r1]
    .scale_end2:
    pop { r2, pc }
    .pool





    .org HP_SCALE_SUBR
    push { r1, lr }
    ldr r1, =ERANDOM
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .scale_end
    ldr r1, =0x030024B8
    ldrb r1, [r1]
    cmp r1, #0x32
    beq .scale_end
    cmp r1, #0x1F
    beq .scale_end
    cmp r1, #0x9A
    beq .scale_end
    cmp r1, #0xB1
    beq .scale_end
    bl CALC_HEALTH
    .scale_end:
    strh r0, [r6]
    mov r6, r9
    pop { r1, pc }
    .pool








    .org CALC_HEALTH
    push { r1, lr }
    ldr r1, =0x030024B8
    ldrb r1, [r1]
    sub r1, #0x7
    lsl r1, #0x1
    add r1, #0xA
    mov r0, r1
    pop { r1, pc }
    .pool




    .org YOSHI_DISPLAY_SUBR
    push { r0-r2, lr }
    ldr r0, =YOSHI_DISPLAY_RAM
    ldrb r2, [r0]
    cmp r2, #0x0
    bne .yd_ram
    strb r1, [r0]
    bl .yd_skip
    .yd_ram:
    cmp r2, r1
    beq .yd_end
    strb r1, [r0]
    .yd_skip:
    ldr r0, =ROOM
    ldrh r0, [r0]
    ldr r2, =0x1CD
    cmp r0, r2
    bne .yd_next
    bl .yd_search
    .yd_next:
    ldr r2, =0x1CE
    cmp r0, r2
    beq .yd_search
    bl MINIGAME_SPOILER
    cmp r2, #0x0
    beq .yd_end
    bl .yd_item
    .yd_search:
    cmp r1, #0x3
    ble .yd_end
    cmp r1, #0xB
    bge .yd_end
    sub r1, #0x4
    lsl r1, #0x2
    ldr r2, =YOSHI_ARRAY
    ldr r2, [r2, r1]
    ldrb r3, [r2, #0x1]
    lsr r3, #0x4
    ldrb r1, [r2]
    lsl r1, #0x1C
    lsr r1, #0x18
    add r2, r3, r1
    .yd_item:
    cmp r2, #0x30
    bge .yd_key
    cmp r2, #0x2B
    bge .yd_bean
    cmp r2, #0x1C
    bge .yd_espresso
    sub r2, #0xA
    lsl r2, #0x2
    ldr r3, =KEY_ITEM_NORM_ARRAY
    ldr r3, [r3, r2]
    bl .yd_display
    .yd_bean:
    sub r2, #0x2B
    lsl r2, #0x2
    ldr r3, =KEY_ITEM_BEAN_ARRAY
    ldr r3, [r3, r2]
    bl .yd_display
    .yd_espresso:
    sub r2, #0x1C
    lsl r2, #0x2
    ldr r3, =KEY_ITEM_ESPRESSO_ARRAY
    ldr r3, [r3, r2]
    bl .yd_display
    .yd_key:
    cmp r2, #0x9E
    bge .yd_badge
    sub r2, #0x30
    mov r0, r2
    lsr r0, #0x4
    lsl r2, #0x1C
    lsr r2, #0x1C
    cmp r2, #0x8
    bge .yd_bros
    lsl r0, #0x3
    add r2, r0
    lsl r2, #0x2
    ldr r3, =KEY_ITEM_TEXT_ARRAY
    ldr r3, [r3, r2]
    add r3, #0x1
    bl .yd_display
    .yd_bros:
    sub r2, #0x8
    cmp r2, #0x0
    bgt .yd_hand
    ldr r3, =HAMMER_TEXT
    bl .yd_display
    .yd_hand:
    cmp r2, #0x1
    bgt .yd_thunder
    ldr r3, =FIRE_TEXT
    bl .yd_display
    .yd_thunder:
    ldr r3, =THUNDER_TEXT
    bl .yd_display
    .yd_badge:
    sub r2, #0x9E
    lsl r2, #0x2
    ldr r3, =BADGE_BOX_ARRAY
    ldr r3, [r3, r2]
    add r3, #0x1
    .yd_display:
    bl DISPLAY_TEXTBOX

    .yd_end:
    mov r3, #0xD4
    lsl r3, #0x2
    pop { r0-r2, lr }
    .pool




    .org MINIGAME_SPOILER
    push lr
    ldr r2, =MINIGAME_ENABLE
    ldrb r2, [r2]
    cmp r2, #0x0
    beq .minigame_skip
    ldr r2, =0x1D1
    cmp r0, r2
    beq .scroll
    add r2, #0x1
    cmp r0, r2
    beq .scroll
    ldr r2, =0x137
    cmp r0, r2
    beq .membership
    ldr r2, =0x181
    cmp r0, r2
    beq .winkle
    ldr r2, =0x176
    cmp r0, r2
    beq .surf
    bl .minigame_skip
    .scroll:
    cmp r1, #0x2
    bne .minigame_skip
    ldr r1, =0x1D1
    sub r2, r1
    ldr r0, =0x081E9411
    ldrb r2, [r0, r2]
    bl .minigame_end
    .membership:
    cmp r1, #0x2
    bne .minigame_skip
    ldr r0, =0x08260637
    ldrb r2, [r0]
    lsl r2, #0x1C
    lsr r2, #0x18
    ldrb r3, [r0, #0x1]
    lsr r3, #0x4
    add r2, r3
    bl .minigame_end
    .winkle:
    cmp r1, #0x6
    bne .minigame_skip
    ldr r0, =0x08261658
    ldrb r2, [r0]
    lsl r2, #0x1C
    lsr r2, #0x18
    ldrb r3, [r0, #0x1]
    lsr r3, #0x4
    add r2, r3
    bl .minigame_end
    .surf:
    cmp r1, #0x2
    bne .minigame_skip
    ldr r0, =0x082753EA
    ldrb r2, [r0]
    lsl r2, #0x1C
    lsr r2, #0x18
    ldrb r3, [r0, #0x1]
    lsr r3, #0x4
    add r2, r3
    bl .minigame_end
    .minigame_skip:
    mov r2, #0x0
    .minigame_end:
    pop pc
    .pool





    .org MOLE_FIX_SUBR
    push lr
    add r0, r4
    cmp r4, #0x23
    beq .mole_fix
    strb r6, [r0]
    .mole_fix:
    pop pc
    .pool


    .org MOLE_FLAG_FIX_SUBR
    push lr
    cmp r4, #0x23
    beq .flag_end
    strb r4, [r0]
    .flag_end:
    mov r1, r8
    pop pc
    .pool



    .org MOLE_FIX_PANTS_SUBR
    push lr
    add r0, r4
    cmp r4, #0x2D
    beq .pmole_fix
    strb r6, [r0]
    .pmole_fix:
    pop pc
    .pool




    .org MOLE_FLAG_FIX_PANTS_SUBR
    push lr
    cmp r4, #0x2D
    beq .pflag_end
    strb r4, [r0]
    .pflag_end:
    mov r1, r8
    pop pc
    .pool




    .org FIRST_STRIKE_SUBR
    push { r1, r2, lr }
    ldr r1, =0x030024B6
    ldrb r1, [r1]
    mov r2, #0x20
    mul r1, r2
    ldr r2, =0x0850300C
    add r2, r1
    ldrb r2, [r2]
    cmp r2, #0xE4
    bne .strike_end
    ldr r1, =0x030024B5
    mov r2, #0x0
    strb r2, [r1]
    .strike_end:
    pop { r1, r2 }
    lsl r0, #0x1B
    lsr r0, #0x1D
    pop pc
    .pool




    .org PRICE_INJECT_SUBR
    push { r1, lr }
    and r0, r2
    strb r0, [r1]
    ldr r1, =BSHOP_RAM
    strb r0, [r1]
    pop { r1, pc }
    .pool


    .org PRICE_CALC
    push { r2, r3, lr }
    cmp r1, #0x30
    bge .price_key
    ldr r2, =PRICE_RAM
    ldrb r3, [r2]
    cmp r3, #0x1
    bne .price_skip
    cmp r1, #0x2B
    bge .price_skip
    sub r1, #0xA
    .price_skip:
    mov r3, #0x0
    strb r3, [r2]
    cmp r1, #0x2b
    bge .price_bean
    ldr r2, =PRICE_ARRAY
    lsl r1, #0x1
    ldrh r1, [r2, r1]
    bl .price_end
    .price_bean:
    mov r1, #0x1E
    bl .price_end
    .price_key:
    cmp r1, #0x9E
    bge .price_badge
    ldr r1, =0x012C
    bl .price_end
    .price_badge:
    sub r1, #0x9E
    lsl r1, #0x1
    ldr r2, =BADGE_PRICE_ARRAY
    ldrh r1, [r2, r1]
    .price_end:
    pop { r2, r3, pc }
    .pool





    .org SHOP_INJECT_RAM_SUBR
    push { r1, lr }
    ldr r1, =SHOP_INJECT_RAM
    strb r0, [r1]
    and r2, r0
    add r3, #0x8A
    pop { r1, pc }
    .pool





    .org SHOP_INJECT_SUBR
    push { r1, r2, r4, r5, lr }
    ldr r1, =SHOP_INJECT_RAM
    ldrb r1, [r1]
    cmp r1, #0x18
    ble .shop_inject_norm
    cmp r1, #0x30
    bge .shop_key
    cmp r1, #0x2b
    bge .shop_bean
    .shop_key:
    cmp r1, #0x9E
    bge .shop_badge
    sub r1, #0x30
    mov r2, r1
    lsr r1, #0x4
    lsl r2, #0x1C
    lsr r2, #0x1C
    cmp r2, #0x8
    bge .shop_bros
    ldr r4, =KEY_ITEM
    ldrb r4, [r4, r1]
    mov r5, #0x1
    lsl r5, r2
    orr r4, r5
    ldr r5, =KEY_ITEM
    strb r4, [r5, r1]
    bl .shop_inject_skip
    .shop_badge:
    sub r1, #0x9E
    cmp r1, #0x2C
    bge .shop_pants
    mov r0, r1
    bl BADGE_ADD
    bl .shop_inject_skip
    .shop_pants:
    cmp r1, #0x5A
    bge .shop_special
    mov r0, r1
    bl PANTS_ADD
    bl .shop_inject_skip
    .shop_special:
    mov r0, r1
    bl SPECIAL_ADD
    bl .shop_inject_skip
    .shop_bean:
    sub r1, #0xA
    ldr r2, =MUSHROOM
    ldr r5, =0x03003FE2
    ldrb r5, [r5]
    ldrb r4, [r2, r1]
    cmp r4, #0xFF
    beq .bean_clause
    add r4, r5
    strb r4, [r2, r1]
    bl .shop_inject_skip
    .bean_clause:
    mov r4, r5
    strb r4, [r2, r1]
    bl .shop_inject_skip
    .shop_bros:
    sub r2, #0x8
    cmp r2, #0x1
    bge .shop_hands
    ; Insert hammer code here
    bl .shop_inject_skip 
    .shop_hands:
    ldr r1, =HAMMER
    ldrb r4, [r1, #0x1]
    orr r4, r2
    strb r4, [r1, #0x1]
    bl .shop_inject_skip
    .shop_inject_norm:
    strb r0, [r3]
    .shop_inject_skip:
    pop r1
    add r3, r1, #0x0
    pop { r2, r4, r5, pc }
    .pool





    .org SHOP_PRICE_SUBR
    push lr
    ldr r1, =BSHOP_RAM
    ldrb r1, [r1]
    bl PRICE_CALC
    mov r0, r7
    mov r3, #0x3
    pop pc
    .pool





    .org SHOP_RAM_SUBR
    push { r1, lr }
    ldr r1, =SHOP_RAM
    strb r2, [r1]
    lsl r3, r3, #0x10
    lsr r3, r3, #0x10
    pop { r1, pc }
    .pool





    .org SHOP_DESC_RAM_SUBR
    push { r3, lr }
    ldr r3, =SHOP_DESC_RAM
    strb r1, [r3]
    and r2, r1
    lsl r2, r2, #0x4
    pop { r1, pc }
    .pool





    .org SHOP_TEXT_SUBR
    push { r2, r3, r4, lr }
    ldr r2, =SHOP_RAM
    ldrb r2, [r2]
    cmp r2, #0x18
    ble .shop_text_norm
    cmp r2, #0x30
    bge .shop_text_key
    cmp r2, #0x2B
    bge .shop_text_bean
    bl .shop_text_norm
    .shop_text_key:
    cmp r2, #0x9E
    bge .shop_text_badge
    sub r2, #0x30
    mov r3, r2
    lsr r2, #0x4
    lsl r3, #0x1C
    lsr r3, #0x1C
    cmp r3, #0x8
    bge .shop_text_bros
    mov r4, #0x8
    mul r2, r4
    mov r4, #0x4
    add r3, r2
    mul r3, r4
    ldr r1, =KEY_ITEM_SHOP_ARRAY
    ldr r1, [r1, r3]
    bl .shop_text_norm
    .shop_text_badge:
    sub r2, #0x9E
    ldr r3, =BADGE_SHOP_ARRAY
    mov r4, #0x4
    mul r2, r4
    ldr r1, [r3, r2]
    bl .shop_text_norm
    .shop_text_bros:
    sub r3, #0x8
    cmp r3, #0x1
    bge .shop_text_hand
    ;Insert hammer code here
    bl .shop_text_norm
    .shop_text_hand:
    add r3, #0x2
    mov r2, #0x4
    mul r3, r2
    ldr r1, =BROS_ITEM_SHOP_ARRAY
    ldr r1, [r1, r3]
    bl .shop_text_norm
    .shop_text_bean:
    sub r2, #0x2B
    mov r3, #0x4
    mul r2, r3
    ldr r1, =BEAN_ITEM_SHOP_ARRAY
    ldr r1, [r1, r2]
    .shop_text_norm:
    ldr r1, [r1]
    ldr r1, [r1]
    pop { r2, r3, r4, pc }
    .pool





    .org SHOP_DESC_SUBR
    push { r2, r3, r4, lr }
    ldr r2, =SHOP_DESC_RAM
    ldrb r2, [r2]
    cmp r2, #0x18
    ble .shop_desc_norm
    cmp r2, #0x30
    bge .shop_desc_key
    cmp r2, #0x2B
    bge .shop_desc_bean
    bl .shop_desc_norm
    .shop_desc_key:
    cmp r2, #0x9E
    bge .shop_desc_badge
    sub r2, #0x30
    mov r3, r2
    lsr r2, #0x4
    lsl r3, #0x1C
    lsr r3, #0x1C
    cmp r3, #0x8
    bge .shop_desc_bros
    mov r4, #0x8
    mul r2, r4
    mov r4, #0x4
    add r3, r2
    mul r3, r4
    ldr r1, =KEY_ITEM_SHOP_ARRAY
    ldr r1, [r1, r3]
    bl .shop_desc_norm
    .shop_desc_badge:
    sub r2, #0x9E
    ldr r3, =BADGE_SHOP_ARRAY
    mov r4, #0x4
    mul r2, r4
    ldr r1, [r3, r2]
    bl .shop_desc_norm
    .shop_desc_bros:
    sub r3, #0x8
    cmp r3, #0x1
    bge .shop_desc_hand
    ;Insert hammer code here
    bl .shop_desc_norm
    .shop_desc_hand:
    add r3, #0x2
    mov r2, #0x4
    mul r3, r2
    ldr r1, =BROS_ITEM_SHOP_ARRAY
    ldr r1, [r1, r3]
    bl .shop_desc_norm
    .shop_desc_bean:
    sub r2, #0x2B
    mov r3, #0x4
    mul r2, r3
    ldr r1, =BEAN_ITEM_SHOP_ARRAY
    ldr r1, [r1, r2]
    .shop_desc_norm:
    ldr r1, [r1]
    ldr r1, [r1, #0x4]
    pop { r2, r3, r4, pc }
    .pool







    .org DISPLAY_TEXTBOX
    push { r0-r2, r4, lr }
    mov r2, #0x0
    ldr r0, =TEXT_WRITING
    .display_loop:
    mov r1, #0x0
    strb r1, [r0, r2]
    add r2, #0x1
    cmp r2, #0x31
    beq .display_cont
    bl .display_loop
    .display_cont:
    ldr r1, =0xFF010BFF
    str r1, [r0]
    ldr r1, =0xFF41FF35
    str r1, [r0, #0x4]
    mov r1, #0x25
    strb r1, [r0, #0x8]
    mov r2, #0x9
    mov r4, #0x0
    .display_write_loop:
    ldrb r1, [r3, r4]
    cmp r1, #0x0
    beq .display_end
    strb r1, [r0, r2]
    add r4, #0x1
    add r2, #0x1
    bl .display_write_loop
    .display_end:
    mov r1, #0xFF
    strb r1, [r0, r2]
    mov r1, #0xC
    add r2, #0x1
    strb r1, [r0, r2]
    mov r1, #0x1E
    add r2, #0x1
    strb r1, [r0, r2]
    mov r1, #0xFF
    add r2, #0x1
    strb r1, [r0, r2]
    mov r1, #0x0A
    add r2, #0x1
    strb r1, [r0, r2]
    ldr r0, =TEXTBOX_STARTUP
    mov r1, #0x84
    strb r1, [r0]
    pop { r0-r2, r4, lr }
    .pool





        
    .org INTRO_FIX_SUBR
    push { r1, r2, lr }
    ldr r1, =ROOM
    ldrb r1, [r1, #0x1]
    cmp r1, #0x1
    beq .test_norm
    ldr r1, =0x02004AE0
    ldr r1, [r1]
    cmp r1, #0x0
    beq .test_skip
    ldr r1, =INTRO_RAM
    mov r2, #0x0
    strb r2, [r1]
    .test_skip:
    ldr r1, =INTRO_RAM
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .test_norm
    ldr r1, =0x03002486
    ldrb r2, [r1]
    cmp r2, #0x0
    beq .test_norm
    ldr r1, =0x02006C19
    ldrb r2, [r1]
    cmp r2, #0x0
    beq .test_norm
    mov r2, #0xD0
    strb r2, [r1]
    ldr r1, =0x02006C21
    mov r2, #0x20
    strb r2, [r1]
    ldr r1, =0x0200433C
    ldrb r1, [r1]
    mov r2, #0x10
    orr r2, r1
    ldr r1, =0x0200433C
    strb r2, [r1]
    ldr r1, =0x0200433E
    ldrb r1, [r1]
    mov r2, #0x18
    orr r2, r1
    ldr r1, =0x0200433E
    strb r2, [r1]
    ldr r1, =0x03002488
    mov r2, #0x50
    strb r2, [r1]
    ldr r1, =0x02006FB5
    ldr r1, [r1]
    cmp r1, #0x0
    beq .test_norm
    mov r2, #0xA0
    ldr r1, =0x02006FB5
    strb r2, [r1]
    ldr r1, =0x02006FBD
    mov r2, #0x20
    strb r2, [r1]
    ldr r1, =0x02006FB2
    mov r2, #0x0
    strb r2, [r1]
    ldr r1, =0x02006FB1
    mov r2, #0xC7
    strb r2, [r1]
    ldr r1, =0x02006C21
    cmp r1, #0x0
    bne .test_norm
    ldr r1, =0x02006C16
    mov r2, #0x0
    strb r2, [r1]
    ldr r1, =0x02006C15
    mov r2, #0xCF
    strb r2, [r1]
    ldr r1, =INTRO_RAM
    mov r2, #0x0
    strb r2, [r1]
    .test_norm:
    pop r1
    mov r1, r8
    add r1, #0x54
    pop { r2, pc }
    .pool


    .org BADGE_HANDLER
    push { r1-r3, lr }
    ldr r1, =0x0200433C
    ldrb r2, [r1]
    mov r3, #0x1
    orr r2, r3
    strb r2, [r1]
    ldr r1, =BADGE_FLAGS
    mov r2, #0x1
    strb r2, [r1]
    ldr r1, =0x02004913
    strb r2, [r1]
    ldr r1, =0x02004889
    strb r2, [r1]
    pop { r1-r3, pc }
    .pool


    .org MOVES_CHECK
    push { r0-r4, lr }
    ldr r1, =BADGE_FLAGS
    ldrb r2, [r1]
    cmp r2, #0xFF
    beq .badge_remove
    ldr r1, =0x0200433C ;Badge equip
    mov r2, #0x1
    ldrb r3, [r1]
    orr r3, r2
    strb r3, [r1]
    bl .badge_skip
    .badge_remove:
    ldr r1, =0x0200433C
    mov r2, #0x1
    ldrb r3, [r1]
    bic r3, r2
    strb r3, [r1]
    .badge_skip:
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x88
    beq .moves_end
    cmp r0, #0xD5
    bge .moves_check
    bl .moves_cont
    .moves_check:
    cmp r0, #0xDD
    ble .moves_end
    .moves_cont:
    ldr r0, =KEY_ITEM
    ldr r1, =BROS_OPTIONS
    ldrb r2, [r1]
    cmp r2, #0x1
    beq .pearl_check   
    ldrb r1, [r0]
    mov r2, #0x8
    and r2, r1
    cmp r2, #0x8
    beq .mini_add
    ldr r3, =HAMMER
    ldrb r4, [r3]
    mov r2, #0x80
    bic r4, r2
    strb r4, [r3]
    bl .green_check
    .mini_add:
    ldr r3, =HAMMER
    ldrb r4, [r3]
    mov r2, #0x80
    orr r4, r2
    strb r4, [r3]
    ldr r3, =0x0200489C
    ldrb r4, [r3]
    mov r2, #0x1
    orr r4, r2
    strb r4, [r3]
    .green_check:
    mov r2, #0x10
    and r2, r1
    cmp r2, #0x10
    beq .submerge_add
    ldr r3, =HAMMER
    ldrb r4, [r3]
    mov r2, #0x40
    bic r4, r2
    strb r4, [r3]
    bl .pearl_check
    .submerge_add:
    ldr r3, =HAMMER
    ldrb r4, [r3]
    mov r2, #0x40
    orr r4, r2
    strb r4, [r3]
    ldr r3, =0x02004860
    ldrb r4, [r3]
    mov r2, #0x1
    orr r4, r2
    strb r4, [r3]
    .pearl_check:
    ldr r1, =BROS_OPTIONS
    ldrb r1, [r1, #0x1]
    cmp r1, #0x1
    beq .moves_end
    ldrb r1, [r0, #0x1]
    mov r2, #0x20
    and r2, r1
    cmp r2, #0x20
    beq .fire_add
    ldr r3, =HAMMER
    ldrb r4, [r3, #0x1]
    mov r2, #0x4
    bic r4, r2
    strb r4, [r3, #0x1]
    ldr r3, =0x02004860
    ldrb r4, [r3]
    mov r2, #0x40
    bic r4, r2
    strb r4, [r3]
    bl .green_pearl_check
    .fire_add:
    ldr r3, =HAMMER
    ldrb r4, [r3, #0x1]
    mov r2, #0x4
    orr r4, r2
    strb r4, [r3, #0x1]
    ldr r3, =0x02004860
    ldrb r4, [r3]
    mov r2, #0x40
    orr r4, r2
    strb r4, [r3]
    .green_pearl_check:
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    beq .grab_add
    ldr r3, =HAMMER
    ldrb r4, [r3, #0x1]
    mov r2, #0x8
    bic r4, r2
    strb r4, [r3, #0x1]
    ldr r3, =0x0200489C
    ldrb r4, [r3]
    mov r2, #0x40
    bic r4, r2
    strb r4, [r3]
    bl .moves_end
    .grab_add:
    ldr r3, =HAMMER
    ldrb r4, [r3, #0x1]
    mov r2, #0x8
    orr r4, r2
    strb r4, [r3, #0x1]
    ldr r3, =0x0200489C
    ldrb r4, [r3]
    mov r2, #0x40
    orr r4, r2
    strb r4, [r3]
    .moves_end:
    pop { r0-r4, pc }
    .pool





    .org INTRO_SKIP_SUBR
    push { r1, r2, r3, lr }
    ldr r1, =INTRO_DISABLE
    ldrb r2, [r1]
    cmp r2, #0x1
    beq .skip_norm
    ldr r1, =ROOM
    ldrb r2, [r1]
    cmp r2, #0x60
    beq .skip2
    cmp r2, #0x66
    bne .disable
    .skip2:
    bl BADGE_HANDLER
    ldrb r2, [r1, #0x1]
    cmp r2, #0x1
    beq .skip_norm
    ldr r1, =0x08244F64
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .skip_norm
    ldrb r3, [r0]
    cmp r3, #0x60
    bne .skip_norm
    mov r3, #0x66
    strb r3, [r0]
    ldr r1, =INTRO_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .skip_norm
    .disable:
    ldr r1, =INTRO_DISABLE
    mov r2, #0x1
    strb r2, [r1]
    .skip_norm:
    ldr r1, =0x02004338
    mov r2, #0x6
    ldrb r3, [r1]
    orr r3, r2
    strb r3, [r1]
    pop r1
    mov r1, r9
    ldrb r0, [r1]
    pop { r2, r3, pc }
    .pool





        
    .org TEXT_MASH_SUBR
    push { r1, r2, lr }
    bl MOVES_CHECK
    bl SAVE_BLOCK
    ldr r1, =0x03000375
    ldrb r1, [r1]
    mov r2, #0x3
    and r2, r1
    cmp r2, #0x1
    blt .button_norm
    ldr r1, =0x03000374
    ldrb r1, [r1]
    mov r2, #0x1
    and r2, r1
    cmp r2, #0x1
    beq .button_sub
    mov r2, #0x1
    orr r5, r2
    bl .button_norm
    .button_sub:
    bic r5, r2
    .button_norm:
    add r3, #0x2
    add r6, #0x4
    pop { r1, r2, pc }
    .pool





    .org HAND_FIX_SUBR
    push { r1, r3, lr }
    mov r4, #0x0
    ldr r1, =HAMMER
    ldrb r1, [r1]
    mov r3, #0x8
    and r3, r1
    cmp r3, #0x0
    bne .hand_fix_norm
    ldr r1, =FRONT
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .luigi_fix 
    ldr r1, =MARIO_ACTION
    cmp r2, r1
    bne .hand_fix_norm
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .hand_fix_norm
    ldr r1, =HAMMER
    ldrb r1, [r1, #0x1]
    mov r3, #0x1
    and r3, r1
    cmp r3, #0x0
    beq .hand_fix_end
    cmp r0, #0x2
    beq .hand_fix_norm
    add r0, #0x2
    bl .hand_fix_end
    .luigi_fix:
    ldr r1, =LUIGI_ACTION
    cmp r2, r1
    bne .hand_fix_norm
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .hand_fix_norm
    ldr r1, =HAMMER
    ldrb r1, [r1, #0x1]
    mov r3, #0x2
    and r3, r1
    cmp r3, #0x0
    beq .hand_fix_end
    cmp r0, #0x2
    beq .hand_fix_norm
    add r0, #0x2
    bl .hand_fix_end
    .hand_fix_norm:
    add r0, #0x1
    .hand_fix_end:
    pop { r1, r3, pc }
    .pool





    .org HAND_FIX2_SUBR
    push { r4, r5, lr }
    ldr r4, =HAMMER
    cmp r1, r4
    bne .hand_fix_norm2
    ldr r4, =INPUT
    ldrb r4, [r4]
    cmp r4, #0x1
    bne .hand_fix_norm2
    ldr r4, =FRONT
    ldrb r4, [r4]
    cmp r4, #0x1
    beq .hand_fix_luigi
    ldr r4, =HAMMER
    ldrb r4, [r4, #0x1]
    mov r5, #0x1
    and r5, r4
    cmp r5, #0x0
    beq .hand_fix_norm2
    bl .hand_fix_norm1
    .hand_fix_luigi:
    ldr r4, =HAMMER
    ldrb r4, [r4, #0x1]
    mov r5, #0x2
    and r5, r4
    cmp r5, #0x0
    beq .hand_fix_norm2
    .hand_fix_norm1:
    mov r0, #0x1
    mov r3, #0x1
    bl .hand_fix_end2
    .hand_fix_norm2:
    lsr r0, r3
    add r3, r0, #0x0
    .hand_fix_end2:
    pop { r4, r5, pc }
    .pool





    .org TEXT_ITEM_BLOCK_SUBR
    push { r2, r3, lr }
    ldr r2, =TEXT_ITEM
    ldr r2, [r2]
    cmp r2, #0x0
    beq .block_norm
    bl .block_end
    .block_norm:
    ldr r2, =0x020048F0
    cmp r1, r2
    bne .block_skip
    ldr r2, =0x0200305F
    ldrb r3, [r2]
    cmp r3, #0x1
    bne .block_end
    .block_skip:
    add r0, r5
    strb r0, [r1]
    .block_end:
    ldr r2, =0x0200305F
    mov r3, #0x0
    strb r3, [r2]
    pop { r2, r3, pc }
    .pool





    .org KEY_ITEM_FIX_SUBR
    push { r2, r3, lr }
    asr r0, r0, #0x10
    and r0, r1
    cmp r0, #0x0
    bne .key_end
    ldr r2, =0x0200490A
    cmp r6, r2
    bne .key_cont
    cmp r4, #0x2
    bne .key_stop
    bl ROSE_FIX
    bl .key_stop
    .key_cont:
    ldr r2, =0x0200490D
    cmp r6, r2
    beq .key_bean1
    ldr r2, =0x0200490E
    cmp r6, r2
    beq .key_bean2
    bl .key_stop
    .key_bean1:
    cmp r4, #0x10
    bgt .key_end
    bl .key_stop
    .key_bean2:
    cmp r4, #0x1
    bne .key_end
    bl .key_stop
    .key_stop:
    ldr r6, =0x02000E10
    .key_end:
    pop { r2, r3, pc }
    .pool





    .org ROSE_FIX
    push { r0, r1, r2, r3, lr }
    ldr r0, =0x081E9430
    ldrb r0, [r0]
    cmp r0, #0x30
    blt .rose_norm
    cmp r0, #0x9E
    bge .rose_badge
    sub r0, #0x30
    mov r1, r0
    lsr r0, #0x4
    lsl r1, #0x1C
    lsr r1, #0x1C
    cmp r1, #0x7
    bgt .rose_bros
    ldr r2, =KEY_ITEM
    mov r3, #0x1
    lsl r3, r1
    ldrb r4, [r2, r0]
    orr r4, r3
    strb r4, [r2, r0]
    lsl r0, #0x3
    add r0, r1
    lsl r0, #0x2
    ldr r1, =KEY_ITEM_TEXT_ARRAY
    ldr r3, [r1, r0]
    add r3, #0x1
    bl .rose_end
    .rose_badge:
    sub r0, #0x9E
    cmp r0, #0x2C
    bgt .rose_pants
    bl BADGE_ADD
    lsl r0, #0x2
    ldr r1, =BADGE_BOX_ARRAY
    ldr r3, [r1, r0]
    add r3, #0x1
    bl .rose_end
    .rose_pants:
    cmp r0, #0x5A
    bge .rose_special
    mov r1, r0
    bl PANTS_ADD
    lsl r1, #0x2
    ldr r2, =BADGE_BOX_ARRAY
    ldr r3, [r2, r1]
    add r3, #0x1
    bl .rose_end
    .rose_special:
    mov r1, r0
    bl SPECIAL_ADD
    lsl r1, #0x2
    ldr r2, =BADGE_BOX_ARRAY
    ldr r3, [r2, r1]
    add r3, #0x1
    bl .rose_end
    .rose_bros:
    cmp r1, #0x8
    bne .rose_hand
    ldr r0, =HAMMER
    ldrb r2, [r1]
    and r1, r2
    cmp r1, #0x0
    bne .rose_super
    mov r1, #0x8
    orr r2, r1
    strb r2, [r0]
    ldr r3, =HAMMER_TEXT
    bl .rose_end
    .rose_super:
    mov r1, #0x10
    and r1, r2
    cmp r1, #0x0
    bne .rose_ultra
    mov r1, #0x10
    orr r2, r1
    strb r2, [r0]
    ldr r3, =SUPER_HAMMER_TEXT
    bl .rose_end
    .rose_ultra:
    mov r1, #0x20
    orr r2, r1
    strb r2, [r0]
    ldr r3, =ULTRA_HAMMER_TEXT
    bl .rose_end
    .rose_hand:
    sub r1, #0x8
    ldr r0, =HAMMER
    ldrb r2, [r0, #0x1]
    orr r2, r1
    strb r2, [r0, #0x1]
    cmp r1, #0x1
    bne .rose_thunder
    ldr r3, =FIRE_TEXT
    bl .rose_end
    .rose_thunder:
    ldr r3, =THUNDER_TEXT
    bl .rose_end
    .rose_norm:
    cmp r0, #0x1C
    bge .rose_espresso
    sub r0, #0xa
    ldr r1, =MUSHROOM
    ldrb r2, [r1, r0]
    cmp r2, #0xFF
    beq .rose_clause
    add r2, #0x1
    strb r2, [r1, r0]
    bl .rose_norm_text
    .rose_clause:
    mov r2, #0x1
    strb r2, [r1, r0]
    .rose_norm_text:
    ldr r1, =KEY_ITEM_NORM_ARRAY
    lsl r0, #0x2
    ldr r3, [r1, r0]
    bl .rose_end
    .rose_espresso:
    sub r0, #0x1C
    ldr r1, =ESPRESSO
    ldrb r2, [r1, r0]
    cmp r2, #0xFF
    beq .rose_clause2
    add r2, #0x1
    strb r2, [r1, r0]
    bl .rose_espresso_text
    .rose_clause2:
    mov r2, #0x1
    strb r2, [r1, r0]
    .rose_espresso_text:
    cmp r0, #0xF
    bge .rose_bean_text
    lsl r0, #0x2
    ldr r1, =KEY_ITEM_ESPRESSO_ARRAY
    ldr r3, [r1, r0]
    bl .rose_end
    .rose_bean_text:
    sub r0, #0xF
    lsl r0, #0x2
    ldr r1, =KEY_ITEM_BEAN_ARRAY
    ldr r3, [r1, r0]
    .rose_end:
    bl DISPLAY_TEXTBOX
    pop { r0, r1, r2, r3, pc }
    .pool





    .org DOOR_SUBR
    
    push { r0, r1, r6, lr }
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x36
    beq .castle_door
    cmp r0, #0x79
    beq .dress_door
    cmp r0, #0x90
    beq .beanstar_door
    bl .end2

    .dress_door:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    bne .end2
    ldr r0, =DRESS_DOOR
    cmp r1, r0
    beq .end2
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x1]
    mov r6, #0x4
    and r0, r6
    cmp r0, #0x0
    bne .end2
    mov r3, #0xFF
    bl .end3

    .beanstar_door:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    bne .end2
    ldr r0, =BEANSTAR_DOOR
    cmp r1, r0
    beq .end2
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x1]
    mov r6, #0x8
    and r0, r6
    cmp r0, #0x0
    bne .end2
    mov r3, #0xFF
    bl .end3

    .castle_door:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    beq .end2
    ldr r0, =KEY_ITEM
    ldrb r0, [r0]
    mov r6, #0x2
    and r0, r6
    cmp r0, #0x0
    bne .end2
    mov r3, #0xFF
    bl .end3
 
    .end2:
    ldrb r3, [r1]
    .end3:
    add r4, r3, #0x0
    ldr r0, =QUEEN
    ldrb r0, [r0]
    mov r6, #0x40
    and r0, r6
    cmp r0, #0x40
    bne .end4
    ldr r0, =PEACH_BUFFER
    mov r6, #0x1
    strb r6, [r0]
    .end4:
    pop { r0, r1, r6, pc }
    .pool







    .org EVENT_BLOCKER_SUBR

    push { r1, lr }
    ldr r1, =ROOM
    ldrb r1, [r1]
    cmp r1, #0x36
    beq .castle_block
    cmp r1, #0x88
    beq .chalice_block
    cmp r1, #0x41
    beq .peach_block
    cmp r1, #0x5A
    beq .hammer_tut_block
    cmp r1, #0x2
    beq .chuckle_block
    b .unblock

    .chuckle_block:
    ldr r0, =0x082FBEC2
    cmp r0, r2
    bne .unblock
    ldr r0, =HAMMER
    ldrb r0, [r0]
    mov r1, #0x48
    and r1, r0
    cmp r1, #0x48
    beq .unblock
    mov r0, #0x00
    bl .end

    .chalice_block:
    ldr r0, =BROS_OPTIONS
    ldrb r0, [r0]
    cmp r0, #0x1
    beq .unblock
    mov r0, #0x0
    bl .end

    .hammer_tut_block:
    mov r0, #0xFF
    bl .end

    .castle_block:
    ldr r1, =ROOM
    ldrb r1, [r1, #0x1]
    cmp r1, #0x1
    beq .unblock
    ldr r1, =0x082FC170
    cmp r2, r1
    beq .cblock
    ldr r1, =0x082FC191
    cmp r2, r1
    beq .cblock
    bl .unblock
    .cblock:
    mov r0, #0xFF
    bl .end

    .peach_block:
    ldr r0, =PEACH_RAM
    ldrb r0, [r0]
    cmp r0, #0x1
    beq .unblock
    mov r0, #0xFF
    bl .end

    .unblock:
    ldrb r0, [r2]
    .end:
    lsl r4, r0, #0x4
    pop { r1, pc }
    .pool






    .org ABILITY_BLOCK_SUBR
    push { r0, r1, r2, r3, r4, lr }
    ldr r2, =HAMMER
    cmp r2, r5
    bne .scroll_check
    ldr r1, =0x300
    cmp r0, r1
    bgt .ability_norm
    mov r1, #0x38
    and r1, r0
    cmp r1, #0x0
    beq .cont_check
    ldr r1, =AB_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .cont_check
    .scroll_check:
    ldr r0, =0x0200434C
    cmp r0, r5
    bne .ability_norm
    sub r4, #0xA0
    .cont_check:
    ldr r0, =TEXT_VAR
    sub r4, r0
    ldr r0, =ABILITY_STORAGE
    add r0, r4
    ldrb r0, [r0]
    cmp r0, #0x30
    bge .ability_key
    cmp r0, #0x2B
    beq .hoo_ability
    cmp r0, #0x2C
    bne .bean_ability
    ldr r1, =CHUCKLE_TEXT
    ldr r1, [r1]
    ldr r2, =HAND_TEXT_RAM
    str r1, [r2]
    ldr r1, =BEAN_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .bean_ability
    .hoo_ability:
    ldr r1, =HOO_TEXT
    ldr r1, [r1]
    ldr r2, =HAND_TEXT_RAM
    str r1, [r2]
    ldr r1, =BEAN_RAM
    mov r2, #0x1
    strb r2, [r1]
    .bean_ability:
    cmp r0, #0x0
    beq .ability_norm
    sub r0, #0xA
    ldr r1, =MUSHROOM
    add r1, r0
    ldrb r2, [r1]
    cmp r2, #0xFF
    beq .ability_clause
    add r2, #0x1
    strb r2, [r1]
    bl .ability_text
    .ability_clause:
    mov r3, #0x1
    strb r3, [r1]
    .ability_text:
    ldr r1, =BEAN_RAM
    ldrb r1, [r1]
    cmp r1, #0x1
    beq .ability_norm
    mov r2, #0x4
    mul r0, r2
    ldr r1, =HAND_TEXT_RAM
    ldr r3, =ITEM_TEXTBOX_ARRAY
    add r3, r0
    ldr r3, [r3]
    str r3, [r1]
    bl .ability_norm
    .ability_key:
    cmp r0, #0x9E
    bge .ability_badge
    sub r0, #0x30
    mov r1, r0
    lsr r0, #0x4
    lsl r1, #0x1C
    lsr r1, #0x1C
    cmp r1, #0x7
    ble .ability_key_norm
    sub r1, #0x7
    add r1, #0x40
    ldr r2, =BROS_RAM
    strb r1, [r2]
    bl BROS_ITEM_SUBR
    bl .ability_end
    .ability_badge:
    sub r0, #0x9E
    ldr r2, =BADGE_TEXT_ARRAY
    mov r3, #0x4
    mul r3, r0
    ldr r2, [r2, r3]
    ldr r3, =HAND_TEXT_RAM
    str r2, [r3]
    cmp r0, #0x2C
    bge .ability_pants
    bl BADGE_ADD
    bl .ability_norm
    .ability_pants:
    cmp r0, #0x5A
    bge .ability_special
    bl PANTS_ADD
    bl .ability_norm
    .ability_special:
    bl SPECIAL_ADD
    bl .ability_norm
    .ability_key_norm:
    mov r4, #0x1
    lsl r4, r1
    ldr r2, =KEY_ITEM
    add r2, r0
    ldrb r3, [r2]
    orr r3, r4
    strb r3, [r2]
    mov r4, #0x4
    mov r3, #0x8
    mul r0, r3
    add r0, r1
    mul r0, r4
    ldr r2, =KEY_TEXTBOX_ARRAY
    add r2, r0
    ldr r2, [r2]
    ldr r1, =HAND_TEXT_RAM
    str r2, [r1]
    .ability_norm:
    pop { r0, r1 }
    ldr r2, =AB_RAM
    ldrb r3, [r2]
    mov r4, #0x0
    strb r4, [r2]
    cmp r3, #0x1
    beq .ability_end2
    orr r1, r0
    str r1, [r5]
    bl .ability_end2
    .ability_end:
    pop { r0, r1 }
    .ability_end2:
    ldr r2, =BEAN_RAM
    mov r3, #0x0
    strb r3, [r2]
    pop { r2, r3, r4, pc }
    .pool






    .org TEXT_KEY_ITEM
    push { r0, r1, r2, r3, r4, lr }
    ldr r2, =TEXT_RAM
    add r0, #0x1
    strb r0, [r2]
    cmp r0, #0x9F
    bge .kit_badge
    sub r0, #0x31
    mov r1, r0
    lsr r0, #0x4
    lsl r1, #0x1C
    lsr r1, #0x1C
    cmp r1, #0x7
    ble .kit_key
    sub r1, #0x7
    add r1, #0x20
    ldr r2, =BROS_RAM
    strb r1, [r2]
    bl BROS_ITEM_SUBR
    bl .kit_end
    .kit_badge:
    sub r0, #0x9F
    cmp r0, #0x2C
    bge .kit_pants
    bl BADGE_ADD
    bl .kit_end
    .kit_pants:
    cmp r0, #0x5A
    bge .kit_special
    bl PANTS_ADD
    bl .kit_end
    .kit_special:
    bl SPECIAL_ADD
    bl .kit_end
    .kit_key:
    mov r4, #0x1
    lsl r4, r1
    ldr r2, =KEY_ITEM
    add r2, r0
    ldrb r3, [r2]
    orr r3, r4
    strb r3, [r2]
    .kit_end:
    pop { r0, r1, r2, r3, r4, pc }
    .pool





    .org TEXT_ITEM_SUBR
    push { r0, r1, r3, lr }
    ldr r0, =TEXT_ITEM
    ldr r0, [r0]
    cmp r0, #0x0
    beq .text_end
    ldr r3, =TEXT_VAR
    sub r0, r3
    cmp r0, #0x30
    blt .key_skip
    bl TEXT_KEY_ITEM
    bl .text_end
    .key_skip:
    cmp r0, #0x2B
    beq .bean_item
    cmp r0, #0x2C
    beq .bean_item
    sub r0, #0xA
    add r0, #0x1
    ldr r3, =TEXT_RAM
    strb r0, [r3]
    sub r0, #0x1
    ldr r1, =MUSHROOM
    add r1, r0
    ldrb r0, [r1]
    cmp r0, #0xFF
    bne .norm_text
    mov r0, #0x1
    strb r0, [r1]
    bl .text_end
    .bean_item:
    add r0, #0x1
    ldr r3, =TEXT_RAM
    strb r0, [r3]
    sub r0, #0xB
    ldr r1, =MUSHROOM
    add r1, r0
    ldrb r0, [r1]
    cmp r0, #0xFF
    bne .norm_text
    mov r0, #0x1
    strb r0, [r1]
    bl .text_end
    .norm_text:
    ldrb r0, [r1]
    add r0, #0x1
    strb r0, [r1]
    .text_end:
    pop { r0, r1, r3, pc }
    .pool







    .org TEXTBOX_REPLACE_SUBR
    push { r1, r2, r3, r4, lr }
    mov r4, #0x8
    mov r3, #0x4
    ldr r1, =TEXT_RAM
    ldr r1, [r1]
    cmp r1, #0x0
    beq .textbox_norm
    cmp r1, #0xFF
    bgt .textbox_norm
    cmp r1, #0x31
    blt .replace_norm
    cmp r1, #0x9F
    bge .textbox_badge
    sub r1, #0x31
    mov r2, r1
    lsr r1, #0x4
    lsl r2, #0x1C
    lsr r2, #0x1C
    cmp r2, #0x7
    bgt .replace_bros
    mul r1, r4
    add r1, r2
    mul r1, r3
    ldr r3, =KEY_TEXTBOX_ARRAY
    add r3, r1
    ldr r3, [r3]
    ldr r4, =TEXT_RAM
    str r3, [r4]
    bl .textbox_norm
    .textbox_badge:
    sub r1, #0x9F
    ldr r2, =BADGE_TEXT_ARRAY
    mov r3, #0x4
    mul r3, r1
    ldr r2, [r2, r3]
    ldr r3, =TEXT_RAM
    str r2, [r3]
    bl .textbox_norm
    .replace_bros:
    ldr r3, =BROS_TEXTBOX_ARRAY
    cmp r2, #0x8
    beq .hammer_textbox
    sub r2, #0x8
    mul r2, r3
    add r3, r2
    add r3, #0x10
    ldr r3, [r3]
    ldr r4, =TEXT_RAM
    str r3, [r4]
    ldr r4, =KEY_ITEM_RAM
    mov r3, #0x0
    str r3, [r4]
    bl .textbox_norm
    .hammer_textbox:
    ldr r2, =HAMMER_RAM
    ldrb r2, [r2]
    sub r2, #0x1
    mul r2, r3
    add r3, r2
    ldr r3, [r3]
    ldr r4, =TEXT_RAM
    str r3, [r4]
    ldr r4, =KEY_ITEM_RAM
    mov r3, #0x0
    str r3, [r4]
    bl .textbox_norm
    .replace_norm:
    sub r1, #0x1
    cmp r1, #0x2B
    bne .chuckle
    ldr r2, =HOO_TEXT
    ldr r2, [r2]
    bl .bean
    .chuckle:
    cmp r1, #0x2C
    bne .bean_skip
    ldr r2, =CHUCKLE_TEXT
    ldr r2, [r2]
    bl .bean
    .bean_skip:
    ldr r2, =ITEM_TEXTBOX_ARRAY
    mov r3, #0x4
    mul r1, r3
    add r2, r1
    ldr r2, [r2]
    .bean:
    ldr r1, =TEXT_RAM
    str r2, [r1]
    .textbox_norm:
    pop { r1, r2, r3, r4, pc }
    .pool





     .org HAMMER_TEXT_SUBR
     push { r0, r1, r2, r3, lr }
     ldr r0, =0x081E9400
     ldr r1, =HAMMER_TEXT_RAM
     ldrb r1, [r1]
     ldrb r0, [r0, r1]
     cmp r0, #0x30
     bge .hammer_text_key
     cmp r0, #0x2B
     beq .hoo_hammer
     cmp r0, #0x2C
     bne .skip_hammer
     ldr r1, =CHUCKLE_TEXT
     ldr r1, [r1]
     ldr r0, =HAND_TEXT_RAM
     str r1, [r0]
     bl .hammer_text_end
     .hoo_hammer:
     ldr r1, =HOO_TEXT
     ldr r1, [r1]
     ldr r0, =HAND_TEXT_RAM
     str r1, [r0]
     bl .hammer_text_end
     .skip_hammer:
     sub r0, #0xa
     mov r2, #0x4
     mul r0, r2
     ldr r1, =ITEM_TEXTBOX_ARRAY
     ldr r1, [r1, r0]
     ldr r0, =HAND_TEXT_RAM
     str r1, [r0]
     bl .hammer_text_end
     .hammer_text_key:
     cmp r0, #0x9E
     bge .hammer_text_badge
     sub r0, #0x30
     mov r1, r0
     lsr r0, #0x4
     lsl r1, #0x1C
     lsr r1, #0x1C
     cmp r1, #0x7
     bgt .hammer_text_bros
     mov r2, #0x4
     mov r3, #0x8
     mul r0, r3
     add r0, r1
     mul r0, r2
     ldr r2, =KEY_TEXTBOX_ARRAY
     ldr r2, [r2, r0]
     ldr r1, =HAND_TEXT_RAM
     str r2, [r1]
     bl .hammer_text_end
     .hammer_text_badge:
     sub r0, #0x9E
     ldr r2, =BADGE_TEXT_ARRAY
     mov r3, #0x4
     mul r3, r0
     ldr r2, [r2, r3]
     ldr r3, =HAND_TEXT_RAM
     str r2, [r3]
     bl .hammer_text_end
     .hammer_text_bros:
     ldr r0, =BROS_TEXTBOX_ARRAY
     sub r1, #0x8
     mov r2, #0x4
     cmp r1, #0x0
     bne .hammer_hand
     ldr r1, =HAMMER_RAM
     ldrb r1, [r1]
     mul r1, r2
     ldr r0, [r0, r1]
     ldr r1, =HAND_TEXT_RAM
     str r0, [r1]
     bl .hammer_text_end
     .hammer_hand:
     add r1, #0x2
     mul r1, r2
     ldr r0, [r0, r1]
     ldr r1, =HAND_TEXT_RAM
     str r0, [r1]
     .hammer_text_end:
     pop { r0, r1, r2, r3, pc }
     .pool







    .org TEXT_ITEM_INJECT_SUBR
    push { r1, r2, lr }
    ldr r1, =0x084F3784
    cmp r7, r1
    beq .inject_norm2
    ldr r1, =0x084F3798
    cmp r7, r1
    bne .star_check
    ldr r1, =ROOM
    ldrb r1, [r1]
    cmp r1, #0xA4
    bne .star_check
    ldr r1, =0x081E9431
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .inject_cont
    .star_check:
    ldr r1, =0x084ECDE4
    cmp r7, r1
    bne .dress_check
    ldr r1, =0x081E9432
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .inject_cont
    .dress_check:
    ldr r1, =0x084ECDF8
    cmp r7, r1
    bne .badge_check
    ldr r1, =0x081E9433
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .inject_cont
    .badge_check:
    ldr r1, =0x084F2ADC
    cmp r7, r1
    bne .badge_check2
    ldr r1, =0x081E9434
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .inject_cont
    .badge_check2:
    ldr r1, =0x084F230C
    cmp r7, r1
    bne .badge_check3
    ldr r1, =0x081E9435
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .inject_cont
    .inject_norm2:
    bl .inject_norm
    .badge_check3:
    ldr r1, =0x084F2A50
    cmp r7, r1
    bne .inject_cont
    ldr r1, =0x081E9436
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    .inject_cont:
    ldr r1, =0x084F361C
    cmp r1, r7
    bne .spangle_skip
    ldr r1, =0x081E9437
    ldrb r2, [r1]
    ldr r1, =TEXT_VAR
    add r2, r1
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    .spangle_skip:
    ldr r1, =0x084EB020
    cmp r1, r7
    bne .chalice_skip
    ldr r1, =0x081E943E
    ldrb r1, [r1]
    ldr r2, =TEXT_VAR
    add r1, r2
    ldr r2, =TEXT_ITEM
    str r1, [r2]
    ldr r1, =FRUIT_REMOVE_RAM
    mov r2, #0x1
    strb r2, [r1]
    .chalice_skip:
    ldr r1, =0x084EB110
    cmp r1, r7
    bne .white_text
    ldr r1, =0x08250621
    ldrb r1, [r1]
    ldr r2, =TEXT_VAR
    add r1, r2
    ldr r2, =TEXT_ITEM
    str r1, [r2]
    ldr r2, =FRUIT_REMOVE_RAM
    mov r1, #0x1
    strb r1, [r2]
    .white_text:
    ldr r1, =0x084EB0FC
    cmp r1, r7
    bne .no_fruit
    ldr r1, =0x0824FF18
    ldrb r1, [r1]
    ldr r2, =TEXT_VAR
    add r1, r2
    ldr r2, =TEXT_ITEM
    str r1, [r2]
    ldr r2, =FRUIT_REMOVE_RAM
    mov r1, #0x1
    strb r1, [r2]
    .no_fruit:
    bl TEXT_ITEM_SUBR
    bl TEXTBOX_REPLACE_SUBR
    ldr r1, =THUNDER_TEXTBOX
    cmp r1, r7
    beq .hand_box
    ldr r1, =FIRE_TEXTBOX
    cmp r1, r7
    beq .hand_box
    ldr r1, =HAMMER_TEXTBOX
    cmp r1, r7
    beq .hammer_box
    ldr r1, =SHAMMER_TEXTBOX
    cmp r1, r7
    beq .shammer_box
    ldr r1, =UHAMMER_TEXTBOX
    cmp r1, r7
    beq .uhammer_box
    ldr r1, =SCROLL_TEXT1
    cmp r1, r7
    beq .hand_box
    ldr r1, =SCROLL_TEXT2
    cmp r1, r7
    beq .hand_box
    bl .inject_check
    .hammer_box:
    ldr r1, =HAMMER_TEXT_RAM
    mov r0, #0x3
    strb r0, [r1]
    bl HAMMER_TEXT_SUBR
    bl .hand_box
    .shammer_box:
    ldr r1, =HAMMER_TEXT_RAM
    mov r0, #0x4
    strb r0, [r1]
    bl HAMMER_TEXT_SUBR
    bl .hand_box
    .uhammer_box:
    ldr r1, =HAMMER_TEXT_RAM
    mov r0, #0x5
    strb r0, [r1]
    bl HAMMER_TEXT_SUBR
    .hand_box:
    ldr r2, =HAND_TEXT_RAM
    ldr r0, [r2]
    mov r1, #0x0
    str r1, [r2]
    bl .inject_end

    .inject_check:
    ldr r2, =TEXT_RAM
    ldr r1, [r2]
    cmp r1, #0x0
    beq .inject_norm
    mov r0, r1
    mov r1, #0x0
    str r1, [r2]
    ldr r1, =FRUIT_REMOVE_RAM
    ldrb r2, [r1]
    cmp r2, #0x1
    bne .inject_end
    mov r2, #0x0
    strb r2, [r1]
    ldr r1, =TEXT_ITEM
    str r2, [r1]
    b .inject_end
    .inject_norm:
    add r0, r0, r7
    ldr r0, [r0]
    .inject_end:
    pop { r1, r2, pc }
    .pool






    .org BROS_ITEM_SUBR
    push lr
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF
    and r1, r0
    cmp r1, #0x0
    beq .bros_end2
    cmp r1, #0x1
    beq .hammer_drop
    cmp r1, #0x2
    beq .fire_drop
    cmp r1, #0x3
    beq .thunder_drop
    bl .bros_end

    .hammer_drop:
    ldr r0, =HAMMER
    ldrb r1, [r0]
    mov r2, #0x8
    and r2, r1
    cmp r2, #0x0
    bne .super_check
    mov r2, #0x8
    ldrb r1, [r0]
    orr r1, r2
    strb r1, [r0]
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF0
    and r1, r0
    cmp r1, #0x10
    bne .thammer_box
    ldr r1, =BROS_ITEM_BUFFER
    ldr r0, =HAMMER_TEXT
    sub r0, #0x1
    str r0, [r1]
    bl .bros_item_textbox
    .thammer_box:
    ldr r0, =BROS_ITEM_BUFFER
    ldr r1, =BROS_TEXTBOX_ARRAY
    ldr r1, [r1]
    str r1, [r0]
    bl .bros_item_textbox

    .super_check:
    ldr r0, =HAMMER
    ldrb r1, [r0]
    mov r2, #0x10
    and r2, r1
    cmp r2, #0x0
    bne .ultra_check
    ldrb r1, [r0]
    mov r2, #0x10
    orr r1, r2
    strb r1, [r0]
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF0
    and r1, r0
    cmp r1, #0x10
    bne .tshammer_box
    ldr r1, =BROS_ITEM_BUFFER
    ldr r0, =SUPER_HAMMER_TEXT
    sub r0, #0x1
    str r0, [r1]
    bl .bros_item_textbox
    .tshammer_box:
    ldr r0, =BROS_ITEM_BUFFER
    ldr r1, =BROS_TEXTBOX_ARRAY
    ldr r1, [r1, #0x4]
    str r1, [r0]
    bl .bros_item_textbox

    .bros_end2:
    bl .bros_end

    .ultra_check:
    ldr r0, =HAMMER
    ldrb r1, [r0]
    mov r2, #0x20
    ldrb r1, [r0]
    orr r1, r2
    strb r1, [r0]
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF0
    and r1, r0
    cmp r1, #0x10
    bne .tuhammer_box
    ldr r1, =BROS_ITEM_BUFFER
    ldr r0, =ULTRA_HAMMER_TEXT
    sub r0, #0x1
    str r0, [r1]
    bl .bros_item_textbox
    .tuhammer_box:
    ldr r0, =BROS_ITEM_BUFFER
    ldr r1, =BROS_TEXTBOX_ARRAY
    ldr r1, [r1, #0x8]
    str r1, [r0]
    bl .bros_item_textbox

    .fire_drop:
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0, #0x1]
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF0
    and r1, r0
    cmp r1, #0x10
    bne .fire_box
    ldr r1, =BROS_ITEM_BUFFER
    ldr r0, =FIRE_TEXT
    sub r0, #0x1
    str r0, [r1]
    bl .bros_item_textbox
    .fire_box:
    ldr r0, =BROS_ITEM_BUFFER
    ldr r1, =BROS_TEXTBOX_ARRAY
    ldr r1, [r1, #0xC]
    str r1, [r0]
    bl .bros_item_textbox

    .thunder_drop:
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0, #0x1]
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF0
    and r1, r0
    cmp r1, #0x10
    bne .thunder_box
    ldr r1, =BROS_ITEM_BUFFER
    ldr r0, =THUNDER_TEXT
    sub r0, #0x1
    str r0, [r1]
    bl .bros_item_textbox
    .thunder_box:
    ldr r0, =BROS_ITEM_BUFFER
    ldr r1, =BROS_TEXTBOX_ARRAY
    ldr r1, [r1, #0x10]
    str r1, [r0]

    .bros_item_textbox:
    ldr r0, =BROS_RAM
    ldrb r1, [r0]
    mov r2, #0xF0
    and r2, r1 
    mov r1, #0x0
    strb r1, [r0]
    cmp r2, #0x10
    bne .textbox_check
    ldr r1, =KEY_ITEM_RAM
    ldr r2, =BROS_ITEM_BUFFER
    ldr r2, [r2]
    str r2, [r1]
    bl .bros_end
    .textbox_check:
    cmp r2, #0x20
    bne .hand_box_check
    ldr r1, =TEXT_RAM
    ldr r2, =BROS_ITEM_BUFFER
    ldr r2, [r2]
    str r2, [r1]
    .hand_box_check:
    ldr r1, =HAND_TEXT_RAM
    ldr r2, =BROS_ITEM_BUFFER
    ldr r2, [r2]
    str r2, [r1]


    .bros_end:
    ldr r0, =BROS_RAM
    mov r1, #0x0
    strb r1, [r0]
    pop pc
    .pool





    .org KEY_ITEM_B_SUBR
    push { r1-r5, lr }
    cmp r0, #0x9E
    bge .kib_badge
    mov r1, #0x30
    cmp r0, r1
    bge .kib_keyitem
    mov r1, #0x20
    cmp r0, r1
    bge .kib_expresso
    cmp r0, #0x18
    bne .kib_end
    ldr r1, =0x0200305F
    mov r2, #0x1
    strb r2, [r1]
    bl .kib_end
    .kib_badge:
    sub r0, #0x9E
    cmp r0, #0x2C
    bge .kib_pants
    bl BADGE_ADD
    ldr r1, =KEY_ITEM_RAM
    ldr r2, =BADGE_BOX_ARRAY
    mov r3, #0x4
    mul r3, r0
    ldr r2, [r2, r3]
    str r2, [r1]
    mov r0, #0x18
    bl .kib_end
    .kib_pants:
    cmp r0, #0x5A
    bge .kib_special
    bl PANTS_ADD
    ldr r1, =KEY_ITEM_RAM
    ldr r2, =BADGE_BOX_ARRAY
    mov r3, #0x4
    mul r3, r0
    ldr r2, [r2, r3]
    str r2, [r1]
    mov r0, #0x18
    bl .kib_end
    .kib_special:
    bl SPECIAL_ADD
    ldr r1, =KEY_ITEM_RAM
    ldr r2, =BADGE_BOX_ARRAY
    mov r3, #0x4
    mul r3, r0
    ldr r2, [r2, r3]
    str r2, [r1]
    mov r0, #0x18
    bl .kib_end
    .kib_keyitem:
    sub r0, r1
    mov r1, r0
    lsr r0, #0x4
    lsl r1, #0x1C
    lsr r1, #0x1C
    cmp r1, #0x7
    ble .kib_key
    sub r1, #0x7
    add r1, #0x10
    ldr r2, =BROS_RAM
    strb r1, [r2]
    bl BROS_ITEM_SUBR
    mov r0, #0x18
    bl .kib_end
    .kib_key:
    mov r4, #0x1
    lsl r4, r1
    ldr r2, =KEY_ITEM
    add r2, r0
    ldrb r3, [r2]
    orr r3, r4
    strb r3, [r2]
    mov r4, #0x4
    mov r5, #0x8
    mul r0, r5
    add r0, r1
    mul r0, r4
    ldr r5, =KEY_ITEM_TEXT_ARRAY
    ldr r5, [r5, r0]
    ldr r4, =KEY_ITEM_RAM
    str r5, [r4]
    mov r0, #0x18
    bl .kib_end
    .kib_expresso:
    sub r0, 0x20
    ldr r1, =ESPRESSO
    ldrb r2, [r1, r0]
    cmp r2, #0xFF
    beq .kib_clause
    add r2, #0x1
    strb r2, [r1, r0]
    bl .kib_text
    .kib_clause:
    mov r2, #0x1
    strb r2, [r1, r0]
    .kib_text:
    ldr r1, =ESPRESSO_TEXT
    mov r2, #0x4
    mul r0, r2
    ldr r1, [r1, r0]
    ldr r0, =KEY_ITEM_RAM
    str r1, [r0]
    mov r0, 0x18
    .kib_end:
    pop { r1-r5 }
    lsl r0, r0, #0x10
    lsr r4, r0, #0x10
    pop pc 
    .pool





    .org EGG_CHECK
    push { r0, r1, r2, r3, lr }
    mov r0, #0x0
    ldr r1, =KEY_ITEM
    ldrb r2, [r1, #0x2]
    mov r3, #0x40
    and r3, r2
    cmp r3, #0x0
    beq .egg_skip1
    add r0, #0x1
    .egg_skip1:
    mov r3, #0x80
    and r3, r2
    cmp r3, #0x0
    beq .egg_skip2
    add r0, #0x1
    .egg_skip2:
    ldrb r2, [r1, #0x3]
    mov r3, #0x1
    and r3, r2
    cmp r3, #0x0
    beq .egg_skip3
    add r0, #0x1
    .egg_skip3:
    mov r3, #0x2
    and r3, r2
    cmp r3, #0x0
    beq .egg_skip4
    add r0, #0x1
    .egg_skip4:
    mov r3, #0x4
    and r3, r2
    cmp r3, #0x0
    beq .egg_skip5
    add r0, #0x1
    .egg_skip5:
    mov r3, #0x8
    and r3, r2
    cmp r3, #0x0
    beq .egg_skip6
    add r0, #0x1
    .egg_skip6:
    mov r3, #0x10
    and r3, r2
    cmp r3, #0x0
    beq .egg_end
    add r0, #0x1
    .egg_end:
    ldr r1, =EGG_VALUE
    ldr r2, =0x02004740
    ldrb r2, [r2]
    add r2, r0
    cmp r2, #0x7
    ble .egg_norm
    mov r2, #0x7
    .egg_norm:
    strb r2, [r1]
    pop { r0, r1, r2, r3, pc }
    .pool






    .org KEY_ITEM_TEXTBOX
    push { r1, r2, lr }
    ldr r2, =KEY_ITEM_RAM
    ldr r2, [r2]
    cmp r2, #0x0
    beq .normtext
    mov r4, r2
    .normtext:
    mov r1, #0x0
    ldr r2, =KEY_ITEM_RAM
    str r1, [r2]
    pop { r1, r2 }
    mov r1, #0xC7
    lsl r1, r1, #0x2
    pop pc 
    .pool







    .org TREE_BLOCK_SUBR
    push { r0, r1, r2, r3, lr }
    ldr r0, =0x020043E2
    ldrb r1, [r0]
    mov r2, #0x80
    and r2, r1
    cmp r2, #0x0
    beq .tree_norm2
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x95
    beq .tree_check
    ldr r0, =CHUCKOLA_RAM
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .fruit_unblock
    ldrb r0, [r0, #0x1]
    cmp r0, #0x0
    bne .fruit_block2
    bl .tree_norm

    .tree_check:
    ldr r1, =CHUCKOLA_RAM
    ldr r2, =WHITE
    ldrb r0, [r2]
    mov r3, #0x4
    and r3, r0
    cmp r3, #0x0
    beq .red
    bic r0, r3
    strb r0, [r2]
    mov r3, #0x1
    ldrb r2, [r1]
    orr r3, r2
    strb r3, [r1]
    .red:
    ldr r2, =RED
    ldrb r0, [r2]
    mov r3, #0x10
    and r3, r0
    cmp r3, #0x0
    beq .purple
    bic r0, r3
    strb r0, [r2]
    mov r3, #0x2
    ldrb r2, [r1]
    orr r3, r2
    strb r3, [r1]
    .purple:
    ldr r2, =PURPLE
    ldrb r0, [r2]
    mov r3, #0x80
    and r3, r0
    cmp r3, #0x0
    beq .tree_block
    bic r0, r3
    strb r0, [r2]
    mov r3, #0x4
    ldrb r2, [r1]
    orr r3, r2
    strb r3, [r1]
    bl .tree_block

    .tree_norm2:
    bl .tree_norm

    .tree_block:
    ldr r0, =KEY_ITEM
    ldrb r0, [r0]
    mov r1, #0x40
    and r1, r0
    cmp r1, #0x0
    beq .red_check
    ldr r1, =CHUCKOLA_RAM
    ldrb r2, [r1]
    mov r3, #0x1
    and r3, r2
    cmp r3, #0x1
    beq .white_skip
    ldrb r2, [r1, #0x1]
    mov r3, #0x1
    orr r2, r3
    strb r2, [r1, #0x1]
    .white_skip:
    ldr r1, =WHITE
    ldrb r2, [r1]
    mov r3, #0x4
    orr r3, r2
    strb r3, [r1]
    .red_check:
    mov r1, #0x20
    and r1, r0
    cmp r1, #0x0
    beq .purple_check
    ldr r1, =CHUCKOLA_RAM
    ldrb r2, [r1]
    mov r3, #0x2
    and r3, r2
    cmp r3, #0x2
    beq .red_skip
    ldrb r2, [r1, #0x1]
    mov r3, #0x2
    orr r2, r3
    strb r2, [r1, #0x1]
    .red_skip:
    ldr r1, =RED
    ldrb r2, [r1]
    mov r3, #0x10
    orr r3, r2
    strb r3, [r1]
    .purple_check:
    mov r1, #0x80
    and r1, r0
    cmp r1, #0x0
    beq .tree_norm
    ldr r1, =CHUCKOLA_RAM
    ldrb r2, [r1]
    mov r3, #0x4
    and r3, r2
    cmp r3, #0x4
    beq .purple_skip
    ldrb r2, [r1, #0x1]
    mov r3, #0x4
    orr r2, r3
    strb r2, [r1, #0x1]
    .purple_skip:
    ldr r1, =PURPLE
    ldrb r2, [r1]
    mov r3, #0x80
    orr r3, r2
    strb r3, [r1]
    bl .tree_norm

    .fruit_block2:
    bl .fruit_block

    .fruit_unblock:
    mov r1, #0x1
    and r1, r0
    cmp r1, #0x1
    bne .red_unblock
    ldr r1, =WHITE
    ldrb r2, [r1]
    mov r3, #0x4
    orr r2, r3
    strb r2, [r1]
    .red_unblock:
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x2
    bne .purple_unblock
    ldr r1, =RED
    ldrb r2, [r1]
    mov r3, #0x10
    orr r2, r3
    strb r2, [r1]
    .purple_unblock:
    mov r1, #0x4
    and r1, r0
    cmp r1, #0x4
    bne .fruit_block
    ldr r1, =PURPLE
    ldrb r2, [r1]
    mov r3, #0x80
    orr r2, r3
    strb r2, [r1]

    .fruit_block:
    ldr r0, =CHUCKOLA_RAM
    ldrb r0, [r0, #0x1]
    mov r1, #0x1
    and r1, r0
    cmp r1, #0x0
    beq .red_block
    ldr r1, =WHITE
    ldrb r2, [r1]
    mov r3, #0x4
    bic r2, r3
    strb r2, [r1]
    .red_block:
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x0
    beq .purple_block
    ldr r1, =RED
    ldrb r2, [r1]
    mov r3, #0x10
    bic r2, r3
    strb r2, [r1]
    .purple_block:
    mov r1, #0x4
    and r1, r0
    cmp r1, #0x0
    beq .tree_norm
    ldr r1, =PURPLE
    ldrb r2, [r1]
    mov r3, #0x80
    bic r2, r3
    strb r2, [r1]
    ldr r1, =CHUCKOLA_RAM
    mov r2, #0x0
    strb r2, [r1]
    strb r2, [r1, #0x1]

    .tree_norm:
    pop r1
    mov r1, #0x0
    str r1, [r4, #0x14]
    pop { r0, r2, r3, pc }
    .pool







    .org CHUCKOLA_BLOCK_SUBR
    push { r0, r1, r3, lr }
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x92
    beq .brooch_block
    bl .chuckola_ram

    .brooch_block:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    bne .chuckola_end

    ldr r0, =KEY_ITEM
    ldrb r0, [r0]
    mov r1, #0x4
    and r1, r0
    cmp r1, #0x4
    beq .brooch_norm
    ldr r0, =BROOCH
    ldrb r1, [r0]
    mov r3, #0x40
    and r3, r1
    cmp r3, #0x0
    beq .chuckola_end
    bic r1, r3
    strb r1, [r0]
    ldr r0, =BROOCH_RAM
    mov r1, #0x1
    strb r1, [r0]
    bl .chuckola_end
    .brooch_norm:
    ldr r0, =BROOCH
    ldrb r1, [r0]
    mov r3, #0x40
    and r3, r1
    cmp r3, #0x40
    beq .chuckola_end
    mov r3, #0x40
    orr r1, r3
    strb r1, [r0]
    ldr r0, =BROOCH_RAM
    mov r1, #0x2
    strb r1, [r0]
    bl .chuckola_end

    .chuckola_ram:
    ldr r0, =BROOCH_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    beq .chuckola_restore
    cmp r1, #0x2
    bne .chuckola_end
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =BROOCH
    ldrb r1, [r0]
    mov r3, #0x40
    bic r1, r3
    strb r1, [r0]
    bl .chuckola_end
    .chuckola_restore:
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =BROOCH
    ldrb r1, [r0]
    mov r3, #0x40
    orr r1, r3
    strb r1, [r0]

    .chuckola_end:
    pop { r0, r1 }
    add r0, r4, r1
    ldrb r1, [r0]
    pop { r3, pc }
    .pool



    .org ABILITY_CHECK
    push { r0, r1, r2, r3, lr }
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xB3
    beq .fire_check
    cmp r0, #0xB7
    beq .thunder_check
    ldr r0, =REMOVE_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    beq .fire_remove
    cmp r1, #0x2
    beq .thunder_remove
    mov r2, #0x30
    and r2, r1
    cmp r2, #0x0
    bne .block_fix
    bl .check_end

    .block_fix:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xB0
    beq .unblock_hand
    cmp r0, 0xB4
    bne .check_end
    .unblock_hand:
    ldr r0, =REMOVE_RAM
    mov r1, #0x0
    strb r1, [r0]
    bl .check_end

    .fire_check:
    ldr r0, =REMOVE_RAM
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .check_end
    ldr r0, =0x082F6CDE
    cmp r0, r7    
    bne .check_end
    ldr r0, =0x02004337
    ldrb r0, [r0]
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x0
    bne .check_end
    ldr r0, =0x081E9408
    ldrb r0, [r0]
    cmp r0, #0x39
    beq .check_end
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x1
    and r2, r1
    cmp r2, #0x1
    beq .fire_skipping
    mov r2, #0x1
    ldr r3, =REMOVE_RAM
    strb r2, [r3]
    bic r1, r2
    strb r1, [r0, #0x1]
    bl .check_end
    .fire_skipping:
    bic r1, r2
    strb r1, [r0, #0x1]
    ldr r1, =REMOVE_RAM
    mov r0, #0x10
    strb r0, [r1]
    bl .check_end

    .fire_remove:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xB0
    bne .check_end
    ldr r0, =REMOVE_RAM
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x1
    bic r1, r2
    strb r1, [r0, #0x1]
    bl .check_end

    .thunder_check:
    ldr r0, =REMOVE_RAM
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .check_end
    ldr r0, =0x082F6F84
    cmp r0, r7    
    bne .check_end
    ldr r0, =0x02004336
    ldrb r0, [r0]
    mov r1, #0x80
    and r1, r0
    cmp r1, #0x0
    bne .check_end
    ldr r0, =0x081E9409
    ldrb r0, [r0]
    cmp r0, #0x3A
    beq .check_end
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x2
    and r2, r1
    cmp r2, #0x2
    beq .thunder_skip
    mov r2, #0x2
    ldr r3, =REMOVE_RAM
    strb r2, [r3]
    bic r1, r2
    strb r1, [r0, #0x1]
    bl .check_end
    .thunder_skip:
    bic r1, r2
    strb r1, [r0, #0x1]
    ldr r1, =REMOVE_RAM
    mov r0, #0x20
    strb r0, [r1]
    bl .check_end

    .thunder_remove:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xB4
    bne .check_end
    ldr r0, =REMOVE_RAM
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x2
    bic r1, r2
    strb r1, [r0, #0x1]
    bl .check_end


    .check_end:
    pop { r0, r1, r2, r3, pc }
    .pool






    .org PEARL_RFIX_SUBR
    push { r2, r3, lr }
    ldr r2, =ROOM
    ldrh r2, [r2]
    ldr r3, =0x1D5
    cmp r2, r3
    beq .rfix
    asr r0, #0x10
    and r0, r1
    bl .rfix_end
    .rfix:
    mov r0, #0x0
    .rfix_end:
    pop { r2, r3, pc }
    .pool




    .org PEARL_BLOCK
    push { r0-r4, lr }
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    beq .pearl_end
    ldr r2, =PEARL_RAM
    ldrb r2, [r2]
    cmp r2, #0x0
    bne .pearl_end
    ldr r0, =KEY_ITEM
    ldrb r1, [r0, #0x1]
    mov r2, #0x20
    and r2, r1
    cmp r2, #0x20
    beq .red_remove
    .greenp_block:
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    beq .green_remove
    bl .pearl_end
    .red_remove:
    bic r1, r2
    strb r1, [r0, #0x1]
    ldr r2, =PEARL_RAM
    ldrb r3, [r2]
    mov r4, #0x1
    orr r3, r4
    strb r3, [r2]
    bl .greenp_block
    .green_remove:
    bic r1, r2
    strb r1, [r0, #0x1]
    ldr r2, =PEARL_RAM
    ldrb r3, [r2]
    mov r4, #0x2
    orr r3, r4
    strb r3, [r2]
    .pearl_end:
    pop { r0-r4, pc }
    .pool



    .org PEARL_RESTORE
    push { r0-r3, lr }
    ldr r0, =PEARL_RAM
    ldrb r1, [r0]
    mov r2, #0x0
    strb r2, [r0]
    mov r2, #0x1
    and r2, r1
    cmp r2, #0x1
    beq .red_restore
    .greenp_check:
    mov r2, #0x2
    and r2, r1
    cmp r2, #0x2
    beq .green_restore
    bl .restore_end
    .red_restore:
    ldr r0, =KEY_ITEM
    ldrb r2, [r0, #0x1]
    mov r3, #0x20
    orr r2, r3
    strb r2, [r0, #0x1]
    bl .greenp_check
    .green_restore:
    ldr r0, =KEY_ITEM
    ldrb r2, [r0, #0x1]
    mov r3, #0x40
    orr r2, r3
    strb r2, [r0, #0x1]
    .restore_end:
    pop { r0-r3, pc }
    .pool





    .org TUTOR_BLOCK
    push { r2, lr }
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0xFD
    bne .tutor_end
    bl PEARL_BLOCK
    ldr r0, =TUTOR_RAM
    ldrb r0, [r0]
    cmp r0, #0x1
    beq .tutor_block
    ldr r0, =HAND_TUTOR
    cmp r0, r4
    bne .tutor_end
    ldr r1, =HAMMER
    ldrb r1, [r1, #0x1]
    mov r2, #0x3
    and r1, r2
    cmp r1, #0x3
    beq .tutor_end
    ldr r0, =TUTOR_RAM
    mov r1, #0x1
    strb r1, [r0]
    bl .tutor_end
    .tutor_block:
    ldr r1, =HAND_TUTOR
    add r1, #0x54
    mov r2, #0x0
    str r2, [r1]
    ldr r0, =TUTOR_RAM
    strb r2, [r0]
    .tutor_end:
    pop { r2, pc } 
    .pool





    .org OCEAN_BLOCK
    push { r2, lr }
    ldr r0, =HOONIVERSITY
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004300
    ldrb r1, [r0]
    mov r2, #0x8
    orr r1, r2
    strb r1, [r0]
    ldr r0, =BRIDGE
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    ldr r0, =FIRE_1
    ldrb r1, [r0]
    mov r2, #0x40
    orr r1, r2
    strb r1, [r0]
    ldr r0, =FIRE_2
    ldrb r1, [r0]
    mov r2, #0x5
    orr r1, r2
    strb r1, [r0]
    ldr r0, =FIRE_4
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    ldr r0, =THUNDER_1
    ldrb r1, [r0]
    mov r2, #0x10
    orr r1, r2
    strb r1, [r0]
    ldr r0, =RUINS
    ldrb r1, [r0]
    mov r2, #0x8
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200433E
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043E0
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    pop { r2, pc }
    .pool





    .org SCROLL_CHECK
    push { r2, lr }
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x6]
    mov r1, #0x4
    and r1, r0
    cmp r1, #0x4
    beq .swing_enable
    ldr r0, =SWING
    ldrb r1, [r0]
    mov r2, #0x8
    and r1, r2
    cmp r1, #0x8
    bne .cyclone_check
    ldrb r1, [r0]
    sub r1, #0x8
    strb r1, [r0]
    bl .cyclone_check
    .swing_enable:
    mov r1, #0x8
    ldr r0, =SWING
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    .cyclone_check:
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x6]
    mov r1, #0x8
    and r1, r0
    cmp r1, #0x8
    beq .cyclone_enable
    ldr r0, =CYCLONE
    ldrb r1, [r0]
    mov r2, #0x2
    and r1, r2
    cmp r1, #0x2
    bne .scroll_end
    ldrb r1, [r0]
    sub r1, #0x2
    strb r1, [r0]
    bl .scroll_end
    .cyclone_enable:
    mov r1, #0x2
    ldr r0, =CYCLONE
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    .scroll_end:
    pop { r2, pc }
    .pool



    .org SPRING_BLOCK
    push { r0, r3, lr }
    ldr r0, =0x02006C2C
    ldrb r0, [r0]
    cmp r0, #0x4
    beq .spring_end
    ldr r0, =ROOM
    ldrb r3, [r0]
    cmp r3, #0x23
    bne .spring_end
    ldrb r3, [r0, #0x1]
    cmp r3, #0x1
    bne .spring_end
    ldr r0, =0x0200733C
    mov r3, #0x0
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    ldr r0, =0x02007688
    mov r3, #0x0
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    .spring_end:
    mov r2, r8
    strh r1, [r2]
    pop { r0, r3, pc }
    .pool





    .org ROCK_BLOCK
    push { r0, r1, r2, lr }
    bl COLA_ROCKS
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0xAD
    bne .gate_skip
    ldr r0, =0x020043FC ;ocean_gate
    ldrb r1, [r0]
    mov r2, #0xC0
    orr r1, r2
    strb r1, [r0]
    .gate_skip:
    ldr r0, =0x02004300
    ldrb r1, [r0]
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    bne .shop_skip
    ldr r0, =0x0200436D
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    bl .shop_skip
    .shop_clear:
    ldr r0, =0x0200436D
    ldrb r1, [r0]
    mov r2, #0x80
    bic r1, r2
    strb r1, [r0]
    .shop_skip:
    ldr r0, =0x02004359 ;ruins
    ldrb r1, [r0]
    mov r2, #0x6
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004306 ;sewers cork
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043F9 ;desert1
    ldrb r1, [r0]
    mov r2, #0x1C
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004364 ;desert2
    ldrb r1, [r0]
    mov r2, #0xB
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004410 ;desert3
    ldrb r1, [r0]
    mov r2, #0x40
    bic r1, r2
    strb r1, [r0]
    ldr r0, =0x020043E2 ;woods
    ldrb r1, [r0]
    mov r2, #0x1E
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004529 ;rock1
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004527 ;rock1
    ldrb r1, [r0]
    mov r2, #0x20
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004359 ;fire_rock
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004409
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004524 ;cart_rock
    ldrb r1, [r0]
    mov r2, #0x20
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004525 ;cart_rock
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200440B ;cart_rock
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200430B ;ss_chuckola
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043E6 ;sewer_1
    ldrb r1, [r0]
    mov r2, #0x10
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043E7 ;sewer_2
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043E8 ;sewer_3
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043EA ;sewer_4
    ldrb r1, [r0]
    mov r2, #0xF
    orr r1, r2
    strb r1, [r0]
    pop { r0, r1, r2, pc }
    .pool




    .org COLA_ROCKS
    push lr
    ldr r0, =0x02004526
    ldrb r1, [r0]
    mov r2, #0x88
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200433D ; Advanced bros moves flag
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004347 ; Yoshi theater cutscene flag
    ldrb r1, [r0]
    mov r2, #0x8
    orr r1, r2
    strb r1, [r0]
    pop pc
    .pool





    .org FAWFUL_BLOCK
    push { r0, lr }
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x4D
    bne .fawful_check
    ldr r0, =0x020042F9
    ldrb r1, [r0]
    mov r2, #0x4
    and r2, r1
    cmp r2, #0x4
    beq .fawful_end
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    ldr r0, =FAWFUL_RAM
    mov r1, #0x1
    strb r1, [r0]
    bl .fawful_end
    .fawful_check:
    ldr r0, =FAWFUL_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    beq .fawful_restore
    bl .fawful_end
    .fawful_restore:
    ldr r0, =0x020042F9
    ldrb r1, [r0]
    mov r2, #0x4
    bic r1, r2
    strb r1, [r0]
    ldr r0, =FAWFUL_RAM
    mov r1, #0x0
    strb r1, [r0]
    .fawful_end:
    pop { r0, pc }
    .pool



    .org STAR_QUEST
    push lr
    ldr r0, =0x020046FB
    ldrb r0, [r0]
    cmp r0, #0x4
    bne .quest_skip
    ldr r0, =0x020046F6
    mov r1, #0x4F
    strb r1, [r0]
    .quest_skip:
    ldr r0, =0x0200430B
    ldrb r0, [r0]
    mov r1, #0x10
    and r1, r0
    cmp r0, #0x10
    bne .quest_end
    ldr r0, =0x02004346
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200440E
    ldrb r1, [r0]
    mov r2, #0x8
    orr r1, r2
    strb r1, [r0]
    .quest_end:
    pop pc
    .pool





    .org JUMP_TUT
    push { r0-r2, lr }
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x66
    bne .jump_tut_end
    ldr r0, =0x020042F8
    mov r1, #0xFC
    strb r1, [r0]
    ldr r0, =0x020042FA
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200433E
    ldrb r1, [r0]
    mov r2, #0x1D
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004338
    ldrb r1, [r0]
    mov r2, #0x6
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020042FB
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    .jump_tut_end:
    pop { r0-r2, pc }
    .pool





    .org SAVE_BLOCK
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x95
    beq .chuckola_save
    cmp r0, #0xFD
    bne .save_end
    mov r1, #0x0
    ldr r0, =0x020097D8
    strb r1, [r0]
    bl .save_end
    .chuckola_save:
    mov r1, #0x0
    ldr r0, =0x0200948C
    strb r1, [r0]
    .save_end:
    pop pc
    .pool




    .org KOOPA_BLOCK_SUBR
    push { r0, r1, r2, lr }
    ldr r0, =YOSHI_DISPLAY_RAM
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =CORAL_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    bne .coral_skip
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x1
    bic r1, r2
    strb r1, [r0, #0x1]
    .coral_skip:
    bl JUMP_TUT
    bl EGG_CHECK
    bl STAR_QUEST
    bl ABILITY_CHECK
    bl TUTOR_BLOCK
    bl OCEAN_BLOCK
    bl SCROLL_CHECK
    bl ROCK_BLOCK
    bl FAWFUL_BLOCK
    ldr r0, =PEACH_BUFFER
    ldrb r1, [r0]
    cmp r1, #0x0
    beq .skip_peach
    sub r0, #0x1
    strb r1, [r0]
    .skip_peach:
    ldr r0, =FAWFUL_STONE
    ldrb r0, [r0]
    mov r1, #0x1
    lsl r1, #0x3
    orr r0, r1
    ldr r1, =FAWFUL_STONE
    strb r0, [r1]
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0xFC
    bne .restore_skip
    bl PEARL_RESTORE
    .restore_skip:
    cmp r0, #0xFD
    bne .save_skip
    ldr r1, =ROOM
    ldrb r1, [r1, #0x1]
    cmp r1, #0x1
    bne .save_skip
    ldr r1, =0x020097D8
    mov r2, #0x0
    str r2, [r1]
    .save_skip:
    cmp r0, #0x35
    beq .membership_block2
    cmp r0, #0x36
    beq .membership_restore
    cmp r0, #0x9E
    beq .winkle_block2
    cmp r0, #0x87
    beq .barrel_block2
    cmp r0, #0xC3
    beq .coral_fix2
    cmp r0, #0xBF
    beq .queen_fix
    ldr r0, =QUEEN_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    beq .queen_restore
    bl .koopa_norm

    .queen_fix:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x0
    bne .koopa_norm2
    ldr r0, =0x02004300
    ldrb r1, [r0]
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    beq .koopa_norm2
    ldr r0, =0x02004303
    ldrb r1, [r0]
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    bne .koopa_norm2
    bic r1, r2
    strb r1, [r0]
    ldr r0, =QUEEN_RAM
    mov r1, #0x1
    strb r1, [r0]
    bl .koopa_norm2

    .queen_restore:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x3D
    bne .koopa_norm2
    mov r1, #0x0
    ldr r0, =QUEEN_RAM
    strb r1, [r0]
    ldr r0, =0x02004303
    ldrb r1, [r0]
    mov r2, #0x40
    orr r1, r2
    strb r1, [r0]
    bl .koopa_norm2

    .membership_restore:
    ldr r1, =CARD_RAM
    ldrb r0, [r1]
    cmp r0, #0x1
    bne .koopa_norm2
    mov r0, #0x0
    strb r0, [r1]
    mov r0, #0x20
    ldr r1, =0x0200430A
    ldrb r2, [r1]
    orr r2, r0
    strb r2, [r1]
    bl .koopa_norm2

    .koopa_norm2:
    bl .koopa_norm

    .coral_fix2:
    bl .coral_fix

    .membership_block2:
    bl .membership_block

    .barrel_block2:
    bl .barrel_block

    .winkle_block2:
    bl .winkle_block

    .coral_fix:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x0
    ldr r0, =HAMMER
    ldrb r1, [r0, #0x1]
    mov r2, #0x1
    and r2, r1
    cmp r2, #0x1
    beq .koopa_norm
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0, #0x1]
    ldr r0, =CORAL_RAM
    mov r1, #0x1
    strb r1, [r0]
    bne .koopa_norm

    .winkle_block:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    beq .koopa_norm
    ldr r0, =CARD_RAM
    ldr r0, [r0]
    cmp r0, #0x0
    bne .winkle_block_ram
    ldr r0, =WINKLE
    cmp r0, r4
    bne .koopa_norm
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x1]
    mov r1, #0x1
    lsl r1, #0x1
    and r0, r1
    cmp r0, #0x0
    beq .no_winkle
    bl .koopa_norm
    .no_winkle:
    ldr r0, =CARD_RAM
    mov r1, #0x1
    str r1, [r0]
    bl .koopa_norm
    .winkle_block_ram:
    ldr r0, =WINKLE
    add r0, #0x54
    mov r1, #0x0
    str r1, [r0]
    ldr r0, =CARD_RAM
    str r1, [r0]
    bl .koopa_norm

    .membership_block:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    bne .koopa_norm
    ldr r0, =0x0200430A
    mov r2, #0x22
    ldrb r1, [r0]
    and r2, r1
    cmp r2, #0x22
    bne .koopa_norm
    ldr r1, =KEY_ITEM
    ldrb r1, [r1, #0x1]
    mov r2, #0x1
    and r2, r1
    cmp r2, #0x1
    beq .koopa_norm
    mov r2, #0x20
    ldrb r1, [r0]
    bic r1, r2
    strb r1, [r0]
    ldr r1, =CARD_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .koopa_norm

    .barrel_block:
    ldr r0, =BARREL2
    cmp r0, r4
    bne .koopa_norm
    ldr r0, =BROS_OPTIONS
    ldrb r0, [r0]
    cmp r0, #0x1
    beq .koopa_norm
    ldr r0, =BARREL
    add r0, #0x54
    str r1, [r0]

    .koopa_norm:    
    pop { r0, r1, r2 }
    str r1, [r4, #0xC]
    str r2, [r4, #0x10]
    pop pc 
    .pool

    .close