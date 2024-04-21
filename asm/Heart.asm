
ROOM_B8_REPLACE equ 0x083d6f14

NEW_ROOM_LAYOUT equ 0x08D30000

.org ROOM_B8_REPLACE
	dw NEW_ROOM_LAYOUT

.org 0x083d6f38
	dw 0x08D30136

.org NEW_ROOM_LAYOUT
db 0xc3, 0x28
db 0x70, 0x00
db 0x6a, 0x00
db 0x64, 0x00
db 0x01, 0x10
db 0x02, 0x10
db 0x5e, 0x10
db 0x7c, 0x10
db 0xb7, 0x30
db 0x5e, 0x80
db 0x05, 0x90
db 0x0c, 0x90
db 0x08, 0x80
db 0x61, 0x10
db 0x7f, 0x10
db 0x5a, 0x81
db 0x01, 0x10
db 0x02, 0x10
db 0x3a, 0x30
db 0x45, 0x80
db 0x04, 0x90
db 0x08, 0x90
db 0x09, 0x90
db 0x01, 0x80
db 0x08, 0x81
db 0x04, 0x08, 0x88, 0x11, 0x00, 0x00, 0x00, 0x04, 0x08, 0xf8, 0x21, 0x08, 0x08, 0xf8, 0x21, 0x08, 0xd1, 0x6f, 0x41, 0x00
db 0x04, 0x08, 0x88, 0x0f, 0x00, 0x01, 0x01, 0x04, 0x08, 0xf8, 0x21, 0x08, 0x08, 0xf8, 0x21, 0x08, 0xd1, 0x6f, 0x41, 0x00
db 0x28, 0x0d, 0x00, 0x08, 0x00, 0x04, 0x02, 0x00, 0x66, 0xdc, 0x21, 0x08, 0x08, 0xf8, 0x21, 0x08, 0x04, 0x48, 0x08, 0x00
db 0x11, 0x0d, 0x04, 0x40, 0x04, 0x05, 0x03, 0x00, 0x5a, 0xdc, 0x21, 0x08, 0x8c, 0x97, 0x25, 0x08, 0xa1, 0x48, 0x08, 0x00
db 0x13, 0x1b, 0x04, 0x40, 0x04, 0x05, 0x03, 0x00, 0x5a, 0xdc, 0x21, 0x08, 0xdc, 0x97, 0x25, 0x08, 0xa1, 0x48, 0x08, 0x00
db 0x09, 0x16, 0x04, 0x40, 0x04, 0x05, 0x03, 0x00, 0x5a, 0xdc, 0x21, 0x08, 0x25, 0x98, 0x25, 0x08, 0xa1, 0x48, 0x08, 0x00
db 0x0c, 0x0c, 0x02, 0x08, 0x20, 0x7f, 0x3f, 0x00, 0x08, 0xf8, 0x21, 0x08, 0x8f, 0x9b, 0x25, 0x08, 0x83, 0x18, 0x08, 0x00
db 0x19, 0x1a, 0x02, 0x08, 0x08, 0x06, 0x05, 0x00, 0xb9, 0x1c, 0x28, 0x08, 0x1a, 0xd8, 0x00, 0x00, 0xe1, 0x1c, 0xd9, 0x00
db 0x08, 0x11, 0x00, 0x08, 0x08, 0x06, 0x05, 0x04, 0xc5, 0x1c, 0x28, 0x08, 0x1a, 0xdc, 0x00, 0x00, 0xe1, 0x0c, 0xd9, 0x00
db 0x10, 0x0e, 0x00, 0x08, 0x08, 0x07, 0x06, 0x02, 0xd1, 0x1c, 0x28, 0x08, 0x1b, 0xe0, 0x00, 0x00, 0xe1, 0x1c, 0xd8, 0x00
db 0x0e, 0x17, 0x00, 0x08, 0x00, 0x07, 0x06, 0x06, 0xdd, 0x1c, 0x28, 0x08, 0x1b, 0xe4, 0x00, 0x00, 0xe1, 0x1c, 0xd8, 0x00
db 0x21, 0x1a, 0x06, 0x88, 0x20, 0x08, 0x07, 0x00, 0x5a, 0xdc, 0x21, 0x08, 0x88, 0x4b, 0x27, 0x08, 0xe1, 0x08, 0x3b, 0x00
db 0x15, 0x17, 0x06, 0x88, 0x20, 0x08, 0x07, 0x00, 0x5a, 0xdc, 0x21, 0x08, 0x88, 0x4b, 0x27, 0x08, 0xe1, 0x08, 0x3b, 0x00

.org 0x08D30136
	db 0x4C, 0x6A, 0x2E, 0x1, 0x16, 0x1, 0x4, 0x1