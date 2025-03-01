#Viet chuong trinh nhap vao 2 so nguyen a, b. Xuat ra man hinh ket qua cua bieu thuc: ab - 12b + 7a (Dung stack)
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 18/1/2023
#Version: 1.0
.data
	Nhapa:		.asciiz "Nhap vao a: "
	Nhapb:		.asciiz "Nhap vao b: "
	xuatkq:		.asciiz "ab - 12b + 7a = "
	kq:		.word   0
	stack:		.word   0
	array:		.word   0
.text
.globl main
main:
	#Nhap vao a
	li	$v0, 4
	la	$a0, Nhapa
	syscall
	li	$v0, 5
	syscall
	move	$t1, $v0
	#Nhap vao b
	li	$v0, 4
	la	$a0, Nhapb
	syscall
	li	$v0, 5
	syscall
	move	$t2, $v0
	#Khoi tao Stack
	la	$t3, array
	#Tinh cac ket qua tung phan
	mul	$t5, $t1, $t2
	subu	$sp, $sp, 4
	sw	$t5, ($sp)
	add	$t3, $t3, 4	#update address array
	li	$t6, -12
	mul	$t7, $t6, $t2
	subu	$sp, $sp, 4
	sw	$t7, ($sp)
	add	$t3, $t3, 4	#update address array
	li	$t8, 7
	mul	$t9, $t8, $t1
	subu	$sp, $sp, 4
	sw	$t9, ($sp)
	add	$t3, $t3, 4	#update address array
	#Vong lap lay cac ket qua cong lai
	li	$s1, 0		#i = 0
	li	$s2, 0		#sum = 0
	li	$s3, 3
poploop:
	lw	$s4, ($sp)
	addu	$sp, $sp, 4
	add	$s2, $s2, $s4	
	add	$s1, $s1, 1	#i = i + 1	
	blt	$s1, $s3, poploop
	sw	$s2, kq
	#Print ket qua bieu thuc ab - 12b + 7a
	li	$v0, 4
	la	$a0, xuatkq
	syscall
	li	$v0, 1
	lw	$a0, kq
	syscall
	#Exit
	li	$v0, 10
	syscall
.end main