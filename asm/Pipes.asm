UP_SCRIPT equ 0x08E0E000
DOWN_SCRIPT equ 0x08E0E100
FLAG_CHECK_UP equ 0x08E0E200
FLAG_CHECK_DOWN equ 0x08E0E300
SET_PIPE equ 0x08E0E400
WARP_CHECK equ 0x08E0E500
ROOM_OBJECTS equ 0x08E0E600
SPRITE_FLAG equ 0x08E0E800
WARP_ZONE equ 0x08E0E9F5
WARP_SCRIPT equ 0x08E0EA50
WARP_CURSOR equ 0x08E0EB00

.org 0x08270EE6 ; If not 9, check 10
	dw UP_SCRIPT

.org 0x08270FDF ; If not 9, check 10
	dw DOWN_SCRIPT

.org 0x08270EEC ; Check if flag 10 set before moving to pipe 10
	dw FLAG_CHECK_UP

.org 0x08270F0D ; Check if flag 10 set before moving to pipe 10
	dw FLAG_CHECK_DOWN

.org 0x08271360 ; If up and not 9, jump to check 10
	dw FLAG_CHECK_UP

.org 0x082714E7 ; If down and not 1, jump to check 10
	dw FLAG_CHECK_DOWN

.org 0x0827111C
	dw WARP_CHECK

.org 0x083d7284
	dw 0x08E0E712

.org 0x08E0E712
	db 0xC4, 0x70, 0x12, 0x1, 0xA, 0x1, 0x4, 0x1

.org 0x08E0E720
	dw 0x08E0E900

.org 0x08E0E900
	db 0x8, 0x2, 0xFF, 0xB, 0x1, 0xFF, 0x3, 0xFF, 0x41, 0xFF, 0x25, "Joke's End Peak", 0xFF, 0xA, 0x0

.org 0x08270C38
	dw SPRITE_FLAG

.org 0x083d7a2c
	dw 0x08E0EA00

.org UP_SCRIPT
	db 0x3F, 0x10, 0x0, 0x0, 0x0, 0xF, 0x80, 0x0, 0x0, 0x5, 0x0, 0xF0, 0xE, 0x27, 0x8 ; If pipe not pipe 10, loop
	db 0x2, 0x10, 0xF5, 0x11, 0x27, 0x8 ; Check pipe 1 flag
	db 0x2, 0x20, 0xF0, 0xE, 0x27, 0x8 ; Loop

.org DOWN_SCRIPT
	db 0x3F, 0x10, 0x0, 0x0, 0x0, 0xF, 0x80, 0x0, 0x0, 0x5, 0x0, 0xE9, 0xF, 0x27, 0x8 ; If pipe not pipe 10, loop
	db 0x2, 0x10, 0x7C, 0x13, 0x27, 0x8 ; Check pipe 9 flag
	db 0x2, 0x20, 0xE9, 0xF, 0x27, 0x8 ; Loop

.org FLAG_CHECK_UP
	db 0x3F, 0x10, 0x0, 0x0, 0x1, 0xAA, 0x80, 0x0, 0x0, 0x0, 0x40, 0xF5, 0x11, 0x27, 0x8 ; Check Pipe 10 Flag
	db 0x19, 0x0 ; Clear Text
	db 0x4, 0xC, 0xB0, 0x0, 0xE4, 0xE0, 0x8 ; Set pipe to 10
	db 0x15, 0x0, 0x0, 0x1, 0x2, 0x34, 0x0, 0x0, 0x40, 0x0, 0x20, 0xE7, 0xE0, 0x8 ; Load Jokes End Text description
	db 0x1 ; Return

.org FLAG_CHECK_DOWN
	db 0x3F, 0x10, 0x0, 0x0, 0x1, 0xAA, 0x80, 0x0, 0x0, 0x0, 0x40, 0x7C, 0x13, 0x27, 0x8 ; Check Pipe 10 Flag
	db 0x19, 0x0 ; Clear Text
	db 0x4, 0xC, 0xB0, 0x0, 0xE4, 0xE0, 0x8 ; Set pipe to 10
	db 0x15, 0x0, 0x0, 0x1, 0x2, 0x34, 0x0, 0x0, 0x40, 0x0, 0x20, 0xE7, 0xE0, 0x8 ; Load Jokes End Text description
	db 0x1 ; Return

.org SET_PIPE
	db 0x36, 0x0, 0x1F, 0x0, 0x0, 0x0, 0x0, 0xA0, 0x0, 0x0, 0x0, 0x0 ; Set Pipe to 10
	db 0x60, 0x0, 0x0, 0xE0, 0x0, 0x18, 0x0, 0x0, 0xA0 ; Set Cursor
	db 0x1 ; Return

.org WARP_CHECK
	db 0x3F, 0x10, 0x0, 0x0, 0x0, 0xF, 0x80, 0x0, 0x0, 0x5, 0x0, 0x2E, 0x11, 0x27, 0x8 ; Check if selected pipe is 10
	db 0x88, 0x0, 0x5D, 0x51, 0x0, 0xA0, 0x40, 0x1, 0xF, 0xA0, 0xD3, 0x15, 0x27, 0x8 ; Warp
	db 0x2, 0x20, 0x2E, 0x11, 0x27, 0x8 ; Return

.org ROOM_OBJECTS
	db 0x1, 0x10
	db 0x2, 0x10
	db 0xba, 0x80
	db 0xbb, 0x80
	db 0x1, 0x10
	db 0x2, 0x10
	db 0x96, 0x80
	db 0x04, 0x08, 0x88, 0x11, 0x00, 0x00, 0x00, 0x04, 0x08, 0xf8, 0x21, 0x08, 0x08, 0xf8, 0x21, 0x08, 0xd1, 0x6f, 0x41, 0x00
	db 0x04, 0x08, 0x88, 0xf, 0x00, 0x01, 0x01, 0x04, 0x08, 0xf8, 0x21, 0x08, 0x08, 0xf8, 0x21, 0x08, 0xd1, 0x6f, 0x41, 0x00
	db 0x6, 0x1, 0x0, 0x8, 0x0, 0x2, 0x2, 0x0, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0x6, 0x3, 0x0, 0x0, 0x8, 0x2, 0x2, 0x1, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0x7, 0x5, 0x0, 0x0, 0x8, 0x2, 0x2, 0x2, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0x5, 0x8, 0x0, 0x8, 0x1C, 0x2, 0x2, 0x3, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0x2, 0x7, 0x0, 0x8, 0x8, 0x2, 0x2, 0x4, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0xB, 0x5, 0x0, 0x1e, 0x8, 0x2, 0x2, 0x5, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0xA, 0x1, 0x0, 0x8, 0x8, 0x2, 0x2, 0x6, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0xD, 0x9, 0x0, 0x0, 0x1C, 0x2, 0x2, 0x7, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0
	db 0xD, 0x3, 0x0, 0x0, 0x0, 0x2, 0x2, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0 
	db 0x0, 0x0, 0x0, 0x0, 0x0, 0x3, 0x2, 0x0, 0x5A, 0xDC, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x5, 0x8, 0x8, 0x0
	db 0xE, 0x1, 0x0, 0x0, 0x8, 0x2, 0x2, 0x9, 0x8, 0xF8, 0x21, 0x8, 0x8, 0xF8, 0x21, 0x8, 0x4, 0x8, 0x8, 0x0 ; New Object

.org SPRITE_FLAG
	db 0x3F, 0x10, 0x0, 0x0, 0x1, 0xAA, 0x80, 0x0, 0x0, 0x0, 0x40, 0x43, 0xC, 0x27, 0x8 ; Check Pipe 10 Flag
	db 0x4, 0x8, 0xC0, 0x93, 0xDC, 0x21, 0x8
	db 0x2, 0x20, 0x43, 0xC, 0x27, 0x8

.org 0x08270C3C
	db 0x2, 0x20, 0xF9, 0xE7, 0xE0, 0x8

.org 0x08E0E7F9
	db 0x4, 0x8, 0xA0, 0x93, 0xDC, 0x21, 0x8


.org WARP_ZONE
	db 0x1, 0x3, 0x3, 0x3, 0x0, 0x4, 0x1, 0x50, 0xEA, 0xE0, 0x8 ; Loading zone for pipe
	db 0x55, 0xdc, 0x21, 0x8, 0x1, 0xB, 0x0


.org WARP_SCRIPT
	db 0x36, 0x0, 0x1F, 0x0, 0x0, 0x0, 0x0, 0xA0, 0x0, 0x0, 0x0, 0x0 ; Set Pipe to 10
	db 0x36, 0x3, 0x55, 0x0, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x0, 0x0 ; Set Pipe 10 Flag bit
	db 0x2, 0x0, 0xC9, 0xA, 0x27, 0x8

.org 0x08270D9E
	dw WARP_CURSOR

.org WARP_CURSOR
	db 0x3F, 0x10, 0x0, 0x0, 0x0, 0xF, 0x80, 0x0, 0x0, 0x5, 0x0, 0xB7, 0xD, 0x27, 0x8 ; If pipe not pipe 10, loop
	db 0x4, 0xC, 0xB0, 0x0, 0xE4, 0xE0, 0x8 ; Set pipe to 10
	db 0x15, 0x0, 0x0, 0x1, 0x2, 0x34, 0x0, 0x0, 0x40, 0x0, 0x20, 0xE7, 0xE0, 0x8 ; Load Jokes End Text description
	db 0x2, 0x0, 0xB7, 0xD, 0x27, 0x8