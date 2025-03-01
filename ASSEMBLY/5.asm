#Viet chuong trinh con kiem tra so nguyen to
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 12/1/2023
#Version:1
.data
	bienn:	.asciiz "nhap n: "
	bien1:	.asciiz " la so nguyen to"
	bien2:	.asciiz " ko la so nguyen to"
.text
.globl main
main:
	li $v0, 4
	la $a0, bienn
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
	li $t2, 1	#i = 1
	li $t5, 0 
	li $t6, 0	#dem = 0
	li $t7, 2 
	loop:
	rem $t3, $t1, $t2	#$t3 du
	beq $t3, $t5, chiahet
kochiahet:
	addi $t2, $t2, 1	#i = i + 1
	ble $t2, $t1, loop
chiahet:
	addi $t6, $t6, 1	#dem = dem +1
	addi $t2, $t2, 1	#i=i+1
	ble $t2, $t1, loop
exitloop:
	ble $t6, $t7, songuyento
kolasonguyento:
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, bien2
	syscall
	j exit
songuyento:
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, bien1
	syscall
exit:
	jr $ra
.end power