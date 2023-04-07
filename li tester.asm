	addi	$s0, $0, 0x0010		#s0 = 0x0010
	add	$s1, $s0, $s0		#s1 = 0x0020
	slt	$s2, $s0, $s1		#s2 = 0x0001
	ble	$s2, $s0, L1		#branch to L1
	addi	$s2, $s2, 0x7FFF	#don't run, s2=8000
	addi	$s2, $s2, 0x0001	#don't run, s2=8001
L1:	addi	$s2, $s2, 0x7FFE	#s2 = 0x7FFF
	li	$s3, 0x7FFF		#s3 = 0x7FFF
	and	$s2, $s2, $s3		#s2 = 0x7FFF
	ble	$s2, $s3, L2		#branch to L2
	sub	$s2, $s2, $s3		#don't run, s2 = 0x0000
L2:	sll	$s2, $s2, 16		#s2 = 0x7FFF 0000
	or	$s3, $s2, $s3		#s3 = 0x7FFF 7FFF
	li	$s0, 0x0001		#s0 = 0x0000 0001
	add	$s3, $s3, $s0		#s3 = 0x7FFF 8000
	li	$s1, 0x1001		#s1 = 0x0000 1001
	sll	$s1, $s1, 16		#s1 = 0x1001 0000
	j	L3			#skip addi below
	addi	$s3, $s3, 1
L3:	sw	$s3, 4($s1)
	# writereg = 0x7FFF 8000; dataaddr = 0x1001 0004
	
	# below are some tests for zfr
	li	$t0, 0xFFFFFFFE
	sll	$t0, $t0, 5
	li	$t0, 0xFFFFFFFE
	sll	$t0, $t0, 0
	li	$t0, 0xFFFFFFFE
	sll	$t0, $t0, 31
	
	
		
	
