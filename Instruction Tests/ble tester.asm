addi 	$s0, $0, 62	# s0 = 62
sll  	$s0, $s0, 1	# s0 = 62*2 = 124
sll  	$s0, $s0, 1	# s0 = 124*2 = 248
addi 	$s1, $0, -5	# s1 = -5 = ...1 1111 1011 (2C) = 0xFFFF FFFB
sw   	$0,  0($0)	# [0] = 0x0000 0000
sb   	$s1, 3($0)	# [0] = 0x0000 00FB
lw   	$s2, 0($0)	# s2 = 251 = ...0 1111 1011 = 0x0000 00FB
ble  	$s0, $s2, target	# should be taken since s0 <= s2 : 248 <= 251 
addi 	$s2, $s2, 5	# should not be executed, would cause s2 = 256
target:
addi 	$s2, $s2, 4	# s2 = 255 (expected)
# terminate after 85 sec since only 9 instructions will be executed.
