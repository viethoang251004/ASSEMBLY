.data
	mang1:	.word 	0
	N:	.word	4
	msgnhap:	.asciiz	"Nhap mang: "
	msgxuat:	.asciiz "Mang xuat: "
.text
.globl main
main:
	li $v0, 4
	la $a0, msgnhap
	syscall
	# Khoi tao ban dau
	la $s0, mang1	#Address char1
	li $s1, 0	#i = 0
	lw $s2, N	#N = 0
	# Nhap mang
	readLoop:
		# Get a integer number
		li	$v0, 5		# read integer, store to $v0
		syscall
		sw	$v0, ($s0)	# store value to dia chi cua mang1
		addi	$s1, $s1, 1	# i = i + 1
		addi	$s0, $s0, 4	# tang 1 byte ky tu tiep theo
		bne $a1, $a2, readLoop
	# Print chuoi xuat
	li $v0, 4
	la $a0, msgxuat
	syscall
	# Xuat mang da nhap
	la $s0, mang1
	li $s1, 0	# i = 0
	printLoop:
	li $v0, 1
	lw $a0, ($s0)
	syscall
	addi $s1, $s1, 1
	addi $s0, $s0, 4
	bne $s1, $s2, printLoop
	li $v0, 10
	syscall
.end main