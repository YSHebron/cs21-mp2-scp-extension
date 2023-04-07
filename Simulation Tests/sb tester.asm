addi	$s0, $0, 0x65FF	# s0 = 0x0000 65FF
sw   	$s0, 8($0)	# [8] = 0x0000 65FF
sb	$s0, 0($0)	# [0] = 0xFF : [0] = 0xFFXX XXXX
sb	$s0, 1($0)	# [1] = 0xFF : [0] = 0xFFFF XXXX
sb	$s0, 2($0)	# [2] = 0xFF : [0] = 0xFFFF FFXX
sb	$s0, 3($0)	# [3] = 0xFF : [0] = 0xFFFF FFFF
sb	$s0, 4($0)	# [4] = 0xFF : [4] = 0xFFXX XXXX
sb	$s0, 5($0)	# [5] = 0xFF : [4] = 0xFFFF XXXX
sb	$0, 6($0)	# [6] = 0x00 : [4] = 0xFFFF 00XX
sb	$0, 7($0)	# [7] = 0x00 : [4] = 0xFFFF 0000
lw	$s1, 0($0)	# s1 = [0] = 0xFFFF FFFF
lw	$s2, 4($0)	# s2 = [4] = 0xFFFF 0000
sw	$s2, 84($0)	# [84] = 0xFFFF 0000
