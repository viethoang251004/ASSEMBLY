#Bai thuc hanh lab6
#Cau5
#Viet doan code nhap vao mot so nguyen, xuat ra thong bao do la so duong, so am, hay so 0
#Day 1(22/12/2022)
#Ho va ten: Nguyen Dinh Viet Hoang
#25/10/2004
#MSSV: 522H0120
#Version: 1.0
.data
	Thongbao: .asciiz "Moi ban nhap vao so nguyen N: "
	Lon0: .asciiz "Lon hon 0"
	Be0: .asciiz "Be hon 0"
	Bang0: .asciiz "Bang 0"
.text
.globl main
main:
	li $v0, 4
	la $a0, Thongbao
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	beqz $t1, Banghon0
	bgt $t1, $zero, Lonhon0
	li $v0, 4
	la $a0, Be0
	syscall
	j Exit

Lonhon0:
	li $v0, 4
	la $a0, Lon0
	syscall
	j Exit
Banghon0:
	li $v0, 4
	la $a0, Bang0
	syscall
	j Exit
Exit:
	li $v0, 10
	syscall
