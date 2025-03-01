#Bai thuc hanh lab6
#Cau8
#Nhap vao hai so nguyen duong a va b, tinh tong cac so nguyen duong co gia tri nam trong doan [a,b]
#Day 1(22/12/2022)
#Ho va ten: Nguyen Dinh Viet Hoang
#25/10/2004
#MSSV: 522H0120
#Version: 1.0
.data
	Thongbao1: .asciiz "Nhap so nguyen a: \n"
	Thongbao2: .asciiz "Nhap so nguyen b: \n"
	Thongbao3: .asciiz "Nhap lai: \n"
	Ketqua: .asciiz "Ket qua: \n"
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
	li $v0, 4
	la $a0, Thongbao2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	li $t0, 0
	add $t3, $t1, $zero
	bge $t1, $zero, SumLoop
		li $v0, 4
		la $a0, Thongbao3
		syscall
		j Repeat
	bge $t2, $zero, SumLoop
		li $v0, 4
		la $a0, Thongbao3
		syscall
		j Repeat
SumLoop:
	bgt $t3, $t2, Exit
	add $t0, $t0, $t3
	addi $t3, $t3, 1
	j SumLoop
Exit:
	li $v0, 4
	la $a0, Ketqua
	syscall