#Viet chuong trinh nhap vao mot so nguyen N (VD: N=123). Xuat ra man hinh so nguoc lai (VD: 321).
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 18/1/2023
#Version: 1.0
.data
	nhap:	.asciiz	"Nhap vao mot so nguyen N: "
	xuat:	.asciiz	"So nguoc lai so vua nhap la: "
	mang1:	.word	0
	mang2:	.word	0
.text
.globl main
main:
	#Nhap vao mot so nguyen N 
	li	$v0, 4
	la	$a0, nhap
	syscall
	li	$v0, 5
	syscall
	move	$t0, $v0
	#Khoi tao 1 mang
	la	$t1, mang1
	li	$t2, 0	
	li	$t3, 0		#i = 0
pushloop:
	rem	$t4, $t0, 10
	subu	$sp, $sp, 4
	sw	$t4, ($t1)
	add	$t1, $t1, 4
	div	$t5, $t0, 10
	add	$t0, $t5, 0
	add	$t3, $t3, 1
	bgt	$t5, $t2, pushloop
	# Xuat chuoi so dao nguoc
	la	$t1, mang1
	li	$t6, 0
printLoop:
	li	$v0, 1
	lw	$a0, ($t1)
	syscall
	add	$t6, $t6, 1	#k = k + 1
	addi	$t1, $t1, 4	#Tang dia chi mang1
	blt	$t6, $t3, printLoop
	#Exit
	li	$v0, 10
	syscall
.end main