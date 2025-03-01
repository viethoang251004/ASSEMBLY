#Bai thuc hanh lab6
#Cau7
#Viet doan code cho nhap mot so nguyen duong n, va neu nguoi dung nhap so am hoac so 0 thi yeu cau nhap lai cho den khi nao nhan duoc gia tri nguyen duong
#Day 1(22/12/2022)
#Ho va ten: Nguyen Dinh Viet Hoang
#25/10/2004
#MSSV: 522H0120
#Version: 1.0
.data
	Thongbao1: .asciiz "Nhap so nguyen duong n: "
	Thongbao2: .asciiz "Nhap lai: "
.text
.globl main
main:
Repeat:
	li $v0, 4
	la $a0, Thongbao1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	bgt $t1, $t2, Exit
	li $v0, 4
	la $a0, Thongbao2
	syscall
	j Repeat
Exit:
	li $v0, 10
	syscall