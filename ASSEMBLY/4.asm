#Viet chuong trinh con kiem tra so chinh phuong
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 12/1/2023
#Version:1
.data
	answer:	.word 0
	n:	.asciiz "nhap n: "
	bien1:	.asciiz " la so chinh phuong" 
	bien2:	.asciiz " khong la so chinh phuong"
.text
.globl main
main:
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	move $t1, $v0	#nhap n
	#Goi ctc
	jal power
	li $v0, 10
	syscall
.end main
#Chuong trinh con
.globl power
.ent power
power:
	li $t5, 1	#i = 1 
looppow:
	mul $t6, $t5, $t5
	beq $t6, $t1, sochinhphuong
kophai:
	addi $t5, $t5, 1
	ble $t5, $t1, looppow
	j klscp
sochinhphuong:
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, bien1
	syscall
	j exitloop
klscp:
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, bien2
	syscall
exitloop:
	jr $ra
.end power