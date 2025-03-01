#Viet chuong trinh tim so min, max cua cac phan tu trong mang
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 4/1/2023
#Version:1

.data
	mang1: .word 0
	soluong: .asciiz "So luong phan tu: \n"
	msgnhap: .asciiz "Nhap mang: "
	Max: .asciiz "Max la: "
	Min: .asciiz "\nMin la: "
	space: .asciiz " "
.text
.globl main
main: 
	li $v0, 4
	la $a0,  soluong
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	li $v0, 4
	la $a0, msgnhap
	syscall
#Khoi tao ban dau
	la $s0, mang1
	li $s1, 0
	
#Nhap mang
readloop:
	#Get a integer number
	li $v0, 5
	syscall 
	sw $v0, ($s0)
	addi $s1, $s1, 1 #i=i+1
	addi $s0, $s0, 4
	bne $s1, $s2, readloop
#Xet max/min
	la, $s0, mang1
	li $s1, 0
	lw $t1, 0($s0) #t1=max
	lw $t2, 0($s0) #t2=min
loop:
	bge $s1, $s2, exit
	lw $t0, ($s0)
	bgt $t0, $t1, maxinput
	blt $t0, $t2, mininput
cont:
	addi $s1, $s1, 1 #i=i+1
	addi $s0, $s0, 4
	j loop
#Max
maxinput:
	move $t1, $t0
	j cont
#Min
mininput:
	move $t2, $t0
	j cont
#Xuat ket qua
exit:
	li $v0, 4
	la $a0, Max
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, Min
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
#exit
	li $v0, 10
	syscall
.end main