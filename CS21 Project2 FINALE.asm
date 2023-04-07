# CS21 Project 2 FINAL TEST PROGRAM
# Original instructions:
# 	ADD, SUB, AND, OR, SLT, LW, SW, BEQ, ADDI, J
# New instructions:
#	SLL, SB, BLE, LI, ZFR
# Integrity Tests... PASSED!

# Notes: Adjust BEQ, J, BLE, and LI for actual memfile.
# Manual machine code for ZFR required.

# Initializing FINALE
	li	$t0, 25		# t0 = 25
	li	$t1, 37		# t1 = 37
	add	$s0, $t0, $t1 	# s0 = 62 = 0x3E
	li	$t0, 0xC0DE	# t0 = 0x0000 C0DE
	li	$t1, 0xBEAD	# t1 = 0x0000 BEAD
	sw	$t1, 0($0)	# [0] = 0x0000 BEAD
	li	$t1, 0x00EF	# t1 = 0x0000 00EF
	sb	$t1, 3($0)	# [0] = 0x0000 BEEF
	lw	$t1, 0($0)	# t1 = 0x0000 BEEF
	sub	$s1, $t0, $t1	# s1 = 0x0000 01EF
	or	$s2, $s0, $s1	# s2 = 0x0000 01FF
	sll	$t0, $t0, 16	# t0 = 0xC0DE 0000
	add	$t0, $t0, $t1	# t0 = 0xC0DE BEEF
	sll	$t1, $t0, 8	# t1 = 0xDEBE EF00
	# zfr	$t0, $t0, $s1	# t0 = 0xC0DE 0000
	addi	$t0, $t0, 0x23	# t0 = 0xC0DE 0023
	li	$t2, 10		# t2 = 10
	li	$t3, 11		# t3 = 11
	slt	$t2, $t2, $t3	# t2 = 1
	addi	$t3, $0, 1	# t3 = 1
	beq	$t3, $t2, skip	# take
	addi	$t0, $t0, 0x64
	addi	$t1, $t1, 0x128
skip:	sw	$t0, 4($0)	# [4] = 0xC0DE 0023
	sw	$t1, 8($0)	# [8] = 0xDEBE EF00
	li	$t1, 0xFADE	# t1 = 0xFADE
	li	$t2, 10		# t2 = 10
	li	$t3, 0x7003	# t3 = 0x0000 7003
	#zfr	$t3, $t1, $t3	# t3 = 0x0000 FAD0
	sw	$t3, 12($0)	# [12] = 0x0000 FADO
	addi	$t0, $0, 0	# t0 = 0
loop:	addi	$t0, $t0, 1	# t0 = t0 + 1
	ble	$t0, $t2, loop	# res: t0 = 11 = 0xB
	sll	$t0, $t0, 4	# t0 = 0x0000 00B0
	sll	$t1, $s1, 8	# t1 = 0x0001 EF00
	and	$s3, $t0, $t1	# s3 = 0x0000 0000
	li	$s4, 0xF00D	# s4 = 0x0000 F00D
	#zfr	$s3, $s4, $s3	# s3 = 0x0000 F00C
	lw	$t0, 4($0)	# t0 = 0xC0DE 0023
	lw	$t1, 8($0)	# t1 = 0xDEBE EF00
	sub	$t2, $t1, $t0	# t2 = 0x1DE0 EEDD
	sub	$t2, $t2, $s1	# t2 = 0x1DE0 0CEE
	sub	$t2, $t2, $s2	# t2 = 0x1DE0 EAEF
	sub	$t2, $t2, $s3	# t2 = 0x1DDF FAE3
	sll	$s4, $t2, 16	# t2 = 0xFAE3 0000
	sw	$s4, 84($0)	# [84] = 0xFAE3 0000
# expected results: dataadr = 0x0000 0054, writedata = 0xFAE3 0000
	
	

