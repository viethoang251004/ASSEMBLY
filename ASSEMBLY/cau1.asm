#Bai thuc hanh lab6
#Cau1
#Viet chuong trinh nhap vao mot so nguyen N, tinh tong cac so tu 1 den N
#Day 1(22/12/2022)
#Ho va ten: Nguyen Dinh Viet Hoang
#25/10/2004
#MSSV: 522H0120
#Version: 1.0
.data
	Thongbao: .asciiz "Moi ban nhap vao so nguyen N: "
.text
.globl main
main:
	li $v0, 4
	la $a0, Thongbao
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	li $t0, 0
	li $t1, 1
LoopSum:
	bgt $t1, $t2, ExitLoop
	add $t0, $t0, $t1
	addi $t1, $t1, 1
	j LoopSum
ExitLoop:
	li $v0, 1
	move $a0, $t0
	syscall
