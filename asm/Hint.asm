PAGE_ONE_HOOK equ 0x08E07000
PAGE_TWO_HOOK equ 0x08E07004
PAGE_THREE_HOOK equ 0x08E07008
PAGE_FOUR_HOOK equ 0x08E0700C
PAGE_FIVE_HOOK equ 0x08E07550
PAGE_SIX_HOOK equ 0x08E07554
HINT_INTRO_HOOK equ 0x08E070C0
HINT_INTRO equ 0x08E07500
HINT_PAGE_ONE equ 0x08E07010
HINT_PAGE_TWO equ 0x08E08000
HINT_PAGE_THREE equ 0x08E08100
HINT_PAGE_FOUR equ 0x08E08200
HINT_PAGE_FIVE equ 0x08E07C00
HINT_PAGE_SIX equ 0x08E07D00
SCRIPT_HOOK equ 0x0825284E
HINT_SCRIPT_ONE equ 0x08E07600
HINT_SCRIPT_TWO equ 0x08E07700
HINT_SCRIPT_THREE equ 0x08E07800
HINT_SCRIPT_FOUR equ 0x08E07900
HINT_SCRIPT_FIVE equ 0x08E07A00
HINT_SCRIPT_SIX equ 0x08E07B00
HAMMER_HINT equ 0x08E07200
SHAMMER_HINT equ 0x08E07250
UHAMMER_HINT equ 0x08E072A0
RGOBLET_HINT equ 0x08E072F0
GGOBLET_HINT equ 0x08E07340
FIRE_HINT equ 0x08E07390
THUNDER_HINT equ 0x08E073E0
RPEARL_HINT equ 0x08E07430
GPEARL_HINT equ 0x08E07480
ROSE_HINT equ 0x08E074D0
BROOCH_HINT equ 0x08E08300
MEMBERSHIP_HINT equ 0x08E08350
WINKLE_HINT equ 0x08E083A0
RED_HINT equ 0x08E083F0
WHITE_HINT equ 0x08E08440
PURPLE_HINT equ 0x08E08490
DRESS_HINT equ 0x08E084E0
FSTAR_HINT equ 0x08E08530
SPANGLE_HINT equ 0x08E08580
PIECEONE_HINT equ 0x08E085D0
PIECETWO_HINT equ 0x08E08620
PIECETHREE_HINT equ 0x08E08670
PIECEFOUR_HINT equ 0x08E086C0
HAMMER_HINT_HOOK equ 0x08E075A0
SHAMMER_HINT_HOOK equ 0x08E075A4
UHAMMER_HINT_HOOK equ 0x08E075A8
RGOBLET_HINT_HOOK equ 0x08E075AC
GGOBLET_HINT_HOOK equ 0x08E075B0
FIRE_HINT_HOOK equ 0x08E075B4
THUNDER_HINT_HOOK equ 0x08E075B8
RPEARL_HINT_HOOK equ 0x08E075BC
GPEARL_HINT_HOOK equ 0x08E075C0
ROSE_HINT_HOOK equ 0x08E075C4
BROOCH_HINT_HOOK equ 0x08E075C8
MEMBERSHIP_HINT_HOOK equ 0x08E075CC
WINKLE_HINT_HOOK equ 0x08E075D0
RED_HINT_HOOK equ 0x08E075D4
WHITE_HINT_HOOK equ 0x08E075D8
PURPLE_HINT_HOOK equ 0x08E075DC
DRESS_HINT_HOOK equ 0x08E075E0
FSTAR_HINT_HOOK equ 0x08E075E4
SPANGLE_HINT_HOOK equ 0x08E075E8
PIECEONE_HINT_HOOK equ 0x08E075EC
PIECETWO_HINT_HOOK equ 0x08E075F0
PIECETHREE_HINT_HOOK equ 0x08E075F4
PIECEFOUR_HINT_HOOK equ 0x08E075F8
RETURN_SCRIPT equ 0x08252A15
COIN_TEXT equ 0x083F462E
COIN_COUNT equ 0x0825283A
COIN_TAKE equ 0x08252847
HINT_TOKEN_INJECT equ 0x08252833
TOKEN_FIX_HOOK equ 0x080EA3E4
TOKEN_FIX_SUBR equ 0x081DFD30
TAKE_FIX_HOOK equ 0x080EA2AC
TAKE_FIX_SUBR equ 0x081DFD60
TAKE_FIX_TWO_HOOK equ 0x080EA2C8
TAKE_FIX_TWO_SUBR equ 0x081DFD90
NOT_ENOUGH equ 0x0847F56E

.org TAKE_FIX_TWO_HOOK
	bl TAKE_FIX_TWO_SUBR

.org TAKE_FIX_HOOK
	bl TAKE_FIX_SUBR

.org TOKEN_FIX_HOOK
	bl TOKEN_FIX_SUBR

.org COIN_TEXT
	db 0x34, 0x30, 0x20, 0x54, 0X6F, 0X6B, 0X65, 0X6E, 0X73

.org NOT_ENOUGH
	db 0x54, 0X6F, 0X6B, 0X65, 0X6E, 0X73

.org COIN_COUNT
	db 0x13, 0x80

.org COIN_TAKE
	db 0x91, 0x86, 0x85, 0x0

.org HINT_TOKEN_INJECT
	db 0x89, 0x80

.org HAMMER_HINT_HOOK
	dw HAMMER_HINT

.org SHAMMER_HINT_HOOK
	dw SHAMMER_HINT

.org UHAMMER_HINT_HOOK
	dw UHAMMER_HINT

.org RGOBLET_HINT_HOOK
	dw RGOBLET_HINT

.org GGOBLET_HINT_HOOK
	dw GGOBLET_HINT

.org FIRE_HINT_HOOK
	dw FIRE_HINT

.org THUNDER_HINT_HOOK
	dw THUNDER_HINT

.org RPEARL_HINT_HOOK
	dw RPEARL_HINT

.org GPEARL_HINT_HOOK
	dw GPEARL_HINT

.org ROSE_HINT_HOOK
	dw ROSE_HINT

.org BROOCH_HINT_HOOK
	dw BROOCH_HINT

.org MEMBERSHIP_HINT_HOOK
	dw MEMBERSHIP_HINT

.org WINKLE_HINT_HOOK
	dw WINKLE_HINT

.org RED_HINT_HOOK
	dw RED_HINT

.org WHITE_HINT_HOOK
	dw WHITE_HINT

.org PURPLE_HINT_HOOK
	dw PURPLE_HINT

.org DRESS_HINT_HOOK
	dw DRESS_HINT

.org FSTAR_HINT_HOOK
	dw FSTAR_HINT

.org SPANGLE_HINT_HOOK
	dw SPANGLE_HINT

.org PIECEONE_HINT_HOOK
	dw PIECEONE_HINT

.org PIECETWO_HINT_HOOK
	dw PIECETWO_HINT

.org PIECETHREE_HINT_HOOK
	dw PIECETHREE_HINT

.org PIECEFOUR_HINT_HOOK
	dw PIECEFOUR_HINT


.org SCRIPT_HOOK
	db 0x2, 0x20, 0x0, 0x76, 0xE0, 0x08, 0x0, 0x0

.org PAGE_ONE_HOOK
	dw HINT_PAGE_ONE

.org PAGE_TWO_HOOK
	dw HINT_PAGE_TWO

.org PAGE_THREE_HOOK
	dw HINT_PAGE_THREE

.org PAGE_FOUR_HOOK
	dw HINT_PAGE_FOUR

.org PAGE_FIVE_HOOK
	dw HINT_PAGE_FIVE

.org PAGE_SIX_HOOK
	dw HINT_PAGE_SIX

.org HINT_INTRO_HOOK
	dw HINT_INTRO

.org HINT_INTRO
	db 0x12, 0x8, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1
	db 0x57, 0X68, 0X61, 0X74, 0X20, 0X69, 0X74, 0X65, 0X6D, 0X20, 0X77, 0X6F, 0X75, 0X6C, 0X64, 0X20, 0X79, 0X6F, 0X75, 0X20, 0X6C, 0X69, 0X6B, 0X65, 0xFF, 0x0, 0xFF, 0x2B, 0X49, 0X6E, 0X66, 0X6F, 0X72, 0X6D, 0X61, 0X74, 0X69, 0X6F, 0X6E, 0xFF, 0x20, 0X20, 0X6F, 0X6E, 0X3F
	db 0XFF, 0x11, 0x01, 0xFF, 0xA

.org HINT_PAGE_ONE
	db 0x16, 0xA, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1, 0xFF, 0x2B
	db 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4 
	db 0xFF, 0x6E, 0x48, 0X61, 0X6D, 0X6D, 0X65, 0X72, 0X73, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x53, 0X75, 0X70, 0X65, 0X72, 0X20, 0X48, 0X61, 0X6D, 0X6D, 0X65, 0X72, 0X73, 0xFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x55, 0X6C, 0X74, 0X72, 0X61, 0X20, 0X48, 0X61, 0X6D, 0X6D, 0X65, 0X72, 0X73, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x52, 0X65, 0X64, 0X20, 0X47, 0X6F, 0X62, 0X6C, 0X65, 0X74, 0XFF, 0x00, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x47, 0X72, 0X65, 0X65, 0X6E, 0X20, 0X47, 0X6F, 0X62, 0X6C, 0X65, 0X74, 0xFF, 0x20, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x4E, 0X65, 0X78, 0X74, 0X20, 0X50, 0X61, 0X67, 0X65, 0XFF, 0x11, 0x01, 0xFF, 0xA

.org HINT_PAGE_TWO
	db 0x16, 0xA, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1, 0xFF, 0x2B
	db 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4 
	db 0xFF, 0x6E, 0x46, 0X69, 0X72, 0X65, 0X62, 0X72, 0X61, 0X6E, 0X64, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x54, 0X68, 0X75, 0X6E, 0X64, 0X65, 0X72, 0X20, 0X48, 0X61, 0X6E, 0X64, 0xFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x52, 0X20, 0X50, 0X65, 0X61, 0X72, 0X6C, 0X20, 0X42, 0X65, 0X61, 0X6E, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x47, 0X20, 0X50, 0X65, 0X61, 0X72, 0X6C, 0X20, 0X42, 0X65, 0X61, 0X6E, 0xFF, 0x20, 0XFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x50, 0X72, 0X65, 0X76, 0X69, 0X6F, 0X75, 0X73, 0X20, 0X4D, 0X65, 0X6E, 0X75, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x4E, 0X65, 0X78, 0X74, 0X20, 0X50, 0X61, 0X67, 0X65, 0XFF, 0x11, 0x01, 0xFF, 0xA

.org HINT_PAGE_THREE
	db 0x16, 0xA, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1, 0xFF, 0x2B
	db 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4 
	db 0xFF, 0x6E, 0x50, 0X65, 0X61, 0X73, 0X6C, 0X65, 0X79, 0X27, 0X73, 0X20, 0X52, 0X6F, 0X73, 0X65, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0X20, 0X42, 0X72, 0X6F, 0X6F, 0X63, 0X68, 0xFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x4D, 0X65, 0X6D, 0X62, 0X65, 0X72, 0X73, 0X68, 0X69, 0X70, 0X20, 0X43, 0X61, 0X72, 0X64, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x57, 0X69, 0X6E, 0X6B, 0X6C, 0X65, 0X20, 0X43, 0X61, 0X72, 0X64, 0xFF, 0x20, 0XFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x50, 0X72, 0X65, 0X76, 0X69, 0X6F, 0X75, 0X73, 0X20, 0X4D, 0X65, 0X6E, 0X75, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x4E, 0X65, 0X78, 0X74, 0X20, 0X50, 0X61, 0X67, 0X65, 0XFF, 0x11, 0x01, 0xFF, 0xA

.org HINT_PAGE_FOUR
	db 0x16, 0xA, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1, 0xFF, 0x2B
	db 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4 
	db 0xFF, 0x6E, 0x52, 0X65, 0X64, 0X20, 0X43, 0X20, 0X46, 0X72, 0X75, 0X69, 0X74, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x57, 0X68, 0X69, 0X74, 0X65, 0X20, 0X43, 0X20, 0X46, 0X72, 0X75, 0X69, 0X74, 0xFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x50, 0X75, 0X72, 0X70, 0X6C, 0X65, 0X20, 0X43, 0X20, 0X46, 0X72, 0X75, 0X69, 0X74, 0XFF, 0x0, 0xFF, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x50, 0X72, 0X65, 0X76, 0X69, 0X6F, 0X75, 0X73, 0X20, 0X4D, 0X65, 0X6E, 0X75, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x4E, 0X65, 0X78, 0X74, 0X20, 0X50, 0X61, 0X67, 0X65, 0XFF, 0x11, 0x01, 0xFF, 0xA

.org HINT_PAGE_FIVE
	db 0x16, 0xA, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1, 0xFF, 0x2B
	db 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4 
	db 0xFF, 0x6E, 0x45, 0X78, 0X74, 0X72, 0X61, 0X20, 0X44, 0X72, 0X65, 0X73, 0X73, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x46, 0X61, 0X6B, 0X65, 0X20, 0X42, 0X73, 0X74, 0X61, 0X72, 0xFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x53, 0X70, 0X61, 0X6E, 0X67, 0X6C, 0X65, 0XFF, 0x0, 0xFF, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x50, 0X72, 0X65, 0X76, 0X69, 0X6F, 0X75, 0X73, 0X20, 0X4D, 0X65, 0X6E, 0X75, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x4E, 0X65, 0X78, 0X74, 0X20, 0X50, 0X61, 0X67, 0X65, 0XFF, 0x11, 0x01, 0xFF, 0xA

.org HINT_PAGE_SIX
	db 0x16, 0xA, 0xFF, 0xB, 0x1, 0xFF, 0xB, 0x1, 0xFF, 0x2B
	db 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4 
	db 0xFF, 0x6E, 0x42, 0X73, 0X74, 0X61, 0X72, 0X20, 0X50, 0X69, 0X65, 0X63, 0X65, 0X20, 0X31, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x42, 0X73, 0X74, 0X61, 0X72, 0X20, 0X50, 0X69, 0X65, 0X63, 0X65, 0X20, 0X32, 0xFF, 0x0, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x42, 0X73, 0X74, 0X61, 0X72, 0X20, 0X50, 0X69, 0X65, 0X63, 0X65, 0X20, 0X33, 0x20, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x42, 0X73, 0X74, 0X61, 0X72, 0X20, 0X50, 0X69, 0X65, 0X63, 0X65, 0X20, 0X34, 0XFF, 0x00, 0xFF, 0x20, 0xFF, 0x35, 0xFF, 0x3, 0xFF, 0x4
	db 0xFF, 0x6E, 0x50, 0X72, 0X65, 0X76, 0X69, 0X6F, 0X75, 0X73, 0X20, 0X4D, 0X65, 0X6E, 0X75, 0XFF, 0x11, 0x01, 0xFF, 0xA





	.org TOKEN_FIX_SUBR
	push { r1, lr }
	add r0, #0x8A
	ldr r1, =HINT_TOKENS
	cmp r0, r1
	bne .token_norm
	ldrh r4, [r0]
	bl .token_end
	.token_norm:
	ldrb r4, [r0]
	.token_end:
	pop { r1, pc }
	.pool




	.org TAKE_FIX_SUBR
	push r3, lr
	ldr r4, =0x02004AE0
	ldr r4, [r4]
	ldr r3, =0x08252844
	cmp r3, r4
	bne .take_skip
	ldr r0, =0x02004908
	.take_skip:
	ldrh r0, [r0]
	sub r0, r1
	pop r3, pc
	.pool

	.org TAKE_FIX_TWO_SUBR
	push { r2-r3, lr }
	add r0, #0x88
	ldr r2, =0x02004AE0
	ldr r2, [r2]
	ldr r3, =0x08252844
	cmp r3, r2
	bne .take_skip2
	ldr r0, =0x02004908
	.take_skip2:
	strh r4, [r0]
	pop { r2-r3, pc }
	.pool






	.org HINT_SCRIPT_ONE
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw HINT_INTRO_HOOK
		db 0x18, 0x0
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0xE1, 0x24
		dw PAGE_ONE_HOOK
		db 0x18, 0x0
		db 0x1E, 0x0, 0x0
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3F, 0x76, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw HAMMER_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x61, 0x76, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw SHAMMER_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x83, 0x76, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw UHAMMER_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x80, 0xA5, 0x76, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw RGOBLET_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0xC7, 0x76, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw GGOBLET_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x80, 0x15, 0x2A, 0x25, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_TWO
		db 0x2, 0x20
		dw RETURN_SCRIPT
		.pool

		.org HINT_SCRIPT_TWO
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0xE1, 0x24
		dw PAGE_TWO_HOOK
		db 0x18, 0x0
		db 0x1E, 0x0, 0x0
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0x77, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw FIRE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x54, 0x77, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw THUNDER_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x76, 0x77, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw RPEARL_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x80, 0x98, 0x77, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw GPEARL_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0xB3, 0x77, 0xE0, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_ONE + 13
		db 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x80, 0x15, 0x2A, 0x25, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_THREE
		db 0x2, 0x20
		dw RETURN_SCRIPT
		.pool

		.org HINT_SCRIPT_THREE
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0xE1, 0x24
		dw PAGE_THREE_HOOK
		db 0x18, 0x0
		db 0x1E, 0x0, 0x0
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0x78, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw ROSE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x54, 0x78, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw BROOCH_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x76, 0x78, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw MEMBERSHIP_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x80, 0x98, 0x78, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw WINKLE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0xB3, 0x78, 0xE0, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_TWO
		db 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x80, 0x15, 0x2A, 0x25, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_FOUR
		db 0x2, 0x20
		dw RETURN_SCRIPT
		.pool

		.org HINT_SCRIPT_FOUR
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0xE1, 0x24
		dw PAGE_FOUR_HOOK
		db 0x18, 0x0
		db 0x1E, 0x0, 0x0
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0x79, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw RED_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x54, 0x79, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw WHITE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x76, 0x79, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw PURPLE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x80, 0x91, 0x79, 0xE0, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_THREE
		db 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0x15, 0x2A, 0x25, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_FIVE
		db 0x2, 0x20
		dw RETURN_SCRIPT
		.pool

		.org HINT_SCRIPT_FIVE
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0xE1, 0x24
		dw PAGE_FIVE_HOOK
		db 0x18, 0x0
		db 0x1E, 0x0, 0x0
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0x7A, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw DRESS_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x54, 0x7A, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw FSTAR_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x76, 0x7A, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw SPANGLE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x80, 0x91, 0x7A, 0xE0, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_FOUR
		db 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0x15, 0x2A, 0x25, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_SIX
		db 0x2, 0x20
		dw RETURN_SCRIPT
		.pool

		.org HINT_SCRIPT_SIX
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0xE1, 0x24
		dw PAGE_SIX_HOOK
		db 0x18, 0x0
		db 0x1E, 0x0, 0x0
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x32, 0x7B, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw PIECEONE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80, 0x54, 0x7B, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw PIECETWO_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x76, 0x7B, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw PIECETHREE_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x80, 0x98, 0x7B, 0xE0, 0x8
		db 0x17, 0x0, 0x1, 0x0, 0x0, 0x61, 0x24
		dw PIECEFOUR_HINT_HOOK
		db 0x18, 0x0, 0x2, 0x20
		dw RETURN_SCRIPT
		db 0x3F, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2, 0x0, 0x15, 0x2A, 0x25, 0x8
		db 0x2, 0x0
		dw HINT_SCRIPT_FIVE
		db 0x2, 0x20
		dw RETURN_SCRIPT
		.pool