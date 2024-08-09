    .gba
    .thumb
    .open "mlss.gba", "mlss_loop.gba", 0x08000000
    .include "Arrays.asm"
    .include "Variables.asm"
    .include "Badges.asm"
    .include "Sprites.asm"

    .org 0x08240290 ; Prevent neon egg turn in from removing 7 beanfruits
        db 0x2, 0x0
        dw 0x082402C1

    .org 0x082534DF ; Prevent espresso rewards being enabled from vanilla game
        db 0x2, 0x0
        dw 0x082534EB

    .org 0x0823432A ; Quicken pearl bean cutscene
        db 0x2, 0x0
        dw 0x08234F98

    .org 0x082E940C ; Rock Removal in east beanbean
        db 0x39

    .org 0x088F5EA7
        dh 0x0404

    .org 0x088F5ED4
        dh 0x0404

    .org 0x088F5F01
        dh 0x0404

    .org 0x088F5F2E
        dh 0x0404

    .org 0x0825506F ; Keep town repaired after birdo
        db 0x2, 0x0
        dw 0x0825507E

    .org 0x088209BB ; Remove digspots in chuckle bean tutorial
        db 0x3
    .org 0x088209DC
        db 0x3
    .org 0x08820A5A
        db 0x3
    .org 0x08820A69
        db 0x3
    .org 0x08820ABB 
        db 0x3

    .org 0x082550B1
        db 0x2, 0x0
        dw 0x082550C0

    .org 0x08255109
        db 0x2, 0x0
        dw 0x08255118

    .org 0x08255161
        db 0x2, 0x0
        dw 0x08255170

    .org 0x08255109
        db 0x2, 0x0
        dw 0x08255118

    .org 0x0822898C
        db 0x2, 0x0
        dw 0x0822899B

    .org 0x08229470
        db 0x2, 0x0
        dw 0x0822947F

    .org 0x0822898C
        db 0x2, 0x0
        dw 0x0822899B

    .org 0x082289A0 ; Experimental door patch for west town
        db 0x4D

    .org 0x082EBE42 ; Save block removal
        db 0x30

    .org 0x082F7EE0
        db 0x30

    .org 0x0821E5B1 ; Max Nut Sprite Fix
        db 0x0

    .org 0x0821E584 ; Ultra Nut Sprite Fix
        db 0x0

    .org 0x0821E4FE ;Espresso reward sprites + possibly other sprites??
        db 0x0

    .org 0x08170932 ;Default barrel minigame to yes instead of explain
        db 0x0

    .org 0x08169FDC ;Default winkle minigame to yes instead of explain
        db 0x0

    .org 0x081667CC ;Default border jump to yes instead of explain
        db 0x0

    .org 0x08501710 ; Nerf piranha bean def.
        db 0x28

    .org DRESS_TEXT_E ; Extra Dress Text Capitalization
        db 0x45

    .org DRESS_TEXT_D
        db 0x44

    .org BEANSTAR_TEXT_F ;Fake Beanstar text capitalization
        db 0x46

    .org 0x082754C8
        db 0x22, 0xB0 ;Surf reward fix???

    .org 0x0827547D
        db 0x22, 0xB0

    .org 0x0827555E
        db 0x22, 0xB0

    .org 0x082000A4
        db 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA, 0xA ;Bros move advance

    .org 0x0825DE86 ; Fast popple2 fight end
        db 0x2, 0x10, 0xC, 0xE5, 0x25, 0x08

    .org 0x08250780 ; Fast chuckolator fight start
        db 0x2, 0x10, 0x00, 0x0b, 0x25, 0x08

    .org 0x08250D39 ; Fast chuckolator fight end
        db 0x2, 0x10, 0xD2, 0xEB, 0x24, 0x08

    .org 0x082652BC ; Fast beanstar recovery
        db 0x2, 0x10, 0x74, 0x62, 0x26, 0x08

    .org GUFAWHA_SKIP_ETR
        db 0x81, 0x52, 0x0, 0x6, 0x12, 0x8, 0x1 ;Removes 1 room in gufawha ruins

    .org GUFAWHA_SKIP_EXIT
        db 0x9, 0x52, 0x0, 0x4, 0xD, 0x8, 0x1
    
    .org ROSE_WARNING
        db "Peasley's Rose Required"

    .org AP_TEXT_BOX
        db "AP Item", 0x0

    .org AP_TEXT_EVENT
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
        db "You got an AP Item!"
        db 0xFF, 0x11, 0x1, 0xFF, 0xA

    .org AP_SHOP_HOOK
        dw AP_SHOP2

    .org AP_SHOP2
        dw AP_TEXT_BOX
        dw AP_TEXT_BOX

    .org CHUCKLISSA_WARNING
        db "Beanstar, Fake Beanstar, and", 0xFF, 0x0, "Peach's Extra Dress Required"

    .org GRASS_FIX
        db 0x24, 0x40 ; Crabbie Grass

    .org SHOP_FIX
        db 0xFF

    .org SHOP_FIX2
        db 0xFF

    .org 0x082209BA
        db 0x20, 0xA0 ;Intro item defaults

    .org 0x08220A96
        db 0x20, 0xB0

    .org 0x0822075A
        db 0x21, 0x60

    .org HIGH_JUMP
        db 0xAA ;Set text to yes by default in high/spin jump tutorial

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
        db "Firebrand", 0x0

    .org THUNDER_SHOP2
        dw THUNDER_SHOPNAME
        dw THUNDER_SHOPNAME

    .org THUNDER_SHOPNAME
        db 0x54, 0x68, 0x75, 0x6E, 0x64, 0x65, 0x72, 0x68, 0x61, 0x6E, 0x64, 0x0




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
        dw 0x081DF610


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

    .org 0x08484DD0 ;Harhall Pants
        db 0x16

    .org 0x084831E8 ; 1-up text
        db 0x16

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
        db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
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
        db "Thunderhand", 0x0

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

    .org MOLE_ADD_FIX_HOOK
        bl MOLE_ADD_FIX_SUBR

    .org YOSHI_DISPLAY_HOOK
        bl YOSHI_DISPLAY_SUBR

    .org HP_SCALE_HOOK
        bl HP_SCALE_SUBR

    .org HP_SCALE_FIX_HOOK
        bl HP_SCALE_FIX_SUBR

    .org XP_SCALE_HOOK
        bl XP_SCALE_SUBR

    .org BPIECE_FIX_HOOK
        bl BPIECE_FIX_SUBR

    .org HSPRITE_FIX_HOOK
        bl HSPRITE_FIX_SUBR

    .org YOSHI_TEXT_FIX_HOOK
        bl YOSHI_TEXT_FIX_SUBR

    .org ORANGE_FIX_HOOK
        bl ORANGE_FIX_SUBR

    .org POW_SCALE_HOOK
        bl POW_SCALE_SUBR

    .org SHOP_SPRITE_HOOK
        bl SHOP_SPRITE_SUBR

    .org SHOP_SPRITE_MINI_HOOK
        bl SHOP_SPRITE_MINI_SUBR

    .org POSITION_COMPARE_HOOK
        bl POSITION_COMPARE

    .org HP_SPOIL_HOOK
        bl HP_SPOIL

    .org BROS_TATTLE
        bl TATTLE_INIT

    .org TATTLE_INIT_HOOK
        bl TATTLE_INIT

    .org AP_SHOP
        bl AP_SHOP_SUBR

    .org ESPRESSO_SPRITE_HOOK
        bl ESPRESSO_SPRITE_SUBR 

    .org DEF_SCALE_HOOK
        bl DEF_SCALE_SUBR

    .org 0x080fde9a ;Mario BP
        mov r0, #0x0

    .org 0x080fe0c4 ;Luigi BP
        mov r0, #0x0



    .org DEF_SCALE_SUBR
    push { r2-r3, lr }
    ldr r2, =ERANDOM
    ldrb r2, [r2]
    cmp r2, #0x1
    bne .def_scale_end
    ldr r2, =DEF_ARR
    ldr r3, =ROOM
    ldrh r3, [r3]
    lsl r3, #0x1
    ldrh r2, [r2, r3]
    cmp r2, #0x1
    beq .def_scale_end
    mov r1, r2
    .def_scale_end:
    strh r1, [r0]
    mov r0, #0x0
    pop { r2-r3, pc }
    .pool







    .org ESPRESSO_SPRITE_SUBR
    push r0, r2, lr
    cmp r1, #0x13
    bne .esprite_norm
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x33
    beq .esprite_fix
    ldr r2, =0x137
    cmp r0, r2
    beq .esprite_fix
    bl .esprite_norm
    .esprite_fix:
    pop r0
    mov r0, #0x3
    bl .esprite_end
    .esprite_norm:
    pop r0
    add r0, r1
    ldrb r0, [r0]
    .esprite_end:
    pop r2, pc
    .pool





    .org AP_SHOP_SUBR
    push r2, lr
    add r0, #0x18
    ldr r1, [r0]
    ldr r2, =AP_RAM_L
    str r1, [r2]
    pop r2, pc
    .pool






    .org AP_ITEM
    push { r0-r4, lr }
    ldr r0, =AP_READ_INIT
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .init_skip
    ldr r0, =0x03002336
    ldrb r0, [r0]
    cmp r0, #0x2
    bne .ap_start
    ldr r0, =AP_READ_INIT
    mov r1, #0x1
    strb r1, [r0]
    .init_skip:
    ldr r0, =AP_LOGO
    ldr r1, =0x53534C4D
    str r1, [r0]
    ldr r1, =0x5041
    strh r1, [r0, #0x4]
    .ap_start:
    ldr r0, =AP_READ
    ldrb r0, [r0]
    cmp r0, #0x0
    beq .ap_end
    cmp r0, #0x30
    blt .ap_norm
    cmp r0, #0x9E
    bge .ap_badge
    sub r0, #0x30
    mov r1, r0
    lsr r0, #0x4
    lsl r1, #0x1C
    lsr r1, #0x1C
    cmp r1, #0x7
    bgt .ap_bros
    ldr r2, =KEY_ITEM
    mov r3, #0x1
    lsl r3, r1
    ldrb r4, [r2, r0]
    orr r4, r3
    strb r4, [r2, r0]
    bl .ap_end
    .ap_badge:
    sub r0, #0x9E
    cmp r0, #0x2C
    bgt .ap_pants
    ldr r2, =BADGE_ADD + 1
    mov r1, pc
    bx r2
    bl .ap_end
    .ap_pants:
    cmp r0, #0x5A
    bge .ap_special
    ldr r2, =PANTS_ADD + 1
    mov r1, pc
    bx r2
    bl .ap_end
    .ap_special:
    ldr r2, =SPECIAL_ADD + 1
    mov r1, pc
    bx r2
    bl .ap_end
    .ap_bros:
    cmp r1, #0x8
    bne .ap_hand
    ldr r0, =HAMMER
    ldrb r2, [r0]
    and r1, r2
    cmp r1, #0x0
    bne .ap_super
    mov r1, #0x8
    orr r2, r1
    strb r2, [r0]
    bl .ap_end
    .ap_super:
    mov r1, #0x10
    and r1, r2
    cmp r1, #0x0
    bne .ap_ultra
    mov r1, #0x10
    orr r2, r1
    strb r2, [r0]
    bl .ap_end
    .ap_ultra:
    mov r1, #0x20
    orr r2, r1
    strb r2, [r0]
    bl .ap_end
    .ap_hand:
    sub r1, #0x8
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r1, #0x1
    beq .fire_ap
    cmp r0, #0xB7
    bne .hand_ap_skip
    ldr r0, =REMOVE_RAM
    ldrb r2, [r0]
    bic r2, r1
    strb r2, [r0]
    bl .ap_end
    .fire_ap:
    cmp r0, #0xB3
    bne .hand_ap_skip
    ldr r0, =REMOVE_RAM
    ldrb r2, [r0]
    bic r2, r1
    strb r2, [r0]
    bl .ap_end
    .hand_ap_skip:
    ldr r0, =HAMMER
    ldrb r2, [r0, #0x1]
    orr r2, r1
    strb r2, [r0, #0x1]
    bl .ap_end
    .ap_norm:
    cmp r0, #0x4
    bne .ap_norm2
    ldr r1, =0x020048E0
    ldrh r2, [r1]
    add r2, #0x5
    strh r2, [r1]
    bl .ap_end
    .ap_norm2:
    sub r0, #0xA
    ldr r1, =MUSHROOM
    ldrb r2, [r1, r0]
    cmp r2, #0xFF
    beq .ap_clause
    add r2, #0x1
    cmp r2, #0x63
    ble .ap_norm_in
    mov r2, #0x63
    .ap_norm_in:
    strb r2, [r1, r0]
    bl .ap_end
    .ap_clause:
    mov r2, #0x1
    strb r2, [r1, r0]
    bl .ap_end
    .ap_end:
    ldr r0, =AP_READ
    mov r1, #0x0
    strb r1, [r0]
    pop { r0-r4, pc }
    .pool







    .org HP_SPOIL
    push r1, lr
    ldr r1, =0x08D00000
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .spoil_norm
    ldr r0, =TATTLE_TEXT
    bl .spoil_end
    .spoil_norm:
    ldr r0, [r0]
    ldr r0, [r0]
    .spoil_end:
    pop r1, pc
    .pool
    

    .org TATTLE_INIT
    push { r1-r5, lr }
    ldr r1, =0x08D00000
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .tattle_end1
    cmp r5, #0xFF
    bgt .init_norm
    mov r5, r4
    .init_norm:
    mov r1, r5
    add r1, #0xF6
    ldrh r1, [r1]
    ldr r0, =TATTLE_TEXT
    ldr r2, =0x1388
    cmp r1, r2
    blt .tattle_norm
    sub r1, r2
    .tattle_norm:
    bl WRITE_HP
    mov r1, #0x2F
    strb r1, [r0]
    add r0, #0x1
    mov r1, r5
    add r1, #0xF8
    ldrh r1, [r1]
    ldr r2, =0x1388
    cmp r1, r2
    blt .tattle_norm2
    sub r1, r2
    .tattle_norm2:
    bl WRITE_HP
    mov r1, #0x0
    strb r1, [r0]
    bl .tattle_end
    .tattle_end1:
    ldr r0, [r0]
    ldr r0, [r0]
    bl .tattle_end2
    .tattle_end:
    ldr r0, =TATTLE_TEXT
    .tattle_end2:
    pop { r1-r5, lr }
    .pool




    .org POSITION_COMPARE
    push lr
    add r0, #0xF0
    push r0-r4
    ldr r4, =0x08D00000
    ldrb r4, [r4]
    cmp r4, #0x1
    bne .pos_end
    mov r4, r0
    ldrh r1, [r0, #0x6]
    ldr r0, =TATTLE_TEXT
    ldr r2, =0x1388
    cmp r1, r2
    blt .compare_norm
    sub r1, r2
    .compare_norm:
    bl WRITE_HP
    mov r1, #0x2F
    strb r1, [r0]
    add r0, #0x1
    mov r1, r4
    ldrh r1, [r1, #0x8]
    ldr r2, =0x1388
    cmp r1, r2
    blt .compare_norm2
    sub r1, r2
    .compare_norm2:
    bl WRITE_HP
    mov r1, #0x0
    strb r1, [r0]
    .pos_end:
    pop r0-r4
    ldr r1, [r0]
    pop pc
    .pool



    .org WRITE_HP
    push lr
    mov r2, #0x64
    .h_loop:
    cmp r1, r2
    blt .h_end
    add r2, #0x64
    bl .h_loop
    .h_end:
    sub r2, #0x64
    sub r1, r2
    push r0, r1
    mov r0, r2
    mov r1, #0x64
    swi 0x6
    mov r2, r0
    pop r0, r1
    cmp r2, #0xA
    blt .h_norm
    mov r3, #0x31
    strb r3, [r0]
    add r0, #0x1
    sub r2, #0xA
    add r2, #0x30
    strb r2, [r0]
    add r0, #0x1
    ldr r2, =H_RAM
    mov r3, #0x1
    strb r3, [r2]
    bl .h_skip
    .h_norm:
    cmp r2, #0x0
    beq .h_skip
    add r2, #0x30
    strb r2, [r0]
    add r0, #0x1
    ldr r2, =H_RAM
    mov r3, #0x1
    strb r3, [r2]
    cmp r1, #0x0
    bne .h_skip
    mov r1, #0x30
    strb r1, [r0]
    add r0, #0x1
    mov r1, #0x0
    bl .s_norm
    .h_skip:
    mov r2, #0xA
    .t_loop:
    cmp r1, r2
    blt .t_end
    add r2, #0xA
    bl .t_loop
    .t_end:
    sub r2, #0xA
    sub r1, r2
    push r0, r1
    mov r0, r2
    mov r1, #0xA
    swi 0x6
    mov r2, r0
    pop r0, r1
    cmp r2, #0x0
    beq .t_norm
    add r2, #0x30
    strb r2, [r0]
    add r0, #0x1
    bl .s_norm
    .t_norm:
    ldr r3, =H_RAM
    ldrb r3, [r3]
    cmp r3, #0x0
    beq .s_norm
    mov r2, #0x30
    strb r2, [r0]
    add r0, #0x1
    .s_norm:
    add r1, #0x30
    strb r1, [r0]
    add r0, #0x1
    ldr r1, =H_RAM
    mov r2, #0x0
    strb r2, [r1]
    pop pc
    .pool





    .org POW_SCALE_SUBR
    push r1-r2, pc
    ldr r1, =ERANDOM
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .pow_norm
    ldr r1, =POW_ARR
    ldr r2, =ROOM
    ldrh r2, [r2]
    lsl r2, #0x1
    ldrh r1, [r1, r2]
    cmp r1, #0x1
    beq .pow_norm
    mov r0, r1
    bl .pow_end
    .pow_norm:
    ldrh r0, [r0, #0xC]
    .pow_end:
    mov r12, r0
    pop r1-r2, pc
    .pool







    .org ORANGE_FIX_SUBR
    push { r0, lr }
    ldrb r1, [r2]
    mov r4, #0x1
    mov r0, #0x80
    cmp r1, r0
    bne .orange_end
    mov r1, #0x1
    .orange_end:
    pop { r0, pc }
    .pool




    .org HSPRITE_FIX_SUBR
    push lr
    ldr r2, =0x216
    ldr r1, =ROOM
    ldrh r1, [r1]
    cmp r1, #0x33
    bne .hsprite_norm
    ldr r1, =0x02007BF0
    cmp r1, r4
    bne .hsprite_norm
    mov r1, #0x0
    bl .hsprite_end
    .hsprite_norm:
    ldrh r1, [r4]
    .hsprite_end:
    pop pc
    .pool



    .org BPIECE_FIX_SUBR
    push { r0, r2, lr }
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x1F
    beq .bpiece_norm
    ldr r2, =0x177
    cmp r0, r2
    beq .bpiece_end
    mov r7, #0x1
    ldr r0, =0x0200490D
    cmp r0, r6
    bne .bpiece2
    mov r0, #0xE0
    and r0, r4
    cmp r0, #0x0
    bne .bpiece_end
    bl .bpiece_norm
    .bpiece2:
    add r0, #0x1
    cmp r0, r6
    bne .bpiece_norm
    mov r0, #0x5
    and r0, r4
    cmp r0, #0x0
    bne .bpiece_end
    .bpiece_norm:
    strb r1, [r6]
    .bpiece_end:
    pop { r0, r2, pc }
    .pool




    .org HP_SCALE_FIX_SUBR
    push { r2-r3, lr }
    ldrh r0, [r6, #0x6]
    ldr r2, =ERANDOM
    ldrb r2, [r2]
    cmp r2, #0x1
    bne .scale_norm
    cmp r0, #0x4
    ble .scale_norm
    mov r2, r5
    sub r2, #0x9
    ldrb r2, [r2]
    cmp r2, #0x53
    beq .scale_norm
    cmp r2, #0x5B
    beq .scale_norm
    cmp r2, #0x5C
    beq .scale_norm
    cmp r2, #0x5F
    beq .scale_norm
    cmp r2, #0x60
    beq .scale_norm
    cmp r2, #0xB1
    beq .scale_norm
    cmp r2, #0xB2
    beq .scale_norm
    cmp r2, #0xB3
    beq .scale_norm
    cmp r2, #0xB4
    beq .scale_norm
    ldr r2, =ROOM
    ldrh r2, [r2]
    cmp r2, #0x40
    beq .scale_norm
    cmp r2, #0xF5
    beq .scale_norm
    ldr r3, =0x1A0
    cmp r2, r3
    beq .scale_norm
    bl CALC_HEALTH
    .scale_norm:
    strh r0, [r1]
    pop { r2-r3, pc }
    .pool





    .org HP_SCALE_SUBR
    push { r1-r2, lr }
    ldr r1, =ERANDOM
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .scale_end
    cmp r0, #0x4
    ble .scale_end
    mov r2, r6
    sub r2, #0xA
    ldrb r2, [r2]
    cmp r2, #0x53
    beq .scale_end
    cmp r2, #0x5B
    beq .scale_end
    cmp r2, #0x5C
    beq .scale_end
    cmp r2, #0x5F
    beq .scale_end
    cmp r2, #0x60
    beq .scale_end
    cmp r2, #0xB1
    beq .scale_end
    cmp r2, #0xB2
    beq .scale_end
    cmp r2, #0xB3
    beq .scale_end
    cmp r2, #0xB4
    beq .scale_end
    ldr r2, =ROOM
    ldrh r2, [r2]
    cmp r2, #0x40
    beq .scale_end
    cmp r2, #0xF5
    beq .scale_end
    ldr r1, =0x1A0
    cmp r2, r1
    beq .scale_end
    bl CALC_HEALTH
    .scale_end:
    strh r0, [r6]
    mov r6, r9
    pop { r1-r2, pc }
    .pool




    .org XP_SCALE_SUBR
    push { r5, r7, lr }
    mov r7, r0
    stmia r1!, { r2, r5, r6 }
    ldmia r0!, { r3-r4 }
    mov r5, r9
    sub r7, r5
    cmp r7, #0x24
    bne .xp_end
    ldr r5, =ERANDOM
    ldrb r5, [r5]
    cmp r5, #0x1
    bne .xp_norm
    ldr r7, =XP_ARR
    ldr r5, =ROOM
    ldrh r5, [r5]
    lsl r5, #0x1
    ldrh r7, [r7, r5]
    cmp r7, #0x1
    beq .xp_norm
    ldr r5, =XP_MUL
    ldrb r5, [r5]
    mul r7, r5
    lsr r3, #0x10
    lsl r3, #0x10
    add r3, r7
    bl .xp_end
    .xp_norm:
    mov r5, r3
    lsr r5, #0x10
    lsl r5, #0x10
    lsl r3, #0x10
    lsr r3, #0x10
    ldr r7, =XP_MUL
    ldrb r7, [r7]
    mul r3, r7
    add r3, r5, r3
    .xp_end:
    pop { r5, r7, pc }
    .pool








    .org CALC_HEALTH
    push { r1-r2, lr }
    ldr r1, =ROOM
    ldrh r1, [r1]
    lsl r1, #0x1
    ldr r2, =HP_ARR
    ldrh r1, [r2, r1]
    ldr r2, =0x1388
    cmp r0, r2
    blt .calc_norm
    add r1, r2
    .calc_norm:
    mov r0, r1
    pop { r1-r2, pc }
    .pool




    .org YOSHI_DISPLAY_SUBR
    push { r0-r2, lr }
    ldr r0, =YOSHI_DISPLAY_DATA + 1
    mov r2, pc
    bx r0
    pop { r0-r2, pc }
    .pool




    .org SPOIL_TEXT
    push lr
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
    bl .spoil_text_end
    .yd_bean:
    sub r2, #0x2B
    lsl r2, #0x2
    ldr r3, =KEY_ITEM_BEAN_ARRAY
    ldr r3, [r3, r2]
    bl .spoil_text_end
    .yd_espresso:
    sub r2, #0x1C
    lsl r2, #0x2
    ldr r3, =KEY_ITEM_ESPRESSO_ARRAY
    ldr r3, [r3, r2]
    bl .spoil_text_end
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
    bl .spoil_text_end
    .yd_bros:
    sub r2, #0x8
    cmp r2, #0x0
    bgt .yd_hand
    ldr r3, =HAMMER_TEXT
    bl .spoil_text_end
    .yd_hand:
    cmp r2, #0x1
    bgt .yd_thunder
    ldr r3, =FIRE_TEXT
    bl .spoil_text_end
    .yd_thunder:
    cmp r2, #0x3
    bgt .yd_ap
    ldr r3, =THUNDER_TEXT
    bl .spoil_text_end
    .yd_ap:
    ldr r3, =AP_TEXT_BOX
    bl .spoil_text_end
    .yd_badge:
    sub r2, #0x9E
    lsl r2, #0x2
    ldr r3, =BADGE_BOX_ARRAY
    ldr r3, [r3, r2]
    add r3, #0x1
    .spoil_text_end:
    pop pc
    .pool




    .org YOSHI_DISPLAY_DATA
    push r0-r2
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
    ldr r0, =MINIGAME_SPOILER + 1
    mov r1, pc
    bx r0
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
    bl SPOIL_TEXT
    .yd_display:
    ldr r0, =DISPLAY_TEXTBOX + 1
    mov r1, pc
    bx r0
    .yd_end:
    mov r3, #0xD4
    lsl r3, #0x2
    pop r0-r2
    add r2, #0x1
    bx r2
    .pool




    .org YOSHI_TEXT_FIX_SUBR
    push { r6, lr }
    ldr r6, =0x296
    cmp r6, r3
    bne .norm
    mov r3, #0x0
    .norm:
    sub r0, #0x40
    str r3, [r0]
    pop { r6, pc }
    .pool




    .org MINIGAME_SPOILER
    push r1
    ldr r1, =YOSHI_DISPLAY_RAM
    ldrb r1, [r1]
    ldr r2, =MINIGAME_ENABLE
    ldrb r2, [r2]
    cmp r2, #0x0
    beq .minigame_skip
    ldr r0, =ROOM
    ldrh r0, [r0]
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
    ldr r2, =0xB0
    cmp r0, r2
    beq .hand
    ldr r2, =0xB4
    cmp r0, r2
    beq .hand
    ldr r2, =0x191
    cmp r0, r2
    beq .harhall
    ldr r2, =0x120
    cmp r0, r2
    beq .piranha
    cmp r0, #0xA3
    beq .harhall2
    bl .minigame_skip
    .harhall2:
    cmp r1, #0x8
    bne .minigame_skip
    ldr r0, =0x081E9444
    ldrb r2, [r0]
    bl .minigame_end
    .hand:
    cmp r1, #0x3
    bne .minigame_skip
    sub r2, #0xB0
    lsr r2, #0x2
    ldr r0, =0x081E9408
    ldrb r2, [r0, r2]
    bl .minigame_end
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
    .harhall:
    cmp r1, #0x2
    bne .minigame_skip
    ldr r0, =0x081E9441
    ldrb r2, [r0]
    bl .minigame_end
    .piranha:
    cmp r1, #0xB
    bne .minigame_skip
    ldr r0, =0x081E9431
    ldrb r2, [r0]
    bl .minigame_end
    .minigame_skip:
    mov r2, #0x0
    .minigame_end:
    pop r1
    add r1, #0x1
    bx r1
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




    .org MOLE_ADD_FIX_SUBR
    push lr
    cmp r4, #0x23
    beq .flag_end2
    strb r0, [r1]
    .flag_end2:
    ldr r1, [r2]
    pop pc
    .pool



    .org MOLE_FIX_PANTS_SUBR
    push lr
    add r0, r4
    cmp r4, #0x2D
    beq .pmole_fix
    cmp r4, #0x27
    beq .pmole_fix
    strb r6, [r0]
    .pmole_fix:
    pop pc
    .pool




    .org MOLE_FLAG_FIX_PANTS_SUBR
    push lr
    cmp r4, #0x2D
    beq .pflag_end
    cmp r4, #0x27
    beq .pmole_fix
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
    push r2-r3
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
    cmp r1, #0x3F
    bne .price_key_norm
    mov r1, #0x96
    bl .price_end
    .price_key_norm:
    ldr r1, =0x012C
    bl .price_end
    .price_badge:
    sub r1, #0x9E
    lsl r1, #0x1
    ldr r2, =BADGE_PRICE_ARRAY
    ldrh r1, [r2, r1]
    .price_end:
    pop r2-r3
    add r2, #0x1
    bx r2
    .pool



    .org 0x0812DBDE ;Shop Mini Sprite Fix
        db 0xFF

    .org 0x0812D9E6 ;Shop Sprite Fix
        db 0xFF


    .org SHOP_SPRITE_MINI_SUBR
    push { r2-r3, lr }
    ldr r2, =0x03003FE4
    ldrb r2, [r2]
    ldr r3, [r5, #0x40]
    ldrb r2, [r3, r2]
    cmp r2, #0x30
    bge .smsprite_key
    cmp r2, #0x2B
    bge .smsprite_bean
    cmp r2, #0x12
    bge .smsprite_coffee
    bl .shop_msprite_norm
    .smsprite_coffee:
    mov r0, #0xC
    bl .shop_msprite_end
    .smsprite_bean:
    sub r2, #0x2B
    mov r0, #0xE
    add r0, r2
    bl .shop_msprite_end
    .smsprite_key:
    cmp r2, #0x9E
    bge .smsprite_badge
    mov r0, #0x11
    bl .shop_msprite_end
    .smsprite_badge:
    cmp r2, #0xCA
    bge .smsprite_pants
    mov r0, #0x12
    bl .shop_msprite_end
    .smsprite_pants:
    cmp r2, #0xF8
    bge .smsprite_special
    mov r0, #0x15
    bl .shop_msprite_end
    .smsprite_special:
    mov r0, #0x16
    bl .shop_msprite_end
    .shop_msprite_norm:
    ldrb r0, [r0, #0x1]
    .shop_msprite_end:
    add r1, r0
    pop { r2-r3, pc }
    .pool




    .org SHOP_SPRITE_SUBR
    push { r2-r3, lr }
    ldr r2, =0x03003F60
    ldr r2, [r2]
    mov r3, r8
    ldrb r2, [r2, r3]
    cmp r2, #0x30
    bge .ssprite_key
    cmp r2, #0x2B
    bge .ssprite_bean
    cmp r2, #0x12
    bge .ssprite_coffee
    bl .shop_sprite_norm
    .ssprite_coffee:
    mov r5, #0xC
    bl .shop_sprite_end
    .ssprite_bean:
    sub r2, #0x2B
    mov r5, #0xE
    add r5, r2
    bl .shop_sprite_end
    .ssprite_key:
    cmp r2, #0x9E
    bge .ssprite_badge
    mov r5, #0x11
    bl .shop_sprite_end
    .ssprite_badge:
    cmp r2, #0xCA
    bge .ssprite_pants
    mov r5, #0x12
    bl .shop_sprite_end
    .ssprite_pants:
    cmp r2, #0xF8
    bge .ssprite_special
    mov r5, #0x15
    bl .shop_sprite_end
    .ssprite_special:
    mov r5, #0x16
    bl .shop_sprite_end
    .shop_sprite_norm:
    ldrb r5, [r5, #0x1]
    .shop_sprite_end:
    add r0, r5
    pop { r2-r3, pc }
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
    ldr r4, =SHOP_INJECT_DATA + 1
    mov r2, pc
    bx r4
    pop { r1, r2, r4, r5, pc }
    .pool





    .org SHOP_INJECT_DATA
    push { r1, r2, r4, r5 }
    ldr r1, =AP_INIT_L
    mov r2, #0x1
    strb r2, [r1]
    ldr r1, =0x03003FE4
    ldrb r2, [r1]
    mov r1, #0x7F
    and r2, r1
    ldr r1, =AP_SCROLL
    strb r2, [r1]
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
    ldr r2, =BADGE_ADD + 1
    mov r1, pc
    bx r2
    bl .shop_inject_skip
    .shop_pants:
    cmp r1, #0x5A
    bge .shop_special
    mov r0, r1
    ldr r2, =PANTS_ADD + 1
    mov r1, pc
    bx r2
    bl .shop_inject_skip
    .shop_special:
    mov r0, r1
    ldr r2, =SPECIAL_ADD + 1
    mov r1, pc
    bx r2
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
    cmp r2, #0x8
    bgt .shop_hands
    ; Insert hammer code here
    bl .shop_inject_skip 
    .shop_bro:
    ldr r2, =0x020048FB
    mov r1, #0x1
    strb r1, [r2]
    bl .shop_inject_skip 
    .shop_hands:
    cmp r2, #0xF
    beq .shop_inject_skip
    cmp r2, #0xB
    beq .shop_bro
    sub r2, #0x8
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
    pop { r2, r4, r5 }
    add r2, #0x1
    bx r2
    .pool





    .org SHOP_PRICE_SUBR
    push { r2, r4, lr }
    ldr r1, =BSHOP_RAM
    ldrb r1, [r1]
    ldr r4, =PRICE_CALC + 1
    mov r2, pc
    bx r4
    mov r0, r7
    mov r3, #0x3
    pop { r2, r4, pc }
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
    pop { r3, pc }
    .pool



    .org SHOP_TEXT_SUBR
    push { r2-r4, lr }
    ldr r2, =SHOP_TEXT_DATA + 1
    mov r3, pc
    bx r2
    pop { r2-r4, pc }
    .pool





    .org SHOP_TEXT_DATA
    push r2-r4
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
    cmp r3, #0x8
    bgt .shop_text_hand
    ;Insert hammer code here
    bl .shop_text_norm
    .shop_text_bro:
    ldr r3, =0x08DF0000
    ldrb r3, [r3]
    cmp r3, #0x1
    beq .shop_text_luigi
    ldr r1, =0x08E008C0
    bl .shop_text_norm
    .shop_text_luigi:
    ldr r1, =0x08E008C4
    bl .shop_text_norm
    .shop_text_hand:
    cmp r3, #0xF
    beq .shop_text_ap
    cmp r3, #0xB
    beq .shop_text_bro
    sub r3, #0x8
    add r3, #0x2
    mov r2, #0x4
    mul r3, r2
    ldr r1, =BROS_ITEM_SHOP_ARRAY
    ldr r1, [r1, r3]
    bl .shop_text_norm
    .shop_text_ap:
    ldr r1, =AP_SHOP_HOOK
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
    pop r2-r4
    add r3, #0x1
    bx r3
    .pool



    .org SHOP_DESC_SUBR
    push { r2-r4, lr }
    ldr r2, =SHOP_DESC_DATA + 1
    mov r3, pc
    bx r2
    pop { r2-r4, pc }
    .pool





    .org SHOP_DESC_DATA
    push r2-r4
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
    cmp r3, #0x1
    bge .shop_desc_hand
    ;Insert hammer code here
    bl .shop_desc_norm
    .shop_desc_bro:
    ldr r3, =0x8DF0000
    ldrb r3, [r3]
    cmp r3, #0x1
    beq .shop_desc_luigi
    ldr r1, =0x08E008C0
    bl .shop_desc_norm
    .shop_desc_luigi:
    ldr r1, =0x08E008C4
    bl .shop_desc_norm
    .shop_desc_hand:
    cmp r3, #0xF
    beq .shop_desc_ap
    cmp r3, #0xB
    beq .shop_desc_bro
    sub r3, #0x8
    add r3, #0x2
    mov r2, #0x4
    mul r3, r2
    ldr r1, =BROS_ITEM_SHOP_ARRAY
    ldr r1, [r1, r3]
    bl .shop_desc_norm
    .shop_desc_ap:
    ldr r2, =AP_RAM
    ldr r2, [r2]
    ldr r3, =0x083C05F0
    cmp r2, r3
    bne .desc_ap_f3
    ldr r2, =AP_DESC
    bl .desc_ap_norm2
    .desc_ap_f3:
    ldr r2, =AP_FDESC
    .desc_ap_norm3:
    ldr r3, =0x03003FE4
    ldrb r3, [r3]
    mov r4, #0x1F
    and r3, r4
    lsl r3, #0x2
    ldr r1, [r2, r3]
    bl .shop_desc_end
    .shop_desc_bean:
    sub r2, #0x2B
    mov r3, #0x4
    mul r2, r3
    ldr r1, =BEAN_ITEM_SHOP_ARRAY
    ldr r1, [r1, r2]
    .shop_desc_norm:
    ldr r1, [r1]
    ldr r1, [r1, #0x4]
    .shop_desc_end:
    pop r2-r4
    add r3, #0x1
    bx r3
    .pool







    .org DISPLAY_TEXTBOX
    push { r0-r2, r4-r5 }
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
    ldr r1, =ROOM
    ldrh r1, [r1]
    ldr r2, =0x190
    cmp r1, r2
    bne .display_norm
    mov r1, #0x2C
    bl .display_skip
    .display_norm:
    mov r1, #0x25
    .display_skip:
    strb r1, [r0, #0x8]
    mov r2, #0x9
    mov r4, #0x0
    .display_write_loop:
    ldrb r1, [r3, r4]
    cmp r1, #0x0
    beq .display_end_check
    .display_cont2:
    strb r1, [r0, r2]
    add r4, #0x1
    add r2, #0x1
    bl .display_write_loop
    .display_end_check:
    ldr r1, =ROOM
    ldrh r1, [r1]
    ldr r5, =0x190
    cmp r1, r5
    bne .display_end
    add r4, #0x1
    ldrb r1, [r3, r4]
    cmp r1, #0x0
    beq .display_end
    sub r4, #0x1
    ldrb r1, [r3, r4]
    bl .display_cont2
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
    mov r1, #0x86
    strb r1, [r0]
    pop { r0-r2, r4-r5 }
    add r1, #0x1
    bx r1
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
    push r0-r4, lr
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
    mov r3, #0x8
    and r3, r4
    cmp r3, #0x0
    beq .green_check
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
    mov r3, #0x8
    and r3, r4
    cmp r3, #0x0
    beq .pearl_check
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
    mov r3, #0x1
    and r3, r4
    cmp r3, #0x0
    beq .green_pearl_check
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
    mov r3, #0x2
    and r3, r4
    cmp r3, #0x0
    beq .moves_end
    ldr r3, =0x0200489C
    ldrb r4, [r3]
    mov r2, #0x40
    orr r4, r2
    strb r4, [r3]
    .moves_end:
    bl MOVE_REMOVER
    pop r0-r4, pc
    .pool
    
    .org MOVE_REMOVER
    push { r0-r2, lr }
    ldr r0, =HAMMER
    ldrb r0, [r0, #0x1]
    mov r1, #0x1
    and r1, r0
    cmp r1, #0x1
    beq .thunder_remove_check
    ldr r0, =0x02004860
    ldrb r1, [r0]
    mov r2, #0x40
    bic r1, r2
    strb r1, [r0]
    .thunder_remove_check:
    ldr r0, =HAMMER
    ldrb r0, [r0, #0x1]
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x2
    beq .move_remove_end
    ldr r0, =0x0200489C
    ldrb r1, [r0]
    mov r2, #0x40
    bic r1, r2
    strb r1, [r0]
    .move_remove_end:
    pop { r0-r2, pc }
    .pool




    .org INTRO_SKIP_SUBR
    push { r1, r2, r3, lr }
    ldr r1, =INTRO_DISABLE
    ldrb r2, [r1]
    cmp r2, #0x1
    beq .skip_norm
    bl BADGE_HANDLER
    ldr r2, =EXTRA_PIPES
    ldrb r2, [r2]
    cmp r2, #0x1
    bne .intro
    ldr r2, =0x02004359
    ldrb r3, [r2]
    mov r1, #0x80
    orr r3, r1
    strb r3, [r2]
    ldr r2, =0x0200435A
    ldrb r3, [r2]
    mov r1, #0x16
    orr r3, r1
    strb r3, [r2]
    .intro:
    ldr r1, =INTRO_DISABLE
    mov r2, #0x1
    strb r2, [r1]
    ldr r2, =0x0200433C
    ldrb r3, [r2]
    mov r1, #0x30
    orr r3, r1
    strb r3, [r2]
    ldr r2, =0x08244D12
    ldrb r2, [r2]
    cmp r2, #0x3
    bne .skip_norm
    ldr r2, =0x02004359
    ldrb r3, [r2]
    mov r1, #0x80
    orr r3, r1
    strb r3, [r2]
    ldr r2, =0x020042FC
    ldrb r3, [r2]
    mov r1, #0x1
    orr r3, r1
    strb r3, [r2]
    ldr r2, =0x020042FA
    ldrb r3, [r2]
    mov r1, #0x8
    orr r3, r1
    strb r3, [r2]
    ldrb r3, [r2, #0x1]
    mov r1, #0x80
    orr r3, r1
    strb r3, [r2, #0x1]
    .skip_norm:
    pop r1
    mov r1, r9
    ldrb r0, [r1]
    pop { r2, r3, pc }
    .pool




    .org TEXT_MASH_SUBR
    push { r1-r2, r4,  lr }
    ldr r2, =TEXT_MASH_DATA + 1
    mov r1, pc
    bx r2
    pop { r1-r2, r4, pc}
    .pool





        
    .org TEXT_MASH_DATA
    push r1
    bl MOVES_CHECK
    bl SAVE_BLOCK
    bl PEARL_SPOILER
    bl WARNING
    bl AP_ITEM
    ldr r1, =0x03000375
    ldrb r1, [r1]
    mov r2, #0x3
    and r2, r1
    cmp r2, #0x1
    blt .button_norm2
    cmp r2, #0x3
    bne .pipe_skip2
    ldr r1, =0x02004407
    ldrb r1, [r1]
    mov r2, #0x40
    and r1, r2
    cmp r1, #0x40
    beq .pipe_skip2
    ldr r1, =0x020048FB
    ldrb r1, [r1]
    cmp r1, #0x0
    beq .pipe_skip2
    ldr r1, =0x03002478
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .pipe_skip2
    ldr r1, =CUTSCENE_ACTIVE_ONE
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .pipe_skip2
    ldr r1, =CUTSCENE_ACTIVE_TWO
    ldrb r1, [r1]
    cmp r1, #0x0
    bne .pipe_skip2
    ldr r1, =0x02006E14
    ldrb r1, [r1]
    mov r4, #0xC0
    and r1, r4
    cmp r1, #0x0
    bne .pipe_skip2
    ldr r1, =0x02004359
    ldrb r2, [r1, #0x1]
    cmp r2, #0x0
    bne .have_pipe
    ldrb r1, [r1]
    mov r2, #0x80
    and r2, r1
    cmp r2, #0x0
    beq .pipe_skip2
    .have_pipe:
    ldr r1, =0x02004F10
    ldrb r2, [r1]
    cmp r2, #0x0
    beq .pipe_ram_fix
    cmp r2, #0x9
    ble .pipe_ram_skip
    .pipe_ram_fix:
    ldr r2, =0x08244D12
    ldrb r2, [r2]
    cmp r2, #0x41
    bne .pipe1_enable
    mov r2, #0x3
    strb r2, [r1]
    bl .pipe_ram_skip
    .pipe1_enable:
    mov r2, #0x1
    strb r2, [r1]
    .pipe_ram_skip:
    ldr r1, =0x02004F10
    ldrb r1, [r1]
    cmp r1, #0x1
    bne .pipe_flag2
    bl .pipe_flag_skip
    .button_norm2:
    bl .button_norm
    .pipe_flag2:
    mov r2, #0x1
    sub r1, #0x2
    lsl r2, r1
    ldr r1, =0x0200435A
    ldrb r1, [r1]
    and r2, r1
    cmp r2, #0x0
    bne .pipe_flag_skip
    ldr r1, =0x0200435A
    ldrb r1, [r1]
    mov r2, #0x2
    and r2, r1
    cmp r2, #0x0
    bne .pipe_flag_castle
    mov r2, #0x1
    ldr r1, =0x02004F10
    strb r2, [r1] 
    bl .pipe_flag_skip
    .pipe_flag_castle:
    mov r2, #0x3
    ldr r1, =0x02004F10
    strb r2, [r1] 
    .pipe_flag_skip:
    ldr r1, =0x03000374
    ldrb r1, [r1]
    mov r2, #0x4
    and r2, r1
    cmp r2, #0x4
    bne .pipe_skip2
    ldr r1, =ROOM
    ldrh r1, [r1]
    ldr r2, =0x1D5
    cmp r1, r2
    blt .pipe_cont
    ldr r2, =0x1DD
    ble .pipe_skip2
    .pipe_cont:
    cmp r1, #0xFD
    beq .pipe_skip2
    cmp r1, #0xA3
    beq .pipe_skip2
    cmp r1, #0x40
    beq .pipe_skip2
    cmp r1, #0xB8
    blt .pipe_cont2
    cmp r1, #0xBF
    ble .pipe_skip2
    .pipe_cont2:
    ldr r1, =0x02004A24
    ldr r2, =0x08270AE5
    str r2, [r1]
    ldr r1, =CUTSCENE_ACTIVE_ONE
    mov r2, #0x1
    str r2, [r1]
    ldr r1, =0x03002452
    mov r2, #0x40
    strb r2, [r1]
    ldr r1, =0x03002418
    mov r2, #0x0
    strb r2, [r1]
    ldr r1, =0x03002430
    mov r2, #0x0
    strb r2, [r1]
    .pipe_skip2:
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
    pop r1
    add r1, #0x1
    bx r1
    .pool





    .org PEARL_SPOILER
    push { r0-r3, lr }
    ldr r0, =MINIGAME_ENABLE
    ldrb r0, [r0]
    cmp r0, #0x1
    bne .pearl_spoil_end
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xFD
    bne .pearl_spoil_end
    ldr r0, =FRONT_BRO
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .luigi_spoil
    ldr r0, =MARIO_VALUE
    bl .position
    .luigi_spoil:
    ldr r0, =LUIGI_VALUE
    .position:
    ldrb r1, [r0, #0x5]
    cmp r1, #0xFC
    bne .pearl_spoil_end
    ldr r1, [r0]
    ldr r2, =0x21800
    cmp r1, r2
    blt .pearl_spoil_end
    ldr r2, =0x24800
    cmp r1, r2
    blt .green_spoil
    ldr r2, =0x26800
    cmp r1, r2
    blt .pearl_spoil_end
    ldr r2, =0x29800
    cmp r1, r2
    bgt .pearl_spoil_end
    ;Red Spoil
    ldr r0, =PEARL_SPOIL_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    beq .pearl_spoil_end
    mov r1, #0x1
    strb r1, [r0]
    ldr r0, =0x08235C1C
    bl .pearl_text
    .green_spoil:
    ldr r0, =PEARL_SPOIL_RAM
    ldrb r1, [r0]
    cmp r1, #0x2
    beq .pearl_spoil_end
    mov r1, #0x2
    strb r1, [r0]
    ldr r0, =0x08235A5B
    .pearl_text:
    ldrb r2, [r0, #0x1]
    lsr r2, #0x4
    ldrb r1, [r0]
    lsl r1, #0x1C
    lsr r1, #0x18
    add r2, r1
    bl SPOIL_TEXT
    ldr r0, =DISPLAY_TEXTBOX + 1
    mov r1, pc
    bx r0
    .pearl_spoil_end:
    pop { r0-r3, pc }
    .pool




    .org WARNING
    push { r0-r3, lr }
    ldr r0, =MARIO_VALUE
    ldr r0, [r0, #0x4]
    ldr r1, =0x8000
    cmp r0, r1
    beq .warning_end
    ldr r0, =ROOM
    ldrh r1, [r0, #0x2]
    ldrh r0, [r0]
    cmp r0, r1
    bne .warning_end
    cmp r0, #0x36
    beq .warning_rose_flag
    ldr r1, =0x190
    cmp r0, r1
    bne .warning_end
    ;Warning Chucklissa
    mov r0, #0x2
    bl .warning_front
    .warning_rose_flag:
    mov r0, #0x1
    .warning_front:
    ldr r1, =FRONT_BRO
    ldrb r1, [r1]
    cmp r1, #0x1
    beq .warning_luigi
    ldr r1, =MARIO_VALUE
    bl .warning_position
    .warning_luigi:
    ldr r1, =LUIGI_VALUE
    .warning_position:
    cmp r0, #0x1
    beq .warning_rose
    cmp r0, #0x2
    bne .warning_end
    ldr r2, [r1]
    ldr r0, =0x1D800
    cmp r2, r0
    blt .warning_end
    ldr r0, =0x0200490B
    ldrb r1, [r0]
    mov r2, #0xC
    and r2, r1
    cmp r2, #0xC
    bne .chucklissa
    ldr r0, =0x0200490E
    ldrb r1, [r0]
    mov r2, #0x2
    and r2, r1
    cmp r2, #0x2
    beq .warning_end
    .chucklissa:
    ldr r3, =CHUCKLISSA_WARNING
    bl .warning_ram
    .warning_rose:
    ldr r2, [r1, #0x4]
    ldr r0, =0x8700
    cmp r2, r0
    bgt .warning_end
    ldr r0, =0x0200490A
    ldrb r1, [r0]
    mov r2, #0x2
    and r2, r1
    cmp r2, #0x2
    beq .warning_end
    ldr r3, =ROSE_WARNING
    .warning_ram:
    ldr r0, =PEARL_SPOIL_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    beq .warning_end
    mov r1, #0x1
    strb r1, [r0]
    ldr r0, =DISPLAY_TEXTBOX + 1
    mov r1, pc
    bx r0
    .warning_end:
    pop { r0-r3, pc }
    .pool



    .org HAND_FIX_SUBR
    push { r1, r3, lr }
    ldr r3, =HAND_FIX_DATA + 1
    mov r1, pc
    bx r3
    pop { r1, r3, pc }
    .pool





    .org HAND_FIX_DATA
    push { r1, r3 }
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
    pop { r1, r3 }
    add r1, #0x1
    bx r1
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
     ldr r2, =KEY_ITEM_FIX_DATA + 1
     mov r3, pc
     bx r2
     pop { r2, r3, pc }
    .pool





    .org KEY_ITEM_FIX_DATA
    push r2-r3
    asr r0, r0, #0x10
    and r0, r1
    ldr r2, =0x0200490A
    cmp r6, r2
    bne .key_cont
    cmp r4, #0x2
    beq .key_rose
    cmp r0, #0x0
    bne .key_end
    bl .key_stop
    .key_rose:
    push r1
    ldr r2, =ROSE_FIX + 1
    mov r1, pc
    bx r2
    pop r1
    cmp r0, #0x0
    bne .key_end
    bl .key_stop
    .key_cont:
    cmp r0, #0x0
    bne .key_end
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
    pop r2-r3
    add r3, #0x1
    bx r3
    .pool





    .org ROSE_FIX
    push r0-r3
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
    ldr r2, =BADGE_ADD + 1
    mov r1, pc
    bx r2
    lsl r0, #0x2
    ldr r1, =BADGE_BOX_ARRAY
    ldr r3, [r1, r0]
    add r3, #0x1
    bl .rose_end
    .rose_pants:
    cmp r0, #0x5A
    bge .rose_special
    push r0
    ldr r2, =PANTS_ADD + 1
    mov r1, pc
    bx r2
    pop r0
    lsl r0, #0x2
    ldr r2, =BADGE_BOX_ARRAY
    ldr r3, [r2, r0]
    add r3, #0x1
    bl .rose_end
    .rose_special:
    push r0
    ldr r2, =SPECIAL_ADD + 1
    mov r1, pc
    bx r2
    pop r0
    lsl r0, #0x2
    ldr r2, =BADGE_BOX_ARRAY
    ldr r3, [r2, r0]
    add r3, #0x1
    bl .rose_end
    .rose_bros:
    cmp r1, #0x8
    bne .rose_hand
    ldr r0, =HAMMER
    ldrb r2, [r0]
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
    cmp r1, #0xF
    beq .rose_ap
    sub r1, #0x8
    ldr r0, =HAMMER
    ldrb r2, [r0, #0x1]
    orr r2, r1
    strb r2, [r0, #0x1]
    cmp r1, #0x1
    bne .rose_thunder
    ldr r3, =FIRE_TEXT
    bl .rose_end
    .rose_ap:
    ldr r3, =AP_TEXT_BOX
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
    ldr r0, =DISPLAY_TEXTBOX + 1
    mov r1, pc
    bx r0
    pop r0-r3
    add r1, #0x1
    bx r1
    .pool




    .org DOOR_SUBR
    push { r0, r1, r6, lr }
    ldr r0, =DOOR_DATA + 1
    mov r6, pc
    bx r0
    pop { r0, r1, r6, pc }
    .pool





    .org DOOR_DATA  
    push r6
    ldr r0, =ROOM
    ldrb r0, [r0]
    cmp r0, #0x36
    beq .castle_door
    cmp r0, #0x90
    beq .dress_door
    cmp r0, #0x5A
    beq .ruins_door
    bl .end2

    .ruins_door:
    ldr r0, =RUINS_DOORS + 1
    mov r6, pc
    bx r0
    bl .end3

    .dress_door:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    bne .end2
    ldr r0, =DRESS_DOOR
    cmp r1, r0
    bne .end2
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x1]
    mov r6, #0xC
    and r0, r6
    cmp r0, #0xC
    bne .bstar_skip
    ldr r0, =BEANSTAR_OPTION
    ldrb r0, [r0]
    cmp r0, #0x1
    bne .end2
    ldr r0, =0x0200490E
    ldrb r0, [r0]
    mov r6, #0x2
    and r0, r6
    cmp r0, #0x2
    beq .end2
    .bstar_skip:
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
    ldr r0, =GATES_RAM
    ldrb r0, [r0]
    ldr r1, =0x02004303
    ldrb r6, [r1]
    bic r6, r0
    strb r6, [r1]
    pop r6
    add r6, #0x1
    bx r6
    .pool





    .org RUINS_DOORS
    push r6
    ldr r0, =0x0200434C
    ldrb r0, [r0]
    mov r6, #0x3
    and r0, r6
    cmp r0, #0x1
    bne .ruins_norm
    ldr r0, =0x083AC748
    cmp r1, r0
    beq .ruins_norm
    ldr r0, =0x083AC754
    cmp r1, r0
    beq .ruins_norm
    mov r3, #0xff
    bl .ruins_end
    .ruins_norm:
    ldrb r3, [r1]
    .ruins_end:
    pop r6
    add r6, #0x1
    bx r6
    .pool



    .org EVENT_BLOCKER_SUBR
    push { r1, r3, lr }
    ldr r3, =EVENT_BLOCKER_DATA + 1
    mov r1, pc
    bx r3
    pop { r1, r3, pc }
    .pool







    .org EVENT_BLOCKER_DATA

    push { r1, r3 }
    ldr r1, =ROOM
    ldrh r1, [r1]
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
    ldr r3, =0x1D5
    cmp r1, r3
    beq .pearl_block
    b .unblock

    .chuckle_block:
    mov r0, #0x0
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
    bne .unblock
    mov r0, #0xFF
    bl .end

    .pearl_block:
    mov r0, #0xFF
    bl .end

    .unblock:
    ldrb r0, [r2]
    .end:
    lsl r4, r0, #0x4
    pop { r1, r3 }
    add r1, #0x1
    bx r1
    .pool




    .org ABILITY_BLOCK_SUBR
    push { r3-r4, r7, lr }
    ldr r3, =ABILITY_BLOCK_DATA + 1
    mov r7, pc
    bx r3
    pop { r3-r4, r7, pc }
    .pool






    .org ABILITY_BLOCK_DATA
    push { r0-r4, r7 }
    ldr r2, =HAMMER
    cmp r2, r5
    bne .scroll_check
    ldr r1, =0x3FF
    and r0, r1
    cmp r0, #0x0
    beq .ability_norm2
    mov r1, #0x38
    and r1, r0
    cmp r1, #0x0
    beq .cont_check
    ldr r1, =AB_RAM
    mov r2, #0x1
    strb r2, [r1]
    bl .cont_check
    .scroll_check:
    ldr r2, =0x0200434C
    cmp r2, r5
    bne .ability_norm
    ldr r1, =0x60000
    and r1, r0
    cmp r1, #0x0
    beq .ability_norm
    sub r4, #0xA0
    .cont_check:
    ldr r0, =TEXT_VAR
    sub r4, r0
    ldr r0, =ABILITY_STORAGE
    ldrb r0, [r0, r4]
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
    .ability_norm2:
    bl .ability_norm
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
    ldr r0, =BROS_ITEM_SUBR + 1
    mov r1, pc
    bx r0
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
    ldr r2, =BADGE_ADD + 1
    mov r1, pc
    bx r2
    bl .ability_norm
    .ability_pants:
    cmp r0, #0x5A
    bge .ability_special
    ldr r2, =PANTS_ADD + 1
    mov r1, pc
    bx r2
    bl .ability_norm
    .ability_special:
    ldr r2, =SPECIAL_ADD + 1
    mov r1, pc
    bx r2
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
    ldr r4, =0x020042F8
    cmp r4, r5
    beq .ab_skip
    cmp r3, #0x1
    beq .ability_end2
    .ab_skip:
    orr r1, r0
    str r1, [r5]
    bl .ability_end2
    .ability_end:
    pop { r0, r1 }
    .ability_end2:
    ldr r2, =BEAN_RAM
    mov r3, #0x0
    strb r3, [r2]
    pop { r2-r4, r7 }
    add r7, #0x1
    bx r7
    .pool






    .org TEXT_KEY_ITEM
    push r0-r4
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
    ldr r0, =BROS_ITEM_SUBR + 1
    mov r1, pc
    bx r0
    bl .kit_end
    .kit_badge:
    sub r0, #0x9F
    cmp r0, #0x2C
    bge .kit_pants
    ldr r2, =BADGE_ADD + 1
    mov r1, pc
    bx r2
    bl .kit_end
    .kit_pants:
    cmp r0, #0x5A
    bge .kit_special
    ldr r2, =PANTS_ADD + 1
    mov r1, pc
    bx r2
    bl .kit_end
    .kit_special:
    ldr r2, =SPECIAL_ADD + 1
    mov r1, pc
    bx r2
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
    pop r0-r4
    add r1, #0x1
    bx r1
    .pool





    .org TEXT_ITEM_SUBR
    push { r0-r1, r3 }
    ldr r0, =TEXT_ITEM
    ldr r0, [r0]
    cmp r0, #0x0
    beq .text_end
    ldr r3, =TEXT_VAR
    sub r0, r3
    cmp r0, #0x30
    blt .key_skip
    ldr r3, =TEXT_KEY_ITEM + 1
    mov r1, pc
    bx r3
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
    cmp r0, #0x63
    blt .norm_text2
    mov r0, #0x63
    bl .norm_text_end
    .norm_text2:
    add r0, #0x1
    .norm_text_end:
    strb r0, [r1]
    .text_end:
    pop { r0-r1, r3 }
    add r1, #0x1
    bx r1
    .pool







    .org TEXTBOX_REPLACE_SUBR
    push r1-r4
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
    pop r1-r4
    add r1, #0x1
    bx r1
    .pool





     .org HAMMER_TEXT_SUBR
     push r0-r3
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
     cmp r1, #0x6
     blt .hammer_hand_norm
     mov r1, #0x3
     .hammer_hand_norm:
     add r1, #0x2
     mul r1, r2
     ldr r0, [r0, r1]
     ldr r1, =HAND_TEXT_RAM
     str r0, [r1]
     .hammer_text_end:
     pop r0-r3
     add r1, #0x1
     bx r1
     .pool





     .org BEANSTAR_TEXT
     push r1
     ldr r1, =0x084F226C
     cmp r1, r7
     bne .text2
     bl .piece1
     .text2:
     ldr r1, =0x084F30B8
     cmp r1, r7
     bne .bt_end
     .piece1:
     ldr r1, =ROOM
     ldrh r1, [r1]
     cmp r1, #0x9D ; Popple
     bne .piece2
     ldr r2, =TEXT_VAR
     ldr r1, =0x081E9440
     ldrb r1, [r1]
     add r2, r1
     ldr r1, =TEXT_ITEM
     str r2, [r1]
     ldr r1, =FRUIT_REMOVE_RAM
     mov r2, #0x1
     strb r2, [r1]
     bl .bt_end
     .piece2:
     ldr r2, =0x191 ; Harhall
     cmp r1, r2
     bne .piece3
     ldr r2, =TEXT_VAR
     ldr r1, =0x081E9441
     ldrb r1, [r1]
     add r2, r1
     ldr r1, =TEXT_ITEM
     str r2, [r1]
     ldr r1, =FRUIT_REMOVE_RAM
     mov r2, #0x1
     strb r2, [r1]
     bl .bt_end
     .piece3:
     ldr r2, =0x1CC ; Theater
     cmp r1, r2
     bne .piece4
     ldr r2, =TEXT_VAR
     ldr r1, =0x081E9442
     ldrb r1, [r1]
     add r2, r1
     ldr r1, =TEXT_ITEM
     str r2, [r1]
     ldr r1, =FRUIT_REMOVE_RAM
     mov r2, #0x1
     strb r2, [r1]
     bl .bt_end
     .piece4:
     cmp r1, #0xFF ; Hermie
     bne .bt_end
     ldr r2, =TEXT_VAR
     ldr r1, =0x081E9443
     ldrb r1, [r1]
     add r2, r1
     ldr r1, =TEXT_ITEM
     str r2, [r1]
     ldr r1, =FRUIT_REMOVE_RAM
     mov r2, #0x1
     strb r2, [r1]
     .bt_end:
     pop r1
     add r1, #0x1
     bx r1
     .pool






     .org TEXT_ITEM_INJECT_SUBR
     push { r1-r2, lr }
     ldr r2, =TEXT_ITEM_INJECT_DATA + 1
     mov r1, pc
     bx r2
     pop { r1-r2, pc }
     .pool







    .org TEXT_ITEM_INJECT_DATA
    push r1-r2
    ldr r2, =BEANSTAR_TEXT + 1
    mov r1, pc
    bx r2
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
    ldr r1, =ROOM
    ldrh r1, [r1]
    cmp r1, #0x67
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
    ldr r1, =0x084F2AB4
    cmp r1, r7
    bne .harhall_skip
    ldr r1, =0x081E9444
    ldrb r1, [r1]
    ldr r2, =TEXT_VAR
    add r1, r2
    ldr r2, =TEXT_ITEM
    str r1, [r2]
    ldr r2, =FRUIT_REMOVE_RAM
    mov r1, #0x1
    strb r1, [r2]
    .harhall_skip:
    ldr r2, =TEXT_ITEM_SUBR + 1
    mov r1, pc
    bx r2
    ldr r2, =TEXTBOX_REPLACE_SUBR + 1
    mov r1, pc
    bx r2
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
    ldr r2, =HAMMER_TEXT_SUBR + 1
    mov r1, pc
    bx r2
    bl .hand_box
    .shammer_box:
    ldr r1, =HAMMER_TEXT_RAM
    mov r0, #0x4
    strb r0, [r1]
    ldr r2, =HAMMER_TEXT_SUBR + 1
    mov r1, pc
    bx r2
    bl .hand_box
    .uhammer_box:
    ldr r1, =HAMMER_TEXT_RAM
    mov r0, #0x5
    strb r0, [r1]
    ldr r2, =HAMMER_TEXT_SUBR + 1
    mov r1, pc
    bx r2
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
    pop r1-r2
    add r1, #0x1
    bx r1
    .pool






    .org BROS_ITEM_SUBR
    push r1
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
    beq .thunder_drop2
    cmp r1, #0x8
    beq .ap_drop
    bl .bros_end

    .ap_drop:
    ldr r0, =BROS_RAM
    ldrb r0, [r0]
    mov r1, #0xF0
    and r1, r0
    cmp r1, #0x10
    bne .ap_item_box
    ldr r1, =BROS_ITEM_BUFFER
    ldr r0, =AP_TEXT_BOX
    sub r0, #0x1
    str r0, [r1]
    bl .bros_item_textbox
    .ap_item_box:
    ldr r0, =BROS_ITEM_BUFFER
    ldr r1, =AP_TEXT_EVENT
    str r1, [r0]
    bl .bros_item_textbox

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

    .thunder_drop2:
    bl .thunder_drop

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
    bl .bros_item_textbox

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
    bl .bros_end
    .hand_box_check:
    ldr r1, =HAND_TEXT_RAM
    ldr r2, =BROS_ITEM_BUFFER
    ldr r2, [r2]
    str r2, [r1]


    .bros_end:
    ldr r0, =BROS_RAM
    mov r1, #0x0
    strb r1, [r0]
    pop r1
    add r1, #0x1
    bx r1
    .pool



    .org KEY_ITEM_B_SUBR
    push { r1-r5, lr }
    ldr r2, =KEY_ITEM_B_DATA + 1
    mov r1, pc
    bx r2
    pop r1-r5
    lsl r0, r0, #0x10
    lsr r4, r0, #0x10
    pop pc
    .pool





    .org KEY_ITEM_B_DATA
    push r1-r5
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
    ldr r2, =BADGE_ADD + 1
    mov r1, pc
    bx r2
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
    ldr r2, =PANTS_ADD + 1
    mov r1, pc
    bx r2
    ldr r1, =KEY_ITEM_RAM
    ldr r2, =BADGE_BOX_ARRAY
    mov r3, #0x4
    mul r3, r0
    ldr r2, [r2, r3]
    str r2, [r1]
    mov r0, #0x18
    bl .kib_end
    .kib_special:
    ldr r2, =SPECIAL_ADD + 1
    mov r1, pc
    bx r2
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
    ldr r2, =BROS_ITEM_SUBR + 1
    mov r1, pc
    bx r2
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
    ldr r1, =HINT_TOKENS
    ldrh r2, [r1]
    ldr r3, =0xFFFF
    cmp r2, r3
    bne .fresh_skip
    mov r2, #0x0
    .fresh_skip:
    add r2, #0x1
    strh r2, [r1]
    pop r1-r5
    add r1, #0x1
    bx r1
    .pool





    .org EGG_CHECK
    push { r0-r3, lr }
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
    pop { r0-r3, pc }
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
    push { r0-r3, lr }
    ldr r0, =TREE_BLOCK_DATA + 1
    mov r1, pc
    bx r0
    pop r0-r3
    mov r1, #0x0
    str r1, [r4, #0x14]
    pop pc
    .pool







    .org TREE_BLOCK_DATA
    push r0-r3
    ldr r0, =0x020043E2
    ldrb r1, [r0]
    mov r2, #0x80
    and r2, r1
    cmp r2, #0x0
    beq .tree_norm2
    ldr r0, =ROOM
    ldrh r0, [r0]
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
    pop r0-r3
    add r1, #0x1
    bx r1
    .pool


    .org CHUCKOLA_BLOCK_SUBR
    push { r0-r1, r3, lr }
    ldr r0, =CHUCKOLA_BLOCK_DATA + 1
    mov r1, pc
    bx r0
    pop { r0-r1, r3 }
    add r0, r4, r1
    ldrb r1, [r0]
    pop pc
    .pool







    .org CHUCKOLA_BLOCK_DATA
    push { r0-r1, r3 }
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
    pop { r0-r1, r3 }
    add r1, #0x1
    bx r1
    .pool



    .org ABILITY_CHECK
    push r1, r3, lr
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
    cmp r0, #0xB4
    beq .unblock_hand
    cmp r0, #0xB0
    ble .unblock_hand
    cmp r0, 0xB8
    bge .check_end
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
    ldr r1, =REMOVE_RAM
    mov r0, #0x10
    strb r0, [r1]
    bl .check_end

    .fire_remove:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xAF
    ble .fire_remove2
    cmp r0, #0xB3
    ble .check_end
    .fire_remove2:
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
    ldr r1, =REMOVE_RAM
    mov r0, #0x20
    strb r0, [r1]
    bl .check_end

    .thunder_remove:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xB3
    ble .thunder_remove2
    cmp r0, #0xB7
    ble .check_end
    .thunder_remove2:
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
    pop r1, r3, pc
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
    push { r0-r4, lr}
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
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
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
    pop pc
    .pool





    .org GWAHAR_PIPE
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xC9
    bne .pipe_skip
    ldr r0, =0x0200435A
    ldrb r1, [r0]
    mov r2, #0x40
    orr r1, r2
    strb r1, [r0]
    .pipe_skip:
    pop pc
    .pool





    .org OCEAN_BLOCK
    push lr
    bl GWAHAR_PIPE
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
    ldr r0, =0x0200433E
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200430A
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    pop pc
    .pool





    .org SCROLL_CHECK
    push lr
    ldr r0, =KEY_ITEM
    ldrb r0, [r0, #0x6]
    mov r1, #0x4
    and r1, r0
    cmp r1, #0x4
    beq .swing_enable
    ldr r0, =SWING
    ldrb r1, [r0]
    mov r2, #0x8
    and r2, r1
    cmp r2, #0x0
    beq .cyclone_check
    bic r1, r2
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
    and r2, r1
    cmp r2, #0x0
    beq .scroll_end
    bic r1, r2
    strb r1, [r0]
    bl .scroll_end
    .cyclone_enable:
    ldr r0, =HAMMER
    ldrb r0, [r0]
    mov r1, #0x8
    and r1, r0
    cmp r1, #0x0
    beq .scroll_end
    mov r1, #0x2
    ldr r0, =CYCLONE
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    .scroll_end:
    pop pc
    .pool



    .org SPRING_BLOCK
    push { r0, r3, lr }
    ldr r0, =SPRING_BLOCK_DATA + 1
    mov r3, pc
    bx r0
    pop { r0, r3, pc }
    .pool



    .org SPRING_BLOCK_DATA
    push { r0, r3 }
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
    pop { r0, r3 }
    add r3, #0x1
    bx r3
    .pool





    .org ROCK_BLOCK
    push lr
    ldr r0, =0x0200490A
    ldrb r0, [r0]
    mov r1, #0x6
    and r0, r1
    cmp r0, #0x0
    beq .bshop_skip
    ldr r0, =0x0200436D ;unlock badge shop
    ldrb r1, [r0]
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    .bshop_skip:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xCC
    beq .gate
    cmp r0, #0xAD
    bne .gate_skip
    .gate:
    ldr r0, =0x020043FC ;ocean_gate
    ldrb r1, [r0]
    mov r2, #0xC0
    orr r1, r2
    strb r1, [r0]
    .gate_skip:
    ldr r0, =ROOM
    ldrh r0, [r0]
    ldr r1, =0x1D6
    cmp r0, r1
    bne .pskip
    ldr r0, =0x02004339 ;Pearl Beans
    ldrb r1, [r0]
    mov r2, #0xC
    orr r1, r2
    strb r1, [r0]
    .pskip:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xC6
    bne .dskip
    ldr r0, =0x02004348 ;Ocean Red Door
    ldrb r1, [r0]
    mov r2, #0x10
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043F6 ;Ocean Red Door
    ldrb r1, [r0]
    mov r2, #0x42
    orr r1, r2
    strb r1, [r0]
    .dskip:
    ldr r0, =0x0200452D ;teehee valley super rock
    ldrb r1, [r0]
    mov r2, #0x14
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x03000D40 ; Assure Save Data is stored in proper location in RAM, such as to not clash with my own RAM data (This might break the game I have no idea honestly)
    ldrb r1, [r0]
    mov r2, #0xF8
    bic r1, r2
    strb r1, [r0]
    ldr r0, =0x02004336 ; Fungitown arcade machine text
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004343 ; Fungitown arcade machine invincishroom
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004306 ;sewers cork
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x0200435C ;ss chuckola dynamite
    ldrb r1, [r0]
    mov r2, #0x10
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004317 ;beanbean map cutscene + Bowsers castle door
    ldrb r1, [r0]
    mov r2, #0x6
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043FF ;Bowsers castle door
    ldrb r1, [r0]
    mov r2, #0x10
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
    mov r2, #0xE
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004406
    ldrb r1, [r0]
    mov r2, #0x10
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
    ldr r0, =0x020043E9 ;sewer_4
    ldrb r1, [r0]
    mov r2, #0x20
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043EA ;sewer_5
    ldrb r1, [r0]
    mov r2, #0xF
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004526 ; Cola rocks
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
    ldr r0, =0x02004340 ; Post-oasis peasley cutscene flag + south of pipe 8 cutscene
    ldrb r1, [r0]
    mov r2, #0x14
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020042FC ; Wiggler speed-up + Skip castle town first entry cutscene
    ldrb r1, [r0]
    mov r2, #0x98
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004741 ; Continue from castle
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004410 ; Chuckleroot Grandaughter Gate Flag
    ldrb r1, [r0]
    mov r2, #0x7
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x02004374
    ldrb r1, [r0]
    mov r2, #0xFC
    orr r1, r2
    strb r1, [r0]
    ldrb r1, [r0, #0x1]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    pop pc
    .pool




    .org FAWFUL_FLAGS
    push lr
    ldr r0, =0x020046EC
    mov r1, #0xF
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    ldr r0, =0x02004724
    mov r1, #0x3
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    ldr r0, =0x020043DE
    mov r1, #0x80
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    ldr r0, =0x020042FB
    mov r1, #0x60
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    ldr r0, =0x020042F9
    mov r1, #0x1
    ldrb r2, [r0]
    orr r2, r1
    strb r2, [r0]
    pop pc
    .pool





    .org FAWFUL_BLOCK
    push lr
    bl FAWFUL_FLAGS
    ldr r0, =ROOM
    ldrh r0, [r0]
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
    pop pc
    .pool



    .org STAR_QUEST
    push { r1-r2, lr }
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x3E
    beq .sq_cont
    cmp r0, #0x1F
    bne .xor
    .sq_cont:
    ldr r0, =XOR_RAM
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .quest_skip
    ldr r0, =BEANSTAR_RESTORE
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .quest_skip
    ldr r0, =0x0200490D
    ldrb r2, [r0]
    mov r1, #0xE0
    and r1, r2
    cmp r1, #0xE0
    bne .quest_disable
    ldrb r2, [r0, #0x1]
    mov r1, #0x1
    and r1, r2
    cmp r1, #0x1
    bne .quest_disable
    ldr r0, =0x020046F6
    ldrb r1, [r0]
    mov r2, #0x4F
    xor r2, r1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =XOR_RAM
    strb r2, [r0]
    bl .quest_skip
    .xor:
    ldr r0, =XOR_RAM
    ldrb r1, [r0]
    mov r2, #0x0
    strb r2, [r0]
    ldr r0, =0x020046F6
    ldrb r2, [r0]
    bic r2, r1
    ldr r1, =BEANSTAR_RESTORE
    ldrb r1, [r1]
    orr r2, r1
    strb r2, [r0]
    ldr r1, =BEANSTAR_RESTORE
    mov r0, #0x0
    strb r0, [r1]
    bl .quest_skip
    .quest_disable:
    ldr r0, =0x020046F6
    ldrb r1, [r0]
    mov r2, #0x0
    strb r2, [r0]
    ldr r0, =BEANSTAR_RESTORE
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
    pop { r1-r2, pc }
    .pool





    .org JUMP_TUT
    push lr
    ldr r0, =0x020042F8
    ldrb r1, [r0]
    mov r2, #0x7C
    orr r1, r2
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
    pop pc
    .pool


    .org ULTRA_HAMMERS
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    ldr r1, =0x1D0
    cmp r0, r1
    blt .uh_restore
    ldr r0, =0x0200430B
    ldrb r0, [r0]
    mov r1, #0x8
    and r0, r1
    cmp r0, #0x8
    bne .uh_end
    ldr r0, =0x02004359
    ldrb r0, [r0]
    mov r1, #0x20
    and r0, r1
    cmp r0, #0x20
    beq .uh_end
    ldr r0, =0x0200430B
    ldrb r1, [r0]
    mov r2, #0x8
    bic r1, r2
    strb r1, [r0]
    ldr r0, =UH_RAM
    mov r1, #0x1
    strb r1, [r0]
    bl .uh_end
    .uh_restore:
    ldr r0, =UH_RAM
    ldrb r0, [r0]
    cmp r0, #0x1
    bne .uh_end
    ldr r0, =0x0200430B
    ldrb r1, [r0]
    mov r2, #0x8
    orr r1, r2
    strb r1, [r0]
    .uh_end:
    pop pc
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







    .org SEWER_BLOCK
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x3D
    bne .sewer_end
    ldr r0, =0x0200490A
    mov r1, #0x2
    ldrb r0, [r0]
    and r1, r0
    cmp r1, #0x2
    beq .sewer_end
    ldr r0, =0x02007351
    mov r1, #0x1
    strb r1, [r0]
    .sewer_end:
    pop pc
    .pool




    .org PEACH_KIDNAPPED
    push lr
    ldr r0, =0x0200434C
    ldrb r0, [r0]
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x2
    bne .kidnap_bic
    ldr r0, =0x0200433D
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    bl .kidnap_skip
    .kidnap_bic:
    ldr r0, =0x0200433D
    ldrb r1, [r0]
    mov r2, #0x4
    bic r1, r2
    strb r1, [r0]
    .kidnap_skip:
    ldr r0, =0x0200490E
    ldrb r0, [r0]
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x2
    bne .bestar_skip
    ldr r0, =0x0200433D
    ldrb r1, [r0]
    mov r2, #0x8
    orr r1, r2
    strb r1, [r0]
    .bestar_skip:
    pop pc
    .pool





    .org SPANGLE_SUBR
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0xFF
    bne .spangle_ram
    ldr r0, =0x02008708
    cmp r4, r0
    beq .spangle_end
    ldr r0, =0x0200490E
    ldrb r0, [r0]
    mov r1, #0x4
    and r1, r0
    cmp r1, #0x4
    bne .spangle_clear
    ldr r0, =0x0200434A
    ldrb r1, [r0]
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    beq .spangle_end
    mov r2, #0x40
    orr r1, r2
    strb r1, [r0]
    ldr r0, =SPANGLE_RAM
    strb r2, [r0]
    bl .spangle_end
    .spangle_clear:
    ldr r0, =0x0200434A
    ldrb r1, [r0]
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    bne .spangle_end
    bic r1, r2
    strb r1, [r0]
    ldr r0, =SPANGLE_RAM
    mov r1, #0x40
    strb r1, [r0, #0x1]
    bl .spangle_end
    .spangle_ram:
    ldr r0, =SPANGLE_RAM
    ldrb r1, [r0]
    ldr r2, =0x0200434A
    ldrb r0, [r2]
    bic r0, r1
    strb r0, [r2]
    ldr r0, =SPANGLE_RAM
    ldrb r1, [r0, #0x1]
    ldrb r0, [r2]
    orr r0, r1
    strb r0, [r2]
    ldr r0, =SPANGLE_RAM
    mov r1, #0x0
    strb r1, [r0]
    strb r1, [r0, #0x1]
    .spangle_end:
    pop pc
    .pool





    .org WINKLE_SUBR
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x9E
    bne .winkle_ram
    ldr r0, =0x0200490B
    ldrb r0, [r0]
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x2
    bne .winkle_clear
    ldr r0, =0x0200430C
    ldrb r1, [r0]
    mov r2, #0x80
    and r2, r1
    cmp r2, #0x80
    beq .winkle_end
    mov r2, #0x80
    orr r1, r2
    strb r1, [r0]
    ldr r0, =WINKLE_RAM
    strb r2, [r0]
    bl .winkle_end
    .winkle_clear:
    ldr r0, =0x0200430C
    ldrb r1, [r0]
    mov r2, #0x80
    and r2, r1
    cmp r2, #0x80
    bne .winkle_end
    bic r1, r2
    strb r1, [r0]
    ldr r0, =WINKLE_RAM
    mov r1, #0x80
    strb r1, [r0, #0x1]
    bl .winkle_end
    .winkle_ram:
    ldr r0, =WINKLE_RAM
    ldrb r1, [r0]
    ldr r2, =0x0200430C
    ldrb r0, [r2]
    bic r0, r1
    strb r0, [r2]
    ldr r0, =WINKLE_RAM
    ldrb r1, [r0, #0x1]
    ldrb r0, [r2]
    orr r0, r1
    strb r0, [r2]
    ldr r0, =WINKLE_RAM
    mov r1, #0x0
    strb r1, [r0]
    strb r1, [r0, #0x1]
    .winkle_end:
    pop pc
    .pool





    .org CASTLE_GATES
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x36
    bne .gates_ram
    ldr r0, =0x02004303
    ldrb r1, [r0]
    mov r2, #0x40
    and r2, r1
    cmp r2, #0x40
    beq .gates_end
    mov r2, #0x40
    orr r1, r2
    strb r1, [r0]
    ldr r0, =GATES_RAM
    mov r1, #0x40
    strb r1, [r0]
    bl .gates_end
    .gates_ram:
    ldr r0, =0x02004303
    ldrb r1, [r0]
    ldr r2, =GATES_RAM
    ldrb r2, [r2]
    bic r1, r2
    strb r1, [r0]
    ldr r2, =GATES_RAM
    mov r1, #0x0
    strb r1, [r2]
    .gates_end:
    pop pc
    .pool





    .org ESCORT_FIX
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x41
    bne .escort_ram
    ldr r0, =0x02004303
    mov r2, #0x40
    ldrb r1, [r0]
    and r2, r1
    cmp r2, #0x40
    beq .escort_end
    ldr r0, =PEACH_RAM
    mov r1, #0x1
    strb r1, [r0]
    bl .escort_end
    .escort_ram:
    ldr r0, =PEACH_RAM
    mov r1, #0x0
    strb r1, [r0]
    .escort_end:
    pop pc
    .pool




    .org ESCORT_CUTSCENE
    push lr
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x3E
    beq .escort_start
    cmp r0, #0x1F
    bne .escort_end2
    .escort_start:
    ldr r0, =0x0200430A
    ldrb r1, [r0]
    mov r2, #0x1
    and r2, r1
    cmp r2, #0x1
    beq .escort_end2
    ldrb r1, [r0, #0x1]
    mov r2, #0x10
    and r2, r1
    cmp r2, #0x0
    beq .escort_end2
    mov r2, #0x18
    bic r1, r2
    strb r1, [r0, #0x1]
    ldr r0, =0x02004342
    ldrb r1, [r0]
    mov r2, #0x20
    bic r1, r2
    strb r1, [r0]
    ldr r0, =ESCORT_RAM
    mov r1, #0x1
    strb r1, [r0]
    .escort_end2:
    ldr r0, =0x02004348
    ldrb r0, [r0]
    mov r1, #0x20
    and r1, r0
    cmp r1, #0x20
    bne .escort_end3
    ldr r0, =0x02004364
    ldrb r1, [r0]
    mov r2, #0x40
    orr r1, r2
    strb r1, [r0]
    mov r2, #0xFF
    strb r2, [r0, #0x2]
    mov r2, #0xF0
    ldrb r1, [r0, #0x1]
    orr r1, r2
    strb r1, [r0, #0x1]
    .escort_end3:
    ldr r0, =0x02004342
    ldrb r0, [r0]
    mov r1, #0x10
    and r1, r0
    cmp r1, #0x10
    bne .escort_end4
    ldr r0, =0x0200433D
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]
    .escort_end4:
    pop pc
    .pool




    .org BLABLANADON
    push { r0-r2, lr }
    ldr r0, =0x0200430B
    ldrb r0, [r0]
    mov r1, #0x40
    and r1, r0
    cmp r1, #0x40
    bne .blablanadon_end
    ldr r0, =0x020042F9
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    .blablanadon_end:
    pop { r0-r2, pc }
    .pool




    .org PEACH_ARRIVAL
    push { r0-r2, lr }
    ldr r0, =0x0200433D
    ldrb r0, [r0]
    mov r1, #0x2
    and r1, r0
    cmp r1, #0x2
    bne .arrival_end
    ldr r0, =0x02004309
    ldrb r1, [r0]
    mov r2, #0xC0
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043EB
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    .arrival_end:
    pop { r0-r2, pc }
    .pool






    .org BARREL_MINIGAME
    push { r0-r3, lr }
    ldr r0, =0x0200430A
    ldrb r1, [r0]
    mov r2, #0x2
    orr r1, r2
    strb r1, [r0]
    ldr r0, =ROOM
    ldrh r0, [r0]
    ldr r1, =0x135
    cmp r1, r0
    bne .barrel_mini_end
    ldr r0, =0x0200430A
    ldrb r1, [r0]
    mov r2, #0x20
    and r2, r1
    cmp r2, #0x20
    beq .barrel_mini_end
    ldr r1, =0x0200490B
    ldrb r2, [r1]
    mov r3, #0x1
    and r3, r2
    cmp r3, #0x1
    bne .barrel_mini_end
    ldrb r1, [r0]
    mov r2, #0x20
    orr r1, r2
    strb r1, [r0]
    ldr r0, =BARREL_RAM
    mov r1, #0x1
    strb r1, [r0]
    .barrel_mini_end:
    ldr r0, =ROOM
    ldrh r1, [r0]
    ldr r2, =0x135
    cmp r2, r1
    beq .barrel_restore_skip
    ldr r0, =BARREL_RAM
    ldrb r0, [r0]
    cmp r0, #0x0
    beq .barrel_restore_skip
    ldr r0, =0x0200430A
    ldrb r1, [r0]
    mov r2, #0x20
    bic r1, r2
    strb r1, [r0]
    ldr r0, =BARREL_RAM
    mov r1, #0x0
    strb r1, [r0]
    .barrel_restore_skip:
    pop { r0-r3, pc }
    .pool




    .org KOOPA_BLOCK_SUBR
    push { r0-r5, lr }
    ldr r0, =KOOPA_BLOCK_DATA + 1
    mov r1, pc
    bx r0
    pop r0-r5
    str r1, [r4, #0xC]
    str r2, [r4, #0x10]
    pop pc
    .pool




    .org KOOPA_BLOCK_DATA
    push r1
    ldr r0, =PEARL_SPOIL_RAM
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =YOSHI_DISPLAY_RAM
    mov r1, #0x0
    strb r1, [r0]
    bl SPANGLE_SUBR
    bl WINKLE_SUBR
    bl PEACH_KIDNAPPED
    bl JUMP_TUT
    bl EGG_CHECK
    bl STAR_QUEST
    bl ABILITY_CHECK
    bl TUTOR_BLOCK
    bl OCEAN_BLOCK
    bl SCROLL_CHECK
    bl ROCK_BLOCK
    bl FAWFUL_BLOCK
    bl CASTLE_GATES
    bl ESCORT_FIX
    bl SEWER_BLOCK
    bl ESCORT_CUTSCENE
    bl BLABLANADON
    bl PEACH_ARRIVAL
    bl ULTRA_HAMMERS
    ldr r0, =FAWFUL_STONE
    ldrb r0, [r0]
    mov r1, #0x1
    lsl r1, #0x3
    orr r0, r1
    ldr r1, =FAWFUL_STONE
    strb r0, [r1]
    ldr r0, =ROOM
    ldrh r0, [r0]
    ldr r1, =0x1D5
    cmp r0, r1
    bge .restore_skip
    cmp r0, #0xFD
    beq .restore_skip
    bl PEARL_RESTORE
    .restore_skip:
    ldr r0, =ROOM
    ldrb r0, [r0]
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
    cmp r0, #0x87
    beq .barrel_block2
    cmp r0, #0xCD
    beq .coral_fix
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

    .membership_block2:
    bl .membership_block

    .barrel_block2:
    bl .barrel_block

    .coral_fix:
    ldr r0, =ROOM
    ldrb r0, [r0, #0x1]
    cmp r0, #0x0
    bne .koopa_norm
    ldr r0, =0x02004349
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043ED
    ldrb r1, [r0]
    mov r2, #0x1
    orr r1, r2
    strb r1, [r0]
    ldr r0, =0x020043F1
    ldrb r1, [r0]
    mov r2, #0x20
    orr r1, r2
    strb r1, [r0]
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
    ldr r0, =BROS_OPTIONS
    ldrb r0, [r0]
    cmp r0, #0x1
    beq .koopa_norm
    ldr r0, =0x020042FD
    ldrb r1, [r0]
    mov r2, #0x4
    orr r1, r2
    strb r1, [r0]

    .koopa_norm:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x1F
    beq .escort_ram_skip
    cmp r0, #0x3E
    beq .escort_ram_skip
    ldr r0, =ESCORT_RAM
    ldrb r1, [r0]
    cmp r1, #0x1
    bne .escort_ram_skip
    mov r1, #0x0
    strb r1, [r0]
    ldr r0, =0x0200430B
    ldrb r1, [r0]
    mov r2, #0x18
    orr r1, r2
    strb r1, [r0]
    .escort_ram_skip:
    ldr r0, =ROOM
    ldrh r0, [r0]
    cmp r0, #0x87
    beq .barrel_skip
    ldr r0, =BROS_OPTIONS
    ldrb r0, [r0]
    cmp r0, #0x1
    beq .barrel_skip
    ldr r0, =0x020042FD
    ldrb r1, [r0]
    mov r2, #0x4
    bic r1, r2
    strb r1, [r0]
    .barrel_skip:
    bl BARREL_MINIGAME
    pop r1
    add r1, #0x1
    bx r1
    .pool

    .close