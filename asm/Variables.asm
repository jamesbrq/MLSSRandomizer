    ; RAM_VALUES
    HAMMER_TEXT_RAM equ 0x02003000
    XOR_RAM equ 0x02003001
    BEANSTAR_RESTORE equ 0x02003002
    UH_RAM equ 0x02003003
    BROOCH_RAM equ 0x02003008
    AB_RAM equ 0x02003009
    QUEEN_RAM equ 0x0200300A
    YOSHI_DISPLAY_RAM equ 0x0200300B
    SPANGLE_RAM equ 0x0200300D ;  2 BYTES
    GATES_RAM equ 0x0200300C
    FRUIT_REMOVE_RAM equ 0x02003010
    WINKLE_RAM equ 0x02003014 ; 2 BYTES
    REMOVE_RAM equ 0x02003016
    PEARL_SPOIL_RAM equ 0x02003018
    BARREL_RAM equ 0x0200301C
    SHOP_RAM equ 0x02003021
    SHOP_DESC_RAM equ 0x02003022
    SHOP_TEXT_RAM equ 0x02003024
    CORAL_RAM equ 0x02003025
    SHOP_INJECT_RAM equ 0x02003027
    BEAN_RAM equ 0x02003028
    PEARL_RAM equ 0x0200302F
    PRICE_RAM equ 0x02003030
    FAWFUL_RAM equ 0x02003040
    AP_INIT_L equ 0x0200304B
    AP_RAM_L equ 0x0200304C
    AP_READ equ 0x02003057
    AP_READ_INIT equ 0x02003058
    AP_LOGO equ 0x02003060
    TATTLE_TEXT equ 0x02003080
    H_RAM equ 0x0200308F
    ESCORT_RAM equ 0x02003090
    KEY_ITEM_RAM equ 0x02003070
    BROS_ITEM_BUFFER equ 0x02003074
    TEXT_RAM equ 0x02003078
    CARD_RAM equ 0x0200307C
    CHUCKOLA_RAM equ 0x020030A1
    BROS_RAM equ 0x020030A4
    HAMMER_RAM equ 0x020030A5
    PEACH_RAM equ 0x020030A9
    TUTOR_RAM equ 0x020030AB
    HAND_TEXT_RAM equ 0x020030AC
    BLAB_RAM equ 0x0200302E
    EMBLEMS equ 0x0200430B






    BROS_TATTLE equ 0x080FF384
    ULTRA_MUSHROOM_TEXT equ 0x08E04A00
    NUT_TEXT equ 0x08E04A40
    SUPER_NUT_TEXT equ 0x08E04A80
    ULTRA_NUT_TEXT equ 0x08E04AC0
    SYRUP_TEXT equ 0x08E04B00
    SUPER_SYRUP_TEXT equ 0x08E04B40
    ULTRA_SYRUP_TEXT equ 0x08E04B80
    REFRESHING_HERB_TEXT equ 0x08E04BC0
    UNKNOWN_FIX equ 0x08483210
    THUNDER_FIX equ 0x08478570
    FIRE_FIX equ 0x084785A4
    BPIECE_FIX_HOOK equ 0x080EA322
    BPIECE_FIX_SUBR equ 0x081DFC10
    BEANSTAR_OPTION equ 0x08D00004
    MAP_FIX equ 0x082469A3
    FRUIT_FIX equ 0x08489220
    HAMMER_FIX equ 0x083ECC98
    SHAMMER_FIX equ 0x08401108
    UHAMMER_FIX equ 0x08401130
    SCROLL_FIX1 equ 0x08489584
    SCROLL_FIX2 equ 0x084895AC
    HAMMER_TEXT equ 0x08E04C00
    SUPER_HAMMER_TEXT equ 0x08E04C40
    ULTRA_HAMMER_TEXT equ 0x08E04C80
    FIRE_TEXT equ 0x08E04CC0
    THUNDER_TEXT equ 0x08E04D00
    SCROLL_TEXT1 equ 0x084F3874
    SCROLL_TEXT2 equ 0x084f3888
    HOO_TEXT equ 0x081DF7B0
    CHUCKLE_TEXT equ 0x081DF7C0
    HOONIVERSITY equ 0x02004303
    BRIDGE equ 0x020043E5
    FIRE_1 equ 0x020043EB
    FIRE_2 equ 0x020043EC
    FIRE_3 equ 0x020043F6
    FIRE_4 equ 0x020043ED
    THUNDER_1 equ 0x020043F1
    RUINS equ 0x020043F8
    ROSE_TEXT equ 0x08E04D40
    BROS_TEXTBOX_ARRAY equ 0x08E049B0
    KEY_TEXTBOX_ARRAY equ 0x08E048D0
    ITEM_TEXTBOX_ARRAY equ 0x08E04850
    KEY_ITEM_TEXTBOX_HOOK equ 0x0802645E
    KEY_ITEM_TEXTBOX equ 0x081DF960
    KEY_ITEM_TEXT_ARRAY equ 0x08E045D0
    KEY_ITEM_SHOP_ARRAY equ 0x08E046D0
    BROS_ITEM_SHOP_ARRAY equ 0x08E047D0
    HAMMERS_SHOP equ 0x081DFC70
    SHAMMERS_SHOP equ 0x081DFC74
    UHAMMERS_SHOP equ 0x081DFC78
    FIRE_SHOP equ 0x081DFC7C
    THUNDER_SHOP equ 0x081DFCA0
    HAMMERS_SHOP2 equ 0x081DFCA4
    SHAMMERS_SHOP2 equ 0x081DFCA8
    UHAMMERS_SHOP2 equ 0x081DFCAC
    FIRE_SHOP2 equ 0x081DFCB0
    THUNDER_SHOP2 equ 0x081DFCB8
    HAMMERS_SHOPNAME equ 0x081DFCC0
    SHAMMERS_SHOPNAME equ 0x081DFCD0
    UHAMMERS_SHOPNAME equ 0x081DFCE0
    FIRE_SHOPNAME equ 0x081DFCF0
    THUNDER_SHOPNAME equ 0x081DFD00
    BEAN_ITEM_SHOP_ARRAY equ 0x08E04800
    TEXT_ADDRESS equ 0x083BC6B8
    KEY_ITEM_B_HOOK equ 0x08116A2E
    KEY_ITEM_B_SUBR equ 0x081DF800
    DOOR_SUBR equ 0x081DF830
    DOOR_HOOK equ 0x0804A42C
    DOOR_LOC equ 0x083AC2C8
    EVENT_BLOCKER_HOOK equ 0x0804A072
    EVENT_BLOCKER_SUBR equ 0x081DF850
    KEY_ITEM_FIX_HOOK equ 0x080EA308
    KEY_ITEM_FIX_SUBR equ 0x081DFBC0
    TEXT_ITEM_BLOCK_HOOK equ 0x0812301A
    TEXT_ITEM_BLOCK_SUBR equ 0x081DF870
    TEXT_ITEM_INJECT_HOOK equ 0x080E5C3A
    TEXT_ITEM_INJECT_SUBR equ 0x081DF8C0
    KOOPA_BLOCK_HOOK equ 0x08047F6A
    KOOPA_BLOCK_SUBR equ 0x081DF8E0
    CHUCKOLA_BLOCK_HOOK equ 0x08047FC6
    CHUCKOLA_BLOCK_SUBR equ 0x081DFBE0
    TREE_BLOCK_HOOK equ 0x08047F88
    TREE_BLOCK_SUBR equ 0x081DF640
    ABILITY_BLOCK_HOOK equ 0x080E99D2
    ABILITY_BLOCK_SUBR equ 0x081DF670
    ABILITY_STORAGE equ 0x081E9400
    EGG_VALUE equ 0x020046F8
    KOOPA_VALUE equ 0x02007340
    FIRE_STONE_VALUE equ 0x020079D8
    FIRE_STONE equ 0x02004409
    FAWFUL_STONE equ 0x020042F9
    CARD equ 0x02007340
    ESPRESSO equ 0x020048F4
    ESPRESSO_TEXT equ 0x08E04820
    WINKLE equ 0x02007340
    BARREL equ 0x02007340
    BARREL2 equ 0x0200768C
    HAMMER equ 0x02004338
    HAND_TUTOR equ 0x020079D8
    WHITE equ 0x02004302
    RED equ 0x02004301
    PURPLE equ 0x020042FE
    DRESS_DOOR equ 0x083AEA1C
    BEANSTAR_DOOR equ 0x083AEA10
    ROOM equ 0x03002330
    BROOCH equ 0x02004300
    QUEEN equ 0x02004303
    MUSHROOM equ 0x020048E2
    KEY_ITEM equ 0x0200490A
    TEXT_ITEM equ 0x02004F5C
    TEXT_VAR equ 0x200
    WHITE_VALUE equ 0x0824FF18
    RED_VALUE equ 0x08250621
    SWING equ 0x0200485F
    CYCLONE equ 0x0200489C
    THUNDER_TEXTBOX equ 0x084EFE7C
    FIRE_TEXTBOX equ 0x084EFE90
    HAMMER_TEXTBOX equ 0x084EA24C
    SHAMMER_TEXTBOX equ 0x084EE194
    UHAMMER_TEXTBOX equ 0x084EE1A8
    FRONT equ 0x02004F4C
    INPUT equ 0x03000389
    MARIO_ACTION equ 0x03002428
    LUIGI_ACTION equ 0x03002440
    HAND_FIX_HOOK equ 0x0802DE84
    HAND_FIX_SUBR equ 0x081DF690
    HAND_FIX2_HOOK equ 0x080E98E2
    HAND_FIX2_SUBR equ 0x081DF6B0
    TEXT_MASH_HOOK equ 0x080189AC
    TEXT_MASH_SUBR equ 0x081DF710
    INTRO_SKIP_HOOK equ 0x0802811A
    INTRO_SKIP_SUBR equ 0x081E0700
    INTRO_DISABLE equ 0x020048FC
    SHOP_RAM_HOOK equ 0x0812E7BC
    SHOP_RAM_SUBR equ 0x081DFA80
    SHOP_TEXT_HOOK equ 0x0812E7D8
    SHOP_TEXT_SUBR equ 0x081DF760
    SHOP_DESC_RAM_HOOK equ 0x0812E316
    SHOP_DESC_RAM_SUBR equ 0x081DF780
    SHOP_DESC_HOOK equ 0x0812E328
    SHOP_DESC_SUBR equ 0x081DF910
    SHOP_PRICE_HOOK equ 0x0812AFEA
    SHOP_PRICE_SUBR equ 0x081DF9D0
    SHOP_INJECT_RAM_HOOK equ 0x0812B5E6
    SHOP_INJECT_RAM_SUBR equ 0x081DFA00
    SHOP_INJECT_HOOK equ 0x0812B60C
    SHOP_INJECT_SUBR equ 0x081DFA20
    HIGH_JUMP equ 0x082484C4
    SPIN_JUMP equ 0x0824881B
    SHOP_FIX equ 0x0812AFD0
    PRICE_INJECT_HOOK equ 0x0812afd2
    PRICE_INJECT_SUBR equ 0x081DFA40
    SHOP_FIX2 equ 0x0812E76E
    FAWFUL_BLOCK equ 0x08E00200
    SPRING_BLOCK_HOOK equ 0x080EB9A0
    SPRING_BLOCK equ 0x081DF9B0
    MOLE_FIX_HOOK equ 0x08122F80
    MOLE_FIX_SUBR equ 0x081DFA60
    MOLE_FLAG_FIX_HOOK equ 0x08122F78
    MOLE_FLAG_FIX_SUBR equ 0x081DFAA0
    MOLE_ADD_FIX_HOOK equ 0x08122F8E
    MOLE_ADD_FIX_SUBR equ 0x081DFEF0
    MOLE_FIX_PANTS_HOOK equ 0x08122F34
    MOLE_FIX_PANTS_SUBR equ 0x081E06C0
    MOLE_FLAG_FIX_PANTS_HOOK equ 0x08122F2C
    MOLE_FLAG_FIX_PANTS_SUBR equ 0x081E06E0
    BROS_OPTIONS equ 0x08D00005 ; 2 BYTES OF DATA
    PEARL_BLOCK equ 0x08E0D000
    PEARL_RFIX_HOOK equ 0x080EA318
    PEARL_RFIX_SUBR equ 0x081DFAE0
    BADGE_HANDLER equ 0x081E0380
    GRASS_FIX equ 0x0823B35F
    BEANLET_FIX equ 0x083facf0
    PRICE_CALC equ 0x08E06900
    GOLDEN_FIX equ 0x08484c24
    FLAG_FIX equ 0x0812B81E
    SPANGLE_FIX equ 0x08488E68
    UP_SUPER_FIX equ 0x08484C50
    FIRST_STRIKE_HOOK equ 0x0802799E
    FIRST_STRIKE_SUBR equ 0x081DFB10
    TEXTBOX_STARTUP equ 0x03002308
    TEXT_WRITING equ 0x02005210
    YOSHI_DISPLAY_HOOK equ 0x0804B21E
    YOSHI_DISPLAY_SUBR equ 0x081E0A10
    YOSHI_ARRAY equ 0x08E045A0
    HP_SCALE_HOOK equ 0x0807B3CC
    HP_SCALE_SUBR equ 0x081E0100
    HP_SCALE_FIX_HOOK equ 0x0807B3D0
    HP_SCALE_FIX_SUBR equ 0x081E0160
    CALC_HEALTH equ 0x081E01C0
    ERANDOM equ 0x08D00002
    FSHOP_FIX equ 0x0812B008
    FBSHOP_FIX equ 0x0812AECC
    FPSHOP_FIX equ 0x0812AF2C
    MEMBERSHIP_FIX equ 0x08401860
    BROS_ROCK_FIX equ 0x08484CC0
    CASTLE_DOOR_FIX equ 0x083AC3A0
    MINIGAME_ENABLE equ 0x081E1EEF
    XP_SCALE_HOOK equ 0x0807B564
    XP_SCALE_SUBR equ 0x081E0B30
    GUFAWHA_SKIP_ETR equ 0x083AE2DC
    GUFAWHA_SKIP_EXIT equ 0x083AE300
    HSPRITE_FIX_HOOK equ 0x08040466
    HSPRITE_FIX_SUBR equ 0x081DFB50
    FAWFUL_FLAGS equ 0x08E00000
    YOSHI_TEXT_FIX_HOOK equ 0x080E9BF4
    YOSHI_TEXT_FIX_SUBR equ 0x081DFB90
    SPANGLE_SUBR equ 0x08E00100
    CASTLE_GATES equ 0x08E00300
    WINKLE_SUBR equ 0x08E00400
    DOOR_DATA equ 0x08E00500
    ESCORT_FIX equ 0x08E00650
    MINIGAME_SPOILER equ 0x08E006C0
    SEWER_BLOCK equ 0x08E00890
    ROCK_BLOCK equ 0x08E00900
    SCROLL_CHECK equ 0x08E00B70
    OCEAN_BLOCK equ 0x08E00C00
    TUTOR_BLOCK equ 0x08E00D00
    ABILITY_CHECK equ 0x08E00E00
    STAR_QUEST equ 0x08E01020
    EGG_CHECK equ 0x08E01100
    JUMP_TUT equ 0x081DFE50
    PEACH_KIDNAPPED equ 0x08E01400
    ABILITY_BLOCK_DATA equ 0x08E01500
    BROS_ITEM_SUBR equ 0x08E09000
    TEXT_MASH_DATA equ 0x08E01C00
    SAVE_BLOCK equ 0x08E01DC0
    MOVES_CHECK equ 0x08E01E00
    KEY_ITEM_B_DATA equ 0x08E02000
    TEXT_ITEM_INJECT_DATA equ 0x08E02200
    BEANSTAR_TEXT equ 0x08E02500
    TEXT_ITEM_SUBR equ 0x08E02600
    HAMMER_TEXT_SUBR equ 0x08E02700
    TEXTBOX_REPLACE_SUBR equ 0x08E02800
    TEXT_KEY_ITEM equ 0x08E02900
    YOSHI_DISPLAY_DATA equ 0x08E04E00
    DISPLAY_TEXTBOX equ 0x08E05000
    ROSE_FIX equ 0x08E05100
    KEY_ITEM_FIX_DATA equ 0x08E05300
    EVENT_BLOCKER_DATA equ 0x08E05500
    TREE_BLOCK_DATA equ 0x08E05600
    CHUCKOLA_BLOCK_DATA equ 0x08E05800
    SPRING_BLOCK_DATA equ 0x08E05900
    SHOP_DESC_DATA equ 0x08E05A00
    SHOP_TEXT_DATA equ 0x08E05B00
    SHOP_INJECT_DATA equ 0x08E05C00
    RUINS_DOORS equ 0x08E05DB0
    KOOPA_BLOCK_DATA equ 0x08E05E00
    PEARL_RESTORE equ 0x08E06700
    HAND_FIX_DATA equ 0x08E06800
    INTRO_FIX_DATA equ 0x08E06C00
    ORANGE_FIX_HOOK equ 0x0801EBF6
    ORANGE_FIX_SUBR equ 0x081DFF70
    DRESS_TEXT_E equ 0x083FADA5
    DRESS_TEXT_D equ 0x083FADAB
    BEANSTAR_TEXT_F equ 0x083FAD77
    HINT_TOKENS equ 0x02004908
    POW_SCALE_HOOK equ 0x0810DD9C
    POW_SCALE_SUBR equ 0x081DFF90
    ESCORT_CUTSCENE equ 0x08E00F60
    SPOIL_TEXT equ 0x08E06C00
    PEARL_SPOILER equ 0x08E06D00
    ROSE_WARNING equ 0x08E09F00
    CHUCKLISSA_WARNING equ 0x08E09F50
    WARNING equ 0x08E0A000
    PIRANHA_BEAN_PATCH equ 0x0822CE93
    BLABLANADON equ 0x08E0A100
    SHOP_SPRITE_MINI_HOOK equ 0x0812DBFA
    SHOP_SPRITE_MINI_SUBR equ 0x081E08A0
    SHOP_SPRITE_HOOK equ 0x0812DA32
    SHOP_SPRITE_SUBR equ 0x081E0900
    MOVE_REMOVER equ 0x08E06B00
    PEACH_ARRIVAL equ 0x08E02190
    BARREL_MINIGAME equ 0x08E04F00
    HP_SPOIL_HOOK equ 0x080FFFBA
    HP_SPOIL equ 0x081E09A0
    CURSOR_X equ 0x0203F738
    TATTLE_INIT_HOOK equ 0x080FEC2C
    TATTLE_INIT equ 0x081E0090
    POSITION_COMPARE_HOOK equ 0x080FFFA6
    POSITION_COMPARE equ 0x081E0000
    WRITE_HP equ 0x081E0A30
    AP_SHOP equ 0x0812AFBA
    AP_SHOP_SUBR equ 0x081DFDE0
    AP_ITEM equ 0x08D053A0
    AP_TEXT_BOX equ 0x081DF600
    AP_TEXT_EVENT equ 0x081DF610
    AP_SHOP_HOOK equ 0x081DF730
    AP_SHOP2 equ 0x081DF740
    ESPRESSO_SPRITE_HOOK equ 0x080E9752
    ESPRESSO_SPRITE_SUBR equ 0x081DFD20
    FRONT_BRO equ 0x02004F4C
    MARIO_VALUE equ 0x02006C14
    LUIGI_VALUE equ 0x02006FB0
    CUTSCENE_ACTIVE_ONE equ 0x02004AC4
    CUTSCENE_ACTIVE_TWO equ 0x02004B6C
    EXTRA_PIPES equ 0x08D00001
    XP_MUL equ 0x08D00003
    DEF_SCALE_HOOK equ 0x0807B3E2
    DEF_SCALE_SUBR equ 0x081E0500
    ULTRA_HAMMERS equ 0x08E01700
    TRUNKLE_TEXT_HOOK equ 0x084F24C4
    TRUNKLE_TEXT equ 0x08E0B000
    EMBLEM_TEXT_BOX equ 0x081DF660
    EMBLEM_TEXT_EVENT equ 0x081E0300
    EMBLEM_SHOP_HOOK equ 0x081E0400
    EMBLEM_SHOP2 equ 0x081E0410
    EMBLEM_TEXT_HOOK equ 0x0811F4EC
    EMBLEM_DESC_HOOK equ 0x0811F216
    EMBLEM_DESC_SUBR equ 0x081E0570
    EMBLEM_TEXT_SUBR equ 0x081E03C0
    EMBLEM_TEXT_FIX_HOOK equ 0x08116C86
    EMBLEM_TEXT_FIX_SUBR equ 0x081E0550
    EMBLEM_INV_HOOK equ 0x081E0440
    EMBLEM_INV_HOOK2 equ 0x081E0444
    EMBLEM_INV_TEXT equ 0x081E0450
    EMBLEM_SELL_BLOCK_HOOK equ 0x08116C72
    EMBLEM_SELL_BLOCK_SUBR equ 0x081E0650
    EMBLEM_OPTION equ 0x08D00008
    EMBLEM_REQUIRED equ 0x08D00009