#Viet chuong trinh nhap vao 1 mang gom N so nguyen bat ky (N nhap tu ban phim), xuat mang theo thu tu nguoc lai
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 18/1/2023
#Version: 1.0
.data
	NhapN:	.asciiz "Nhap so N trong mang: "
	phay:	.asciiz "," 
	mang1:	.word 0
	mang2:	.word 0
	mang3:	.word 0
.text
.globl main
main:
	#Nhap vao N so nguyen
	li	$v0, 4
	la	$a0, NhapN
	syscall
	#Doc so nguyen N
	li	$v0, 5
	syscall
	move	$t0, $v0
	#Khoi tao mang
	la	$s0, mang2	#Load array address
	li	$s1, 0		#i = 0
#Nhap vao mang cac gia tri
readLoop:
	li	$v0, 5
	syscall
	sw	$v0, ($s0)
	addi	$s1, $s1, 1
	add	$s0, $s0, 4
	bne	$s1, $t0, readLoop
	#Khoi tao stack
	la	$t1, mang2	#Load array address
	li	$t2, 0		#i = 0
#Vong lap de doc cac gia tri dua tu mang vao Stack
pushLoop:
	lw	$t3, ($t1)	#Get array[i]
	subu	$sp, $sp, 4	#$sp: stack pointer register
	sw	$t3, ($sp) 	#Push to stack
	add	$t2, $t2, 1	#i = i + 1
	add	$t1, $t1, 4	#Update array address
	blt	$t2, $t0, pushLoop
	#Tao mot mang moi de luu gia tri
	la	$t4, mang3	#Load array address
	li	$t5, 0		#i = 0
#Vong lap de dua cac so tu Stack vao mang moi
popLoop:
	lw	$t3, ($sp)	#Get value from stack to t4
	addu	$sp, $sp, 4	#Tang Stack
	sw	$t3, ($t4)	#Store to array
	add	$t5, $t5, 1	#i = i + 1
	add	$t4, $t4, 4	#Update array address
	blt	$t5, $t0, popLoop
	#Print ra mang moi
	la	$t4, mang3	#Load array address
	li	$t5, 0		#i = 0	
printLoop:
	li	$v0, 1
	lw	$a0, ($t4)
	syscall
	#Print dau phay
	li	$v0, 4
	la	$a0, phay
	syscall
	add	$t5, $t5, 1	#i = i + 1
	addi	$t4, $t4, 4	#Tang dia chi array
	bne	$t5, $t0, printLoop
	#Exit
	li	$v0, 10
	syscall
.end main