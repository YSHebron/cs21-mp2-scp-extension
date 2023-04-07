addi $s0, $0, 0x000C
sll  $s0, $s0, 8
sll  $s0, $s0, 8
sll  $s0, $s0, 8
addi $s0, $s0, 0x000C
sw   $s0, 84($0)

addi	$s0, $0, 0x00FF
sw   	$s0, 8($0)
sb	$s0, 0($0)
sb	$s0, 1($0)
sb	$s0, 2($0)
sb	$s0, 3($0)
sb	$s0, 4($0)
sb	$s0, 5($0)
sb	$0, 5($0)
sb	$0, 5($0)
lw	$s1, 0($0)
lw	$s2, 4($0)
sw	$s2, 84($0)

addi $s0, $0, -1
sll  $s0, $s0, 1
sll  $s0, $s0, 1	#s0 = -4
addi $s1, $0, -5	#s1 = -5 = 1111 1011 (2C)
sw   $0,  0($0)
sb   $s1, 4($0)
lw   $s2, 0($0)		#s2 = -5 = 1111 1011
ble  $s2, $s1, target
addi $s2, $s2, 5	# should not be executed
target:
addi $s2, $s2, 4	#s2 = -1