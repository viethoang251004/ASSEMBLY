#Viet chuong trinh con tim USCLN cua 2 so a, b
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 12/1/2023
#Version:1
.data
	answer:	.word 0
	a:	.asciiz "nhap a: "
	b:	.asciiz  "nhap b: "
	bien:	.asciiz "uoc chung lon nhat la: "
.text
.globl main
main:
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	move $t1, $v0	#nhap a
	li $v0, 4
	la $a0, b
	syscall
	li $v0, 5
	syscall
	move $t0, $v0	#nhap b
	#Goi ctc
	jal power
	li $v0, 10
	syscall
.end main
#Chuong trinh con
.globl power
.ent power
power:
	li $t6, 0
	li $t2, 1 #i = 1
	li $t3, -1000 #max = -1000
	blt $t1, $t0, abehonb
bbehona:
	move $t8, $t0 #be = b
	j loop
abehonb:      
	move $t8, $t1 #be = a
loop:
	rem $t5, $t1, $t2
	beq $t5, $t6, chiahet1  #a % i == 0
	addi $t2, $t2, 1
	ble $t2, $t8, loop
	j exitloop
chiahet1:
	rem $t7, $t0, $t2
	beq $t7, $t6, chiahet2 #b % i == 0
	addi $t2, $t2, 1
	ble $t2, $t8, loop
	j exitloop
chiahet2:
	bgt $t2, $t3, lonhonmax  #i > max
	addi $t2, $t2, 1
	ble $t2, $t8, loop
	j exitloop
lonhonmax:
	move $t3, $t2
	addi $t2, $t2, 1
	ble $t2, $t8, loop
exitloop:
	li $v0, 4
	la $a0, bien
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	jr $ra
.end power