NOTHING_BRANCH_HOOK equ 0x0821EC88
NOTHING_BRANCH_SCRIPT equ 0x08EA0000

WINKLE_FIX equ 0x0821E477

.org WINKLE_FIX
	db 0x0

.org NOTHING_BRANCH_HOOK
	;dw NOTHING_BRANCH_SCRIPT

.org 0x080f15fa ;VERY EXPERIMENTAL SPRITE CHANGE
	db 0x0, 0x21

.org NOTHING_BRANCH_SCRIPT
	db 0x13, 0x14, 0x0, 0x82, 0x0
	db 0x4, 0x4D, 0x20, 0x8F, 0xDC, 0x21, 0x8
	db 0x2, 0x20
	dw 0x0821ECC4