#Bai thuc hanh lab6
#Cau6
#Viet doan code cho nhap vao 2 so nguyen a va b, xac dinh a > b hay b > a hay 2 so bang nhau
#Day 1(22/12/2022)
#Ho va ten: Nguyen Dinh Viet Hoang
#25/10/2004
#MSSV: 522H0120
#Version: 1.0
.data
	Thongbao1: .asciiz "Moi ban nhap so nguyen a: "
	Thongbao2: .asciiz "Moi ban nhap so nguyen b: "
	Lon: .asciiz "a lon hon b"
	Be: .asciiz "a be hon b"
	Bang: .asciiz "a bang b"
.text
.globl main
main:
	li $v0, 4
	la $a0, Thongbao1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, Thongbao2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	bgt $t1, $t2, Lonhon
	blt $t1, $t2, Behon
	li $v0, 4
	la $a0, Bang
	syscall
	j Exit
Lonhon:
	li $v0, 4
	la $a0, Lon
	syscall
	j Exit
Behon:
	li $v0, 4
	la $a0, Be
	syscall
	j Exit
Exit:
	li $v0, 10
	syscall