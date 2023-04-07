	li	$s0, 0xFFFF	# s0 = 0000 FFFF	46b0ffff
	sll	$s1, $s0, 16	# s1 = FFFF 0000
	or	$s2, $s0, $s1	# s2 = FFFF FFFF
	li	$s3, 5		# s3 = 0000 0005	46b30005
	#zfr	$s4, $s2, $s3 	# s4 = FFFF FFC0	0253a573
	sw	$s4, 0($0)	# [0] = FFFF FFC0
	
	li	$s0, 0xC0DE	# s0 = 0000 C0DE
	sll	$s1, $s0, 16	# s1 = C0DE 0000
	li	$s0, 0xFFFF	# s0 = 0000 FFFF
	add	$s2, $s0, $s1	# s2 = C0DE FFFF
	li	$s3, 5		# s3 = 0000 0005
	#zfr	$s4, $s2, $s3	# s4 = C0DE FFC0
	sw	$s4, 4($0)	# [4] = C0DE FFC0
	
	li	$t0, 0xBABE	# t0 = 0000 BABE
	sll	$t1, $t0, 16	# t1 = BABE 0000
	addi	$t1, $t1, 5	# t1 = BABE 0005
	#zfr	$t2, $s2, $t1	# t2 = C0DE FFC0
	ble	$t1, $t2, target
	addi	$t2, $t2, 256
target:	sw	$t2, 8($0)	# [8] = C0DE FFC0
	
	li	$s0, 0xFFFF	# s0 = 0000 FFFF
	sll	$s1, $s0, 16	# s1 = FFFF 0000
	or	$s2, $s0, $s1	# s2 = FFFF FFFF
	#zfr	$s3, $s2, $0	# s3 = FFFF FFFE
	sw	$s3, 12($0)	# [12] = FFFF FFFE
	#zfr	$s3, $s2, $s2	# s3 = 0000 0000
	sw	$s3, 16($0)	# [16] = 0000 0000
	
	#checking
	lw	$s0, 0($0)	# s0 = FFFF FFC0
	lw	$s1, 4($0)	# s1 = C0DE FFC0
	and	$t0, $s0, $s1	# t0 = C0DE FFC0
	lw	$s2, 8($0)	# s2 = C0DE FFC0
	lw	$s3, 12($0)	# s3 = FFFF FFFE
	sll	$s2, $s2, 3	# s2 = 06F7 FE00
	sub	$t1, $s3, $t0	# t1 = 3F21 003E
	add	$t2, $s2, $t1	# t2 = 4618 FE3E
	lw	$s4, 16($0)	# s4 = 0000 0000
	addi	$s4, $s4, 64	# s4 = 0000 0040
	add	$t3, $t2, $s4	# t3 = 4618 FE7E
	# at realtime 365 ns, terminate
# expected results: dataadr = 32'h4618_FE7E, writedata = 32'h0000_0040