#Bai thuc hanh lab6
#Cau4
#Viet doan code nhap vao mot so nguyen, neu do la so chia het cho 3 thi thong bao ra man hinh
#Day 1(22/12/2022)
#Ho va ten: Nguyen Dinh Viet Hoang
#25/10/2004
#MSSV: 522H0120
#Version: 1.0
.data
	Thongbao: .asciiz "Moi ban nhap vao so nguyen N: "
	Ketqua: .asciiz "Chia het cho 3"
	Sai: .asciiz "Khong chia het cho 3"
.text
.globl main
main:
	li $v0, 4
	la $a0, Thongbao
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	rem $t0, $t1, 3
	li $t2, 0
	bne $t0, $t2, Saiketqua
	li $v0, 4
	la $a0, Ketqua
	syscall
	j Exit
Saiketqua:
	li $v0, 4
	la $a0, Sai
	syscall
Exit:
	li $v0, 10
	syscall
