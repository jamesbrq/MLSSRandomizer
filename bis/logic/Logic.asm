.nds
.open "bis.nds", "bis_loop.nds", 0x0

TESTVAR_HOOK equ 0x171A0
TESTVAR equ 0x16b60
TESTVAR_SUBR equ 0x3DB00

.org TESTVAR_HOOK 
	; bl TESTVAR

.close