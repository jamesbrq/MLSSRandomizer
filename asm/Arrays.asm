BADGE_BOX_ARRAY equ 0x081e1A20
BADGE_TEXT_ARRAY equ 0x081e1870
BADGE_SHOP_ARRAY equ 0x081e16D0
CASTLE_BADGE equ 0x081e16A0
PEA_BADGE equ 0x081e1670
COUNTER_BADGE equ 0x081e1640
CHARITY_BADGE equ 0x081e1610
BROS_BADGE equ 0x081e15E0
MIRACLE_BADGE equ 0x081e15B0
OHORACLE_BADGE equ 0x081e1580
MUSH_BADGE equ 0x081e1550
MARILUI_BADGE equ 0x081e1520
MUSCLE_BADGE equ 0x081e14F0
SPINYAA_BADGE equ 0x081e14C0
MUSHA_BADGE equ 0x081e1490
GRAB_BADGE equ 0x081e1460
MUSHAA_BADGE equ 0x081e1430
POWER_BADGE equ 0x081e1400
WONDER_BADGE equ 0x081e13D0
BEAUTY_BADGE equ 0x081e13A0
SALVAGE_BADGE equ 0x081e1370
OHPAH_BADGE equ 0x081e1340
BRILLIANT_BADGE equ 0x081e1310
SARGE_BADGE equ 0x081e12E0
GENERAL_BADGE equ 0x081e12B0
TANK_BADGE equ 0x081e1280
SCHOOL_EMBLEM equ 0x081e1250
STEADY_BADGE equ 0x081e1220
OHOJEE_SYMBOL equ 0x081e11F0
SPINYA_BADGE equ 0x081e11C0
BROS_LIFE equ 0x081e1190
PIRANHA_SWING equ 0x081e1160
LUCKY_RIBBON equ 0x081e1130
HAND_AURA equ 0x081e1100
SLEDGE_HEART equ 0x081e10D0
LUCKY_BROS equ 0x081e10A0
BROS_RESPECT equ 0x081e1070
BOWSER_FIST equ 0x081e1040
SPIKE_BADGE equ 0x081e1010
CHUCKOLA_BADGE equ 0x081e0FE0
WORK_PANTS equ 0x081e0FB0
WORK_JEANS equ 0x081e0F80
BEAN_PANTS equ 0x081e0F50
BEAN_TROUSERS equ 0x081e0F20
BLUE_JEANS equ 0x081e0EF0
PARASOL_PANTS equ 0x081e0EC0
HARD_PANTS equ 0x081e0E90
HEART_JEANS equ 0x081e0E60
PLAID_TROUSERS equ 0x081e0E30
ONE_TROUSERS equ 0x081e0E00
SAFETY_SLACKS equ 0x081e0DD0
SHROOM_PANTS equ 0x081e0DA0
SHROOM_BELLS equ 0x081e0D70
SHROOM_SLACKS equ 0x081e0D40
PEACHY_JEANS equ 0x081e0D10
MUSHWIN_PANTS equ 0x081e0CE0
MUSHLUCK_PANTS equ 0x081e0CB0
SCANDAL_JEANS equ 0x081e0C80
STREET_JEANS equ 0x081e0C50
TROPIC_SLACKS equ 0x081e0C20
HERMETIC_PANTS equ 0x081e0BF0
BEANSTAR_PANTS equ 0x081e0BC0
PEASLEY_SLACKS equ 0x081e0790
QUEENB_JEANS equ 0x081e07C0
BBRAND_JEANS equ 0x081e07F0
HEART_SLACKS equ 0x081e0820
CASUAL_SLACKS equ 0x081e0850
BUBBLES_GEAR equ 0x081e0880
CHUCKOLA_PANTS equ 0x081e08B0
SMART_PANTS equ 0x081e1D40
SCHOOL_SLACKS equ 0x081e1D70
OHOJEE_WEAR equ 0x081e1DA0
PIRANHA_SUIT equ 0x081e1DD0
ANUBOO_JEANS equ 0x081e1E00
ANCIENT_PANTS equ 0x081e1E30
HEAVY_SLACKS equ 0x081e1E60
LIGHT_SLACKS equ 0x081e1E90
JEANIE_JEANS equ 0x081e1EC0
RANDOM_SLACKS equ 0x081e08E0
JEANIEST_JEANS equ 0x081e0910
SAFE_GUARD equ 0x081e0940
PRICE_ARRAY equ 0x081E0270
BADGE_PRICE_ARRAY equ 0x081E02B0
KEY_ITEM_NORM_ARRAY equ 0x081DEBA0
KEY_ITEM_ESPRESSO_ARRAY equ 0x081DDAF0
KEY_ITEM_BEAN_ARRAY equ 0x081DDB10

.org KEY_ITEM_NORM_ARRAY
	dw 0x08202f8a
	dw 0x08202fb4
	dw 0x082031b4
	dw 0x08202fe2
	dw 0x08203005
	dw 0x0820302b
	dw 0x082031df
	dw 0x08203055
	dw 0x0820307e
	dw 0x082030ac
	dw 0x08203210
	dw 0x082030de
	dw 0x0820314f
	dw 0x08203180
	dw 0x08203249
	dw 0x08203115
	dw 0x08203280
	dw 0x082032ae

.org KEY_ITEM_ESPRESSO_ARRAY
	dw 0x082032d8
	dw 0x08203300
	dw 0x08203328
	dw 0x08203354
	dw 0x08203380
	dw 0x082033a4
	dw 0x082033c8

.org KEY_ITEM_BEAN_ARRAY
	dw 0x082070c6
	dw 0x0820710a

.org PRICE_ARRAY
	dh 0x0018
	dh 0x003C
	dh 0x0064
	dh 0x00B4
	dh 0x0032
	dh 0x005A
	dh 0x008C
	dh 0x00DC
	dh 0x0018
	dh 0x0032
	dh 0x0050
	dh 0x0096
	dh 0x0050
	dh 0x00F0
	dh 0x00F0
	dh 0x001E
	dh 0x00C8
	dh 0x00C8
	dh 0x0190
	dh 0x0190
	dh 0x0190
	dh 0x0190
	dh 0x0190
	dh 0x0190
	dh 0x0190

.org BADGE_PRICE_ARRAY
	dh 0x0028
	dh 0x004B
	dh 0x005A
	dh 0x004E
	dh 0x008C
	dh 0x008C
	dh 0x0096
	dh 0x0078
	dh 0x0082
	dh 0x00A0
	dh 0x00BE
	dh 0x00DC
	dh 0x0118
	dh 0x012C
	dh 0x0190
	dh 0x01E0
	dh 0x00A0
	dh 0x008C
	dh 0x00C8
	dh 0x0140
	dh 0x0118
	dh 0x015E
	dh 0x012C
	dh 0x015E
	dh 0x0190
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0320
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0028
	dh 0x0028
	dh 0x0064
	dh 0x0082
	dh 0x00DC
	dh 0x00B4
	dh 0x0082
	dh 0x0078
	dh 0x012C
	dh 0x00FA
	dh 0x00DC
	dh 0x00C8
	dh 0x017C
	dh 0x00FA
	dh 0x0118
	dh 0x0108
	dh 0x0102
	dh 0x0118
	dh 0x0190
	dh 0x0118
	dh 0x012C
	dh 0x01F4
	dh 0x01C2
	dh 0x0226
	dh 0x0258
	dh 0x0208
	dh 0x0226
	dh 0x0078
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0008
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0064
	dh 0x0258
	dh 0x0258
	dh 0x0258
	dh 0x0258
	dh 0x0258
	dh 0x0258
	dh 0x0258

.org BADGE_BOX_ARRAY
	dw 0x082074c3
	dw 0x08207c1b
	dw 0x082074ef
	dw 0x08207c43
	dw 0x08207517
	dw 0x08207547
	dw 0x0820757b
	dw 0x082075af
	dw 0x082075e3
	dw 0x08207617
	dw 0x08207647
	dw 0x08207677
	dw 0x082076a7
	dw 0x082076db
	dw 0x0820770f
	dw 0x0820773b
	dw 0x08207773
	dw 0x082077a7
	dw 0x082077db
	dw 0x0820780b
	dw 0x0820783f
	dw 0x08207873
	dw 0x082078ab
	dw 0x082078d3
	dw 0x0820790b
	dw 0x0820793f
	dw 0x0820796f
	dw 0x082079ab
	dw 0x082079df
	dw 0x08207a17
	dw 0x08207a3b
	dw 0x08207a73
	dw 0x08207aa3
	dw 0x082076db
	dw 0x08207ad7
	dw 0x08207aff
	dw 0x08207b33
	dw 0x08207b67
	dw 0x08207b77
	dw 0x08207b83
	dw 0x08207bb3
	dw 0x08207be7
	dw 0x08207c7b
	dw 0x08207caf
	dw 0x08209f8f
	dw 0x08209fbf
	dw 0x08209fef
	dw 0x0820a01f
	dw 0x0820a81b
	dw 0x0820a2a3
	dw 0x0820a84f
	dw 0x0820a08f
	dw 0x0820a887
	dw 0x0820a0c3
	dw 0x0820a0f3
	dw 0x0820a12b
	dw 0x0820a163
	dw 0x0820a197
	dw 0x0820a1cb
	dw 0x0820a203
	dw 0x0820a237
	dw 0x0820a26f
	dw 0x0820a2d3
	dw 0x0820a307
	dw 0x0820a33f
	dw 0x0820a057
	dw 0x0820a377
	dw 0x0820a3ab
	dw 0x0820a3e3
	dw 0x0820a417
	dw 0x0820a44f
	dw 0x0820a8bf
	dw 0x0820a8ef
	dw 0x0820a487
	dw 0x0820a4b7
	dw 0x0820a4f3
	dw 0x0820a523
	dw 0x0820a557
	dw 0x0820a58f
	dw 0x0820a5c7
	dw 0x0820a5fb
	dw 0x0820a623
	dw 0x0820a65b
	dw 0x0820a697
	dw 0x0820a6cf
	dw 0x0820a707
	dw 0x0820a73f
	dw 0x0820a777
	dw 0x0820a7af
	dw 0x0820a7e3
	dw 0x0820ccb7
	dw 0x0820cd23
	dw 0x0820cdf7
	dw 0x0820ccef
	dw 0x0820cd97
	dw 0x0820cdcb
	dw 0x0820cd5b
.pool

.org BADGE_TEXT_ARRAY
	dw 0x084890e4
	dw CASTLE_BADGE
	dw PEA_BADGE
	dw 0x084841a4
	dw COUNTER_BADGE
	dw CHARITY_BADGE
	dw BROS_BADGE
	dw MIRACLE_BADGE
	dw OHORACLE_BADGE
	dw MUSH_BADGE
	dw MARILUI_BADGE
	dw MUSCLE_BADGE
	dw SPINYAA_BADGE
	dw MUSHA_BADGE
	dw GRAB_BADGE
	dw MUSHAA_BADGE
	dw POWER_BADGE
	dw WONDER_BADGE
	dw BEAUTY_BADGE
	dw SALVAGE_BADGE
	dw OHPAH_BADGE
	dw BRILLIANT_BADGE
	dw SARGE_BADGE
	dw GENERAL_BADGE
	dw TANK_BADGE
	dw SCHOOL_EMBLEM
	dw STEADY_BADGE
	dw OHOJEE_SYMBOL
	dw SPINYA_BADGE
	dw BROS_LIFE
	dw PIRANHA_SWING
	dw 0x08484cc0
	dw LUCKY_RIBBON
	dw MUSHA_BADGE
	dw 0x08484ce4
	dw 0x08484d0c
	dw HAND_AURA
	dw SLEDGE_HEART
	dw LUCKY_BROS
	dw BROS_RESPECT
	dw BOWSER_FIST
	dw 0x08484d60
	dw SPIKE_BADGE
	dw CHUCKOLA_BADGE
	dw WORK_PANTS
	dw WORK_JEANS
	dw BEAN_PANTS
	dw BEAN_TROUSERS
	dw BLUE_JEANS
	dw PARASOL_PANTS
	dw HARD_PANTS
	dw HEART_JEANS
	dw PLAID_TROUSERS
	dw ONE_TROUSERS
	dw SAFETY_SLACKS
	dw SHROOM_PANTS
	dw SHROOM_BELLS
	dw SHROOM_SLACKS
	dw PEACHY_JEANS
	dw MUSHWIN_PANTS
	dw MUSHLUCK_PANTS
	dw SCANDAL_JEANS
	dw STREET_JEANS
	dw TROPIC_SLACKS
	dw HERMETIC_PANTS
	dw BEANSTAR_PANTS
	dw PEASLEY_SLACKS
	dw QUEENB_JEANS
	dw BBRAND_JEANS
	dw HEART_SLACKS
	dw CASUAL_SLACKS
	dw BUBBLES_GEAR
	dw CHUCKOLA_PANTS
	dw SMART_PANTS
	dw SCHOOL_SLACKS
	dw OHOJEE_WEAR
	dw 0x08484d88
	dw 0x08484dac
	dw PIRANHA_SUIT
	dw ANUBOO_JEANS
	dw ANCIENT_PANTS
	dw HEAVY_SLACKS
	dw LIGHT_SLACKS
	dw 0x08484dd0
	dw JEANIE_JEANS
	dw 0x08484df8
	dw RANDOM_SLACKS
	dw JEANIEST_JEANS
	dw SAFE_GUARD
	dw 0x08484e20
	dw 0x08487c98
	dw 0x08487c14
	dw 0x08484f28
	dw 0x08487bc4
	dw 0x08487bec
	dw 0x08487c6c
	dw 0x08487c3c
.pool

.org BADGE_SHOP_ARRAY
	dw 0x083bd4d4
	dw 0x083bd7f4
	dw 0x083bd4e8
	dw 0x083bd808
	dw 0x083bd4fc
	dw 0x083bd510
	dw 0x083bd524
	dw 0x083bd538
	dw 0x083bd54c
	dw 0x083bd560
	dw 0x083bd574
	dw 0x083bd588
	dw 0x083bd59c
	dw 0x083bd5b0
	dw 0x083bd5c4
	dw 0x083bd5d8
	dw 0x083bd5ec
	dw 0x083bd600
	dw 0x083bd614
	dw 0x083bd628
	dw 0x083bd63c
	dw 0x083bd650
	dw 0x083bd664
	dw 0x083bd678
	dw 0x083bd68c
	dw 0x083bd6a0
	dw 0x083bd6b4
	dw 0x083bd6c8
	dw 0x083bd6dc
	dw 0x083bd6f0
	dw 0x083bd704
	dw 0x083bd718
	dw 0x083bd72c
	dw 0x083bd740
	dw 0x083bd754
	dw 0x083bd768
	dw 0x083bd77c
	dw 0x083bd790
	dw 0x083bd7a4
	dw 0x083bd7b8
	dw 0x083bd7cc
	dw 0x083bd7e0
	dw 0x083bd81c
	dw 0x083bd830
	dw 0x083be2e4
	dw 0x083be2f8
	dw 0x083be30c
	dw 0x083be320
	dw 0x083be618
	dw 0x083be410
	dw 0x083be62c
	dw 0x083be348
	dw 0x083be640
	dw 0x083be35c
	dw 0x083be370
	dw 0x083be384
	dw 0x083be398
	dw 0x083be3ac
	dw 0x083be3c0
	dw 0x083be3d4
	dw 0x083be3e8
	dw 0x083be3fc
	dw 0x083be424
	dw 0x083be438
	dw 0x083be44c
	dw 0x083be334
	dw 0x083be460
	dw 0x083be474
	dw 0x083be488
	dw 0x083be49c
	dw 0x083be4b0
	dw 0x083be654
	dw 0x083be668
	dw 0x083be4c4
	dw 0x083be4d8
	dw 0x083be4ec
	dw 0x083be500
	dw 0x083be514
	dw 0x083be528
	dw 0x083be53c
	dw 0x083be550
	dw 0x083be564
	dw 0x083be578
	dw 0x083be58c
	dw 0x083be5a0
	dw 0x083be5b4
	dw 0x083be5c8
	dw 0x083be5dc
	dw 0x083be5f0
	dw 0x083be604
	dw 0x083beb2c
	dw 0x083beb54
	dw 0x083beba4
	dw 0x083beb40
	dw 0x083beb7c
	dw 0x083beb90
	dw 0x083beb68
.pool

.org CASTLE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X43, 0X61, 0X73, 0X74, 0X6C, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PEA_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X50, 0X65, 0X61, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org COUNTER_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X43, 0X6F, 0X75, 0X6E, 0X74, 0X65, 0X72, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org CHARITY_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X43, 0X68, 0X61, 0X72, 0X69, 0X74, 0X79, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BROS_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X72, 0X6F, 0X73, 0X2E, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MIRACLE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4D, 0X69, 0X72, 0X61, 0X63, 0X6C, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org OHORACLE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X6E, 0X20, 0X4F, 0X68, 0X6F, 0X72, 0X61, 0X63, 0X6C, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MUSH_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4D, 0X75, 0X73, 0X68, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MARILUI_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4D, 0X61, 0X72, 0X69, 0X2D, 0X4C, 0X75, 0X69, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MUSCLE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4D, 0X75, 0X73, 0X63, 0X6C, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SPINYAA_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X70, 0X69, 0X6E, 0X79, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X20, 0X41, 0X41, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MUSHA_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4D, 0X75, 0X73, 0X68, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X20, 0X41, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org GRAB_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X47, 0X72, 0X61, 0X62, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MUSHAA_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4D, 0X75, 0X73, 0X68, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X20, 0X41, 0X41, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org POWER_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X50, 0X6F, 0X77, 0X65, 0X72, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org WONDER_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X57, 0X6F, 0X6E, 0X64, 0X65, 0X72, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BEAUTY_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X65, 0X61, 0X75, 0X74, 0X79, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SALVAGE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X61, 0X6C, 0X76, 0X61, 0X67, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org OHPAH_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X6E, 0X20, 0X4F, 0X68, 0X2D, 0X50, 0X61, 0X68, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BRILLIANT_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X72, 0X69, 0X6C, 0X6C, 0X69, 0X61, 0X6E, 0X74, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SARGE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X61, 0X72, 0X67, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org GENERAL_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X47, 0X65, 0X6E, 0X65, 0X72, 0X61, 0X6C, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org TANK_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X54, 0X61, 0X6E, 0X6B, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SCHOOL_EMBLEM
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X63, 0X68, 0X6F, 0X6F, 0X6C, 0X20, 0X45, 0X6D, 0X62, 0X6C, 0X65, 0X6D, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org STEADY_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X74, 0X65, 0X61, 0X64, 0X79, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org OHOJEE_SYMBOL
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X6E, 0X20, 0X4F, 0X68, 0X6F, 0X20, 0X4A, 0X65, 0X65, 0X20, 0X53, 0X79, 0X6D, 0X62, 0X6F, 0X6C, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SPINYA_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X70, 0X69, 0X6E, 0X79, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X20, 0X41, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BROS_LIFE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X72, 0X6F, 0X73, 0X2E, 0X20, 0X4C, 0X69, 0X66, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PIRANHA_SWING
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X50, 0X69, 0X72, 0X61, 0X6E, 0X68, 0X61, 0X20, 0X53, 0X77, 0X69, 0X6E, 0X67, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org LUCKY_RIBBON
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4C, 0X75, 0X63, 0X6B, 0X79, 0X20, 0X52, 0X69, 0X62, 0X62, 0X6F, 0X6E, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org HAND_AURA
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X48, 0X61, 0X6E, 0X64, 0X20, 0X41, 0X75, 0X72, 0X61, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SLEDGE_HEART
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X6C, 0X65, 0X64, 0X67, 0X65, 0X20, 0X48, 0X65, 0X61, 0X72, 0X74, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org LUCKY_BROS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X4C, 0X75, 0X63, 0X6B, 0X79, 0X20, 0X42, 0X72, 0X6F, 0X73, 0X2E, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BROS_RESPECT
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X72, 0X6F, 0X73, 0X2E, 0X20, 0X52, 0X65, 0X73, 0X70, 0X65, 0X63, 0X74, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BOWSER_FIST
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X6F, 0X77, 0X73, 0X65, 0X72, 0X20, 0X46, 0X69, 0X73, 0X74, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SPIKE_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X70, 0X69, 0X6B, 0X65, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org CHUCKOLA_BADGE
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X43, 0X68, 0X75, 0X63, 0X6B, 0X6F, 0X6C, 0X61, 0X20, 0X42, 0X61, 0X64, 0X67, 0X65, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org WORK_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X57, 0X6F, 0X72, 0X6B, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org WORK_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X57, 0X6F, 0X72, 0X6B, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BEAN_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X42, 0X65, 0X61, 0X6E, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BEAN_TROUSERS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X42, 0X65, 0X61, 0X6E, 0X20, 0X54, 0X72, 0X6F, 0X75, 0X73, 0X65, 0X72, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BLUE_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X42, 0X6C, 0X75, 0X65, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PARASOL_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X50, 0X61, 0X72, 0X61, 0X73, 0X6F, 0X6C, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org HARD_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X48, 0X61, 0X72, 0X64, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org HEART_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X48, 0X65, 0X61, 0X72, 0X74, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PLAID_TROUSERS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X50, 0X6C, 0X61, 0X69, 0X64, 0X20, 0X54, 0X72, 0X6F, 0X75, 0X73, 0X65, 0X72, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org ONE_TROUSERS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X23, 0X31, 0X20, 0X54, 0X72, 0X6F, 0X75, 0X73, 0X65, 0X72, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SAFETY_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X61, 0X66, 0X65, 0X74, 0X79, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SHROOM_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X68, 0X72, 0X6F, 0X6F, 0X6D, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SHROOM_BELLS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X68, 0X72, 0X6F, 0X6F, 0X6D, 0X20, 0X42, 0X65, 0X6C, 0X6C, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SHROOM_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X68, 0X72, 0X6F, 0X6F, 0X6D, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PEACHY_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X50, 0X65, 0X61, 0X63, 0X68, 0X79, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MUSHWIN_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X4D, 0X75, 0X73, 0X68, 0X77, 0X69, 0X6E, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org MUSHLUCK_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X4D, 0X75, 0X73, 0X68, 0X6C, 0X75, 0X63, 0X6B, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SCANDAL_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X63, 0X61, 0X6E, 0X64, 0X61, 0X6C, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org STREET_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X74, 0X72, 0X65, 0X65, 0X74, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org TROPIC_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X54, 0X72, 0X6F, 0X70, 0X69, 0X63, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org HERMETIC_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X48, 0X65, 0X72, 0X6D, 0X65, 0X74, 0X69, 0X63, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BEANSTAR_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X42, 0X65, 0X61, 0X6E, 0X73, 0X74, 0X61, 0X72, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PEASLEY_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X50, 0X65, 0X61, 0X73, 0X6C, 0X65, 0X79, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org QUEENB_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X51, 0X75, 0X65, 0X65, 0X6E, 0X20, 0X42, 0X2E, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BBRAND_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X42, 0X2E, 0X20, 0X42, 0X72, 0X61, 0X6E, 0X64, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org HEART_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X48, 0X65, 0X61, 0X72, 0X74, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org CASUAL_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X43, 0X61, 0X73, 0X75, 0X61, 0X6C, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org BUBBLES_GEAR
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X42, 0X75, 0X62, 0X62, 0X6C, 0X65, 0X73, 0X27, 0X73, 0X20, 0X47, 0X65, 0X61, 0X72, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org CHUCKOLA_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X43, 0X68, 0X75, 0X63, 0X6B, 0X6F, 0X6C, 0X61, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SMART_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X6D, 0X61, 0X72, 0X74, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SCHOOL_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X53, 0X63, 0X68, 0X6F, 0X6F, 0X6C, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org OHOJEE_WEAR
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X4F, 0X68, 0X6F, 0X20, 0X4A, 0X65, 0X65, 0X20, 0X57, 0X65, 0X61, 0X72, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org PIRANHA_SUIT
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X50, 0X69, 0X72, 0X61, 0X6E, 0X68, 0X61, 0X20, 0X53, 0X75, 0X69, 0X74, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org ANUBOO_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X41, 0X6E, 0X75, 0X62, 0X6F, 0X6F, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org ANCIENT_PANTS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X41, 0X6E, 0X63, 0X69, 0X65, 0X6E, 0X74, 0X20, 0X50, 0X61, 0X6E, 0X74, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org HEAVY_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X48, 0X65, 0X61, 0X76, 0X79, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org LIGHT_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X4C, 0X69, 0X67, 0X68, 0X74, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org JEANIE_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X69, 0X65, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org RANDOM_SLACKS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X52, 0X61, 0X6E, 0X64, 0X6F, 0X6D, 0X20, 0X53, 0X6C, 0X61, 0X63, 0X6B, 0X73, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org JEANIEST_JEANS
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X69, 0X65, 0X73, 0X74, 0X20, 0X4A, 0X65, 0X61, 0X6E, 0X73, 0X21, 0X
	db 0xFF, 0x11, 0x1, 0xFF, 0xA

.org SAFE_GUARD
	db 0x13, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x41, 0xFF, 0x25
	db 0x59, 0X6F, 0X75, 0X20, 0X67, 0X6F, 0X74, 0X20, 0X61, 0X20, 0X53, 0X61, 0X66, 0X65, 0X20, 0X47, 0X75, 0X61, 0X72, 0X64, 0X21
	db 0xFF, 0x11, 0x1, 0xFF, 0xA






