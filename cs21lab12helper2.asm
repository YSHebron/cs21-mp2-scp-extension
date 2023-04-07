# Write the hex value 0xBBAA0000 to register 1
addi	$1, $0, 0xBBAA	# 2001BBAA
add	$1, $1, $1	# 00210820
add	$1, $1, $1	# ...
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
add	$1, $1, $1
# Others
addi	$2, $0, 176	# 200200B0
addi	$3, $2, 45056	# 2043B000
addi	$4, $0, 0x7FFF	# 20047fff
add	$4, $4, $4	# 00842020
addi	$4, $4, 1	# 20840001
and	$3, $3, $4	# 00641824
add	$4, $1, $3	# 00232020
addi	$5, $0, 16	# 20050010
sw	$4, 0($5)	# aca40000
